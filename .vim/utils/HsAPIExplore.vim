

" UTILS: --------------------------------------------------------------

func! FlipListList ( listList )
  let flippedList = []
  for [fst, snd] in a:listList
    call add( flippedList, [snd, fst] )
  endfor
  return flippedList
endfunc
" echo FlipListList( [[11, 22], [33, 44]] )

func! ReplaceStringsInRange( listListMap ) range
  let rangeStr = a:firstline . ',' . a:lastline
  for [target, replacement] in a:listListMap
    " Note the "\%V" flag/atom makes the pattern effective only in the visual selection
    exec 'silent ' . rangeStr 's/\%V' . target . '/' . replacement . '/ge'
  endfor
endfunc
command! -range -nargs=1 ReplaceStringsInRange :<line1>,<line2>call ReplaceStringsInRange( <args> )
" source (<leader>se) the following line to test
" .+1,.+2MapStringsInRange [['ab', 'CD'], ['x', 'Y']]
" test ab cd ef xyz
" test gh ab xf xab
" Note the "\%V" flag/atom makes the pattern effective only in the visual selection
" %s/\%Vab/XX/g

  " operator for motion/ range/selection of text
  " can transform this text in place
  "   - replace all chars with _
  "   - hs unicode replace
  " side effect/action with this text/string (or further filtered) as input
    " copy motion below paragraph
" ====

" Operator And Movement:{{{
" Operator pending map: to fill in the movement after an operator key has been pressed
" - If your operator-pending mapping ends with some text visually selected, Vim will operate on that text.
" - Otherwise, Vim will operate on the text between the original cursor position and the new position.
" Search to the prev ===..= regex, then at the line above set a visual highlight to the end of the line
noremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
" Find vimcommentTitle then visualselect till end of the line
noremap ih :<c-u>execute "normal! ?^.*:$\rv$"<cr>
" Exec will substitute special characters before running. \r means "carriage return". The double backslash puts a literal backslash in the string.
" call append( 39, '**')
" exe sl.','.el 's/\%'.sc.'c\|\%'.ec.'c.\zs/\=s/g|norm!``'
" .+1s/aa/bb
" xx aa cc
" let g:aab = 'XY'
" .+1s/aa/\=g:aab
" xx aa cc
" Replace within a range of columns
" .+2s/\%>7caa/XX/g
" .+1s/\%>2c\%<7caa/XX/g
" xx aa cc aa xx
" exec ".+2s/\\%>2c\\%<7caa/XX/g"
" exec ".+1s/aa/XX/g"
" xx aa cc ee ll aa xx
" .+1s//XX/g
" xx aa cc ee ll aa xx
" Run A Regex Search: Note this uses literal strings *only* for the regex part
" exec "normal! gg" . '/for .\+ in .\+:' . "\<cr>"
" Note Question: why does the very magic mode not work here? vimscript book chapter 31
" exec "normal! gg" . '/\vfor .\+ in .\+:' . "\<cr>"
" }}}

nnoremap <silent> <leader>at :set opfunc=ReplaceLastPattern<cr>g@
vnoremap <silent> <leader>at :<c-u>call ReplaceLastPattern(visualmode(), 1)<cr>

