
func! HsAPIExplore#start()
  " echo 'HsAPIExplore#start'
endfunc


let g:hoogle_search_buf_size = 10
let g:hoogle_search_count = 30




" 1. activate scratch win
" call ActivateScratchWindow('Test2')
"
" 2.1 get keyword, visual-sel, operator, type signature
" 2.2 assemble cmd string with options for 3 main usecases
" " browse long list in buffer
" let g:cmd1 = 'hoogle replicateM -n=20'
" " description
" let g:cmd1 = 'hoogle Control.Monad.replicateM --info'
" " short inline api
" let g:cmd1 = 'hoogle replicateM -n=3'
"
" 3.1 clear any previous content
" 3.2. run cmd and fill buffer with results
" call append( 25, split( system( g:cmd1 ), '\n' ) )
"
" 4. align tabularize
"
" 5. conceal style
"
" 6. setup local maps

nnoremap gsd :call HsAPIQueryShow( HsCursorKeyword(), 15, 0 )<cr>
vnoremap gsd :call HsAPIQueryShow( GetVisSel(),       15, 0 )<cr>
nnoremap gSd :call HsAPIQueryShow( HsCursorKeyword(), 60, 0 )<cr>
vnoremap gSd :call HsAPIQueryShow( GetVisSel(),       60, 0 )<cr>

nnoremap gsD :call HsAPIQueryShow( input( 'HsAPI query: ', HsCursorKeyword()), 15, 0 )<cr>
vnoremap gsD :call HsAPIQueryShow( input( 'HsAPI query: ', GetVisSel()),       15, 0 )<cr>
nnoremap gSD :call HsAPIQueryShow( input( 'HsAPI query: ', HsCursorKeyword()), 60, 0 )<cr>
vnoremap gSD :call HsAPIQueryShow( input( 'HsAPI query: ', GetVisSel()),       60, 0 )<cr>

nnoremap gsk :call HsAPIQueryShow( HsCursorKeyword(), 15, 1 )<cr>
vnoremap gsk :call HsAPIQueryShow( GetVisSel(),       15, 1 )<cr>


func! HsAPIQueryShow( searchStr, count, infoFlag )
  let hoogleCmd = GetAPICmdStr( a:searchStr, a:count, a:infoFlag )
  let hoogleLines = split( system( hoogleCmd ), '\n' )

  call FloatWin_ShowLines( hoogleLines )

  call FloatWin_do( 'call HaskellSyntaxAdditions()' )

  if !a:infoFlag
    " Delete commented lines
    call FloatWin_do( 'g/--/d' )
    " Put namespace in separate line. For all lines, line break after big-word (no trailing whitespace), comment the module line
    call FloatWin_do( 'g/./normal! Whi0i-- ' )

    " call FloatWin_do( 'call HsTabularizeTypeSigns( 1, ' . ((a:count*2)-0) . ')' )
    call FloatWin_do( 'call HsTabularizeTypeSigns( 1, line("$") )' )
  endif

  " if len( s:async_alignFnExpr )
  "   call FloatWin_do( 'call ' . s:async_alignFnExpr )
  " endif

  call FloatWin_do( 'normal! gg' )
  call FloatWin_FitWidthHeight()
endfunc


" func! HsExtractTypeFromLine( lineNr )
" func! HsCursorKeyword()

func! s:formatBuffer()
  "Syntax
  set syntax=purescript
  " Delete commented lines
  exec "g/--/d"
  " Put namespace in separate line. For all lines, line break after big-word (no trailing whitespace), comment the module line
  exec "g/./normal! Whi0i-- "
  " Unicode
  call ExecRange( "HsReplaceCharsToUnicode", 1, line('$') )
  " Align
  call HsTabularizeTypeSigns( 1, line('$') )
  normal! gg
endfunc
" Note: need to source this with line select - because of the special chars?


func! HoogleFormatInfoOutput()
  let l:sig = getline( '.' )
  normal! ddi-- 
  call append( 1, l:sig)
  normal! jo{-
  " call PurescriptUnicode()
  set syntax=purescript
  normal gg
endfunc

func! GetAPICmdStr( query, limit, infoFlag )
  let infoArg = a:infoFlag ? ' --info' : ''
  return 'hoogle "' . a:query . '" -n=' . a:limit . infoArg
endfunc


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
  let l:split_line_prev = split( getline(line('.') -1) )
  let l:split_line      = split( getline('.') )
  call HoogleCloseSearch()
  let l:module     = l:split_line_prev[ 1 ]
  let l:identifier = l:split_line[ 0 ]
  call HsImport( l:module, l:identifier )
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



fun! HsImport(module, symbol)
  call hsimport#imp_symbol(a:module, a:symbol, expand('%'))
endfun
" call HsImport("Control.Monad", "replicateM")



" HOOGLE INCLUDE NEW LIBS:
" "hoogle generate base lense" will download and install only the base and
" lense libs.
" open ":e hoogle-defaults" from the root of the project folder, add/delete
" libs, then <backspace> in first line to have everything in one row, and
" copy-paste into terminal
" https://github.com/ndmitchell/hoogle/blob/master/docs/Install.md
" Todo: get hoogle libs from cabal file