func! ReplaceLastPattern( motionType, ...)
  let lastPattern = histget( 'search', -1 )
  let replacementText = input('Enter replacement text: ')
  let linesRangeMarkersStr = a:0 ? "'<,'>" : "'[,']"
  let substCmdAccum = l:linesRangeMarkersStr . 's/'
  " Line and column of start+end of either vis-sel or motion
  let [startLine, startColumn] = getpos(a:0 ? "'<" : "'[")[1:2]
  let [endLine,   endColumn]   = getpos(a:0 ? "'>" : "']")[1:2]
  if a:motionType == 'char'
    let substCmdAccum .= '\%>' . startColumn . 'c\%<' . endColumn . 'c'
  endif
  let substCmdAccum .= lastPattern . "/" . replacementText . "/ge"
  call ExecKeepView( substCmdAccum )
  " Notes:{{{
  " call ExecKeepView( "'[,']s/\\%>15c/_/ge|norm!``" )
  " let debugStr = startLine . ' ' . endLine . ' ' . startColumn . ' ' . endColumn
  " let insertChar = nr2char( getchar() )
  " Issue: this does not work in this function
  " call highlightedyank#highlight#add( 'Search', getpos("'<"), getpos("'>"), 'char', 4000)
  " this does work
  " call nvim_buf_add_highlight( bufnr(''), g:nsid_def, 'Search', line('.')-3, 1, 100)
  " if a:motionType == 'line' || a:motionType == 'V'
  " elseif a:motionType == 'block' || a:motionType == "\<c-v>"}}}
endfunc
" Regex Demo: run next line then put cursor on 'aa' in next line, them opfunction = $ motion
" call histadd( 'search', '[ew]\s' )
" xx ww aa at cc ee ax ww ll aa xx
" xx ww aa at cc ee ax ww ll aa xx


" Make sure the cursor position and view does not change when running the ex-command
func! ExecKeepView(arg)
  let l:winview = winsaveview()
  exec a:arg
  call winrestview(l:winview)
endfunc


function! Get_visual_selection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0]  = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction



func! MakeBufferDisposable()
  setl buftype=nofile
  setl bufhidden=hide
  setl noswapfile
  " Buffer is shown with ':ls' but not ctrlP
  setl buflisted
endfunc

" Like <cword> but includes Haskell symbol characters
func! HsCursorKeyword()
  let isk = &l:isk
  " Tempoarily extend the isKeyword character range
  setl isk+=.,<,>,$,#,+,-,*,/,%,',&,=,!,:,124,~,?,^
  let keyword = expand("<cword>")
  let &l:isk = isk
  return keyword
endfunc

" Get the type signature from line
func! HsExtractTypeFromLine( lineNr )
  let line  = getline( a:lineNr )
  let pattern = '\v^.*(∷|:)\ze'
  return substitute( line, pattern, '', '')
endfunc
" Control.Monad replicateM :: (Applicative m) => Int -> m a -> m [a]
" echo HsExtractTypeFromLine( line('.')-1 )
" Control.Monad replicateM ∷ (Applicative m) => Int -> m a -> m [a]
" echo HsExtractTypeFromLine( line('.')-1 )

nnoremap cuf :%s/forall/<c-k>FA/ge<cr>
nnoremap cuc :%s/::/<c-k>::/ge<cr>
nnoremap cua :%s/->/<c-k>->/ge<cr>
nnoremap cub :%s/<-/<c-k><-/ge<cr>
nnoremap cue :%s/>=>/>#>/ge<cr>
" safe Kleisi!
nnoremap cud :%s/=>/<c-k>=>/ge<cr>
nnoremap cug :%s/>#>/>=>/ge<cr>
" restore Kleisi!

func! PreserveKleisliInUnicodeReplace( listListMap )
  call insert( a:listListMap, ['>=>', '>#>'] )
  call add   ( a:listListMap, ['>#>', '>=>'] )
  return a:listListMap
endfunc
" echo PreserveKleisliInUnicodeReplace( [['=>', '⇒'], ['c', 'd']] )

func! RequireSpaceBeforeOperatorChars( listListMap )
  let augmentedListList = []
  for [fst, snd] in a:listListMap
    call add( augmentedListList, [ '\s\zs' . fst, snd ] )
  endfor
  return augmentedListList
endfunc
" echo RequireSpaceBeforeOperatorChars( [['aa', 'bb'], ['=>', '⇒']] )

let g:ScratchBuffername = 'HsAPIExplore'

let g:HsReplacemMap_CharsToUnicode = [['->', '→'], ['=>', '⇒'], ['::', '∷'], ['forall', '∀'], ["<-", "←"]]
let g:HsReplacemMap_UnicodeToChars = FlipListList( g:HsReplacemMap_CharsToUnicode )

command! -range=% HsReplaceCharsToUnicode :<line1>,<line2>call ReplaceStringsInRange( RequireSpaceBeforeOperatorChars( g:HsReplacemMap_CharsToUnicode ) )
command! -range=% HsReplaceUnicodeToChars :<line1>,<line2>call ReplaceStringsInRange( g:HsReplacemMap_UnicodeToChars )
" .+3HsReplaceCharsToUnicode
" .,+6HsReplaceCharsToUnicode
" .,+6HsReplaceUnicodeToChars
" Control.Monad replicateM :: (Applicative m) => Int -> m a -> m [a]
" unfold :: Monad m => (b -> Maybe (a, b)) -> b -> Producer m a
" kleisli :: forall e. Example e >=> Line
" kleisli = do aa <- example

" UTILS: --------------------------------------------------------------


func! HsReplaceCharsWithUnicode( str )
  let str1 = substitute( a:str, '::', '∷', '')
  return str1
endfunc



fun! HoogleForVisSel()
  let g:originFile = expand('%')
  exec 'silent! s/\%V→/->'
  exec 'silent! s/\%V∷/::'
  exec 'silent! s/\%V⇒/=>'
  let keyw = Get_visual_selection()


" Create or just activate/focus a disposable window
func! ActivateScratchWindow( bufferNameId )
  let bufNr = bufnr( a:bufferNameId )
  let winNr = bufwinnr( bufNr )
  " This makes sure we (1) have a buffer that (2) is visible and (3) the cursor is in it
  if bufNr == -1
    " There is no scratch buffer with 'bufferNameId' yet, so creat a new buffer
    " this will also open a window (1)
    exec 'new ' . a:bufferNameId
  else
    " In case there is a buffer, check if it's open in a win
    if winNr == -1
      " Open a split window of that buffer(nr) (2)
      exec 'sbuffer ' bufNr
    else
      " The win was already open
      if winNr != winnr()
        " The cursor is not already in that window, so jump to it (3)
        exec winNr . 'wincmd w'
      endif
    endif
  endif
  call MakeBufferDisposable()
endfunc
" call ActivateScratchWindow('Test2')

func! QueryCmdStr( query, limit, description )
  let infoArg = if a:description ' --info'
  return 'hoogle "' . a:query . '" -n=' . limit . infoArg
endfunc


1. activate scratch win
call ActivateScratchWindow('Test2')

2.1 get keyword, operator, type signature
2.2 assemble cmd string with options for 3 main usecases
" browse long list in buffer 
let g:cmd1 = 'hoogle replicateM -n=20'
" description
let g:cmd1 = 'hoogle Control.Monad.replicateM --info'
" short inline api 
let g:cmd1 = 'hoogle replicateM -n=3'

3.1 clear any previous content
3.2. run cmd and fill buffer with results
call append( 25, split( system( g:cmd1 ), '\n' ) )

4. align tabularize

5. conceal style

6. setup local maps



" Check whether the scratch buffer is already created
let scr_bufnum = bufnr(g:ScratchBufferName)
if scr_bufnum == -1
  " open a new scratch buffer
  if split_win
    exe "new " . g:ScratchBufferName
  else
    exe "edit " . g:ScratchBufferName
  endif
else
  " Scratch buffer is already created. Check whether it is open
  " in one of the windows
  let scr_winnum = bufwinnr(scr_bufnum)
  if scr_winnum != -1
    " Jump to the window which has the scratch buffer if we are not
    " already in that window
    if winnr() != scr_winnum
      exe scr_winnum . "wincmd w"
    endif
  else
    " Create a new scratch buffer
    if split_win
      exe "split +buffer" . scr_bufnum
    else
      exe "buffer " . scr_bufnum
    endif
  endif
endif




" HOOGLE INCLUDE NEW LIBS:
" "hoogle generate base lense" will download and install only the base and
" lense libs.
" open ":e hoogle-defaults" from the root of the project folder, add/delete
" libs, then <backspace> in first line to have everything in one row, and
" copy-paste into terminal
" https://github.com/ndmitchell/hoogle/blob/master/docs/Install.md
" Todo: get hoogle libs from cabal file

let g:hoogle_search_buf_size = 10
let g:hoogle_search_count = 30

" Split module into separate, commented line
func! HoogleFormatOutput()
  " call PurescriptUnicode()
  set syntax=purescript
  exec "g/--/d"
  " For all lines: line break after big-word (no training whitespace), comment the module line
  exec "g/./normal Whi0i-- "
  normal gg
endfunc
" Note: need to source this with line select - because of the special chars?

func! HoogleAlignSinatures()
  GTabularize /∷/
  GTabularize /⇒/
  GTabularize /.*\zs→/
endfunc


"
func! HoogleFormatInfoOutput()
  let l:sig = getline( '.' )
  normal! ddi-- 
  call append( 1, l:sig)
  normal! jo{-
  call PurescriptUnicode()
  set syntax=purescript
  normal gg
endfunc

" ALIGNING COLUMS OF HASKELL SIGS:{{{
" run: :browse Data.List.Split in GHCi and copy into a vim buffer
"
" align right to ∷ with padding 1:
" '<,'>Tabularize /::/r1c1l1
" move lines that contain "Splitter" to the bottom of the file!
" g/Splitter/m$
" move lines with two occurences of "Splitter" to the bottom
" g/Splitter.*Splitter/m$
" move lines with "Eq" to line 22!
" '<,'>g/Eq/m22

" format hoogle output from
" Prelude print ∷ Show a ⇒ a → IO ()
" to
" -- Prelude
" print ∷ Show a ⇒ a → IO ()
" let @o = 'f Jki-- jk^jj'
" align the type-signature with EasyAlign
" let @p = 'gcaap '
" changed this from gaap to gcaap to have 'ga' as fee mapping
" Wi\0i-- jj
" used in hoogle.vim: (!) (TODO: refactor this)
" if a:args != ' --info'
"   normal gg
"   normal 10@o
"   normal gg
"   normal @p
" endif}}}

" Import Haskell Identifiers Using Hoogle And Hsimport:{{{
" 1. Use "gsd" ("go search docs") on a missing identifier
" 2. In the hoogle list of available identifiers, go to the line/version you
" want to import and run <leader>ii to import the identifier (confirm the import
" section of your source file has added the identifier)
" See HoogleImportIdentifier in vimrc and
" /Users/andreas.thoelke/.vim/plugged/vim-hoogle/plugin/hoogle.vim
" also note the "HOOGLE INCLUDE NEW LIBS:" comment in vimrc
" Sparse Hoogle Infos: https://github.com/ndmitchell/hoogle/blob/master/docs/Install.md}}}

" EXAMPLES:{{{
" Can import this (which is split in two lines in the Hoggle result window)
" Prelude putStrLn ∷ String → IO ()
" Hoogle TODO support these:
" Data.Aeson data Value
" Data.Aeson type Array = Vector Value
" Data.Aeson class ToJSON a
" Data.Aeson (.=) ∷ (KeyValue kv, ToJSON v) ⇒ Text → v → kv}}}
func! HoogleImportIdentifier() "{{{
  let l:prev_line = getline(line('.') -1)
  let l:cur_line  = getline('.')
  let l:split_line_prev = split(l:prev_line)
  let l:split_line      = split(l:cur_line)
  call HoogleCloseSearch()
  let l:module     = l:split_line_prev[ 1 ]
  let l:identifier = l:split_line[ 0 ]
  call Hsimp( l:module, l:identifier )
  " normal! <c-w>k{{{
  " if &mod
  "   echo "Please save before importing!"
  "   return
  " endif
  " let l:imp1 = l:split_line[0]
  " let l:imp2 = l:split_line[1]
  " if l:imp2 == "data" || l:imp2 == "type" || l:imp2 == "class"
  "   let l:imp2 = l:split_line[2]
  " endif
  " if l:imp2[0] == "("
  "   let l:imp2 = StripString( l:imp2, "(" )
  "   let l:imp2 = StripString( l:imp2, ")" )
  " endif
  " call Hsimp( l:imp1, l:imp2)
  "update format of the import list}}}
  call StylishHaskell()
endfunction "}}}

func! HoogleInsert( symbolOrModulePath, args )
  let l:cmd = 'hoogle ' . a:symbolOrModulePath . a:args
  let l:resultLines = split( system( l:cmd ), '\n' )
  " Don't need to repeat the function signature
  " call remove( l:resultLines, 0 )
  " echo split( system( 'hoogle Data.Conduit.List.replicateM --info' ), '\n' )
  " echo split( system( 'hoogle zipwith --info' ), '\n' )
  " Remove empty lines at the end --------------
  let l:idx_lastLine = len( l:resultLines ) - 1
  let l:lastLineText = l:resultLines[ l:idx_lastLine ]
  if l:lastLineText == ''
    call remove( l:resultLines, l:idx_lastLine )
  endif
  let l:idx_lastLine = len( l:resultLines ) - 1
  let l:lastLineText = l:resultLines[ l:idx_lastLine ]
  if l:lastLineText == ''
    call remove( l:resultLines, l:idx_lastLine )
  endif
  " Remove empty lines at the end --------------
  " Open comment at the end of the last line
  let l:resultLines[ 1 ] = '{- ' . l:resultLines[ 1 ]
  " Close comment at the end of the last line
  let l:idx_lastLine = len( l:resultLines ) - 1
  let l:text_lastLine = l:resultLines[ l:idx_lastLine ]
  let l:resultLines[ l:idx_lastLine ] = l:text_lastLine . ' -}'
  call append( line('.'), l:resultLines )
  " call append( line('.'), split( system( 'hoogle Data.Conduit.List.replicateM --info' ), '\n' ) )
endfunc


func! HoogleLineJump() "{{{
  let l:prev_line = getline(line('.') -1)
  let l:cur_line  = getline('.')
  let l:split_line_prev = split(l:prev_line)
  let l:split_line      = split(l:cur_line)
  let l:module     = l:split_line_prev[ 1 ]
  let l:identifier = l:split_line[ 0 ]
  let l:module_symbol_str = l:module . '.' . l:identifier
  " since results are given in the format `Data.IntMap.Strict lookup :: Key -> IntMap a -> Maybe a`
  " this results in a search of `Data.IntMap.Strict.lookup`
  " call HoogleLookup( l:module_symbol_str, ' --info' )
  call HoogleInsert( l:module_symbol_str, ' --info' )
endfunction "}}}
" To go back to the search results overview, just run the previous search again
" nnoremap <silent> <buffer> <localleader><c-o> <esc>:call HoogleLookup( g:hoogle_prev_search, '' )<cr>
" nnoremap <silent> <buffer> <localleader><c-o> :call HoogleGoBack()<cr>

" call Hsimp("Control.Monad", "replicateM")
fun! Hsimp(module, symbol)
  call hsimport#imp_symbol(a:module, a:symbol)
endfun

command! Run    :call HaskellStackRun()
command! Style  :call StylishHaskell()
command! Indent :call StylishHaskell()

noremap <leader>ci :call StylishHaskell()<cr>

setlocal formatprg=stylish-haskell
" use <motion>gq
" .. but not working properly, e.g. messing up line breaks
" free mapping: <c-g> - currently show the current filename

