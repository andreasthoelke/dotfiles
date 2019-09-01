
nnoremap gsd :call HsAPIQueryShowBuf( HsCursorKeyword(), 15, 0 )<cr>
vnoremap gsd :call HsAPIQueryShowBuf( GetVisSel(),       15, 0 )<cr>
nnoremap gSd :call HsAPIQueryShowBuf( HsCursorKeyword(), 60, 0 )<cr>
vnoremap gSd :call HsAPIQueryShowBuf( GetVisSel(),       60, 0 )<cr>

nnoremap gsD :call HsAPIQueryShowBuf( input( 'HsAPI query: ', HsCursorKeyword()), 15, 0 )<cr>
vnoremap gsD :call HsAPIQueryShowBuf( input( 'HsAPI query: ', GetVisSel()),       15, 0 )<cr>
nnoremap gSD :call HsAPIQueryShowBuf( input( 'HsAPI query: ', HsCursorKeyword()), 60, 0 )<cr>
vnoremap gSD :call HsAPIQueryShowBuf( input( 'HsAPI query: ', GetVisSel()),       60, 0 )<cr>



nnoremap gsK :call HsAPIQueryShowFloat( HsCursorKeyword(), 0, 1 )<cr>
vnoremap gsK :call HsAPIQueryShowFloat( GetVisSel(),       0, 1 )<cr>

nnoremap gsk :call HsAPIQueryShowInline( HsCursorKeyword(), 0, 1 )<cr>
vnoremap gsk :call HsAPIQueryShowInline( GetVisSel(),       0, 1 )<cr>
" gsK to insert info into float win - using the module name

nnoremap gsb :call HsAPIBrowseShowBuf( HsCursorKeyword() )<cr>
vnoremap gsb :call HsAPIBrowseShowBuf( GetVisSel() )<cr>


func! HsAPIBrowseShowBuf( searchStr )
  let browseCmd = ':browse ' . a:searchStr
  call InteroEval( browseCmd, "HsAPIBrowseShowBuf_CB", '' )
endfunc

func! HsAPIBrowseShowBuf_CB( replReturnedLines )
  call ScratchWin_Show( 'APIquery', a:replReturnedLines )

  call CleanupBrowseOutput()

  " call AlignBufferTypeSigs()
  call ReplaceInRange( 1, line('$'), g:HsReplacemMap_CharsToUnicode )

  call HaskellSyntaxAdditions()
  exec 'normal! gg0'
endfunc

func! CropLeadingModuleNames()
  normal! f.Eb"tyEB
  if GetCharAtCursor() == '('
    normal! l
  endif
  normal! vE"tp
endfunc
" map' :: (Data.Profunctor.Mapping.Mapping p, Functor f) => p a b -> p (f a) (f b)
" call CropLeadingModuleNames()


func! CleanupBrowseOutput()
  let cmds = []
  " Crop namespaces e.g. (Data.Vector.Generic.Base.Vector v a,
  " find first '.', yank the last word, select all, paste
  " call add( cmds, 'g/\i\.\i/normal! f.Eb"tyEBvE"tp' )
  call add( cmds, 'g/\i\.\i/call CropLeadingModuleNames()' )
  " as this crops only the first long namespace, make a second pass
  call add( cmds, 'g/\i\.\i/call CropLeadingModuleNames()' )

  " join lines that end with => or :: or ,  - needs several passes
  call add( cmds, 'g/\(,\|=>\|::\)$/normal! J' )
  call add( cmds, 'g/\(,\|=>\|::\)$/normal! J' )
  call add( cmds, 'g/\(,\|=>\|::\)$/normal! J' )
  " or begin with '->'
  call add( cmds, 'g/^\s*->/normal! kJ' )

  " Move classes to the end of buffer
  " call add( cmds, 'g/class/m$' )
  call add( cmds, 'g/class/d' )
  call add( cmds, 'g/\.\.\./d' )

  call RunCmdsSilent( cmds )
endfunc

func! RunCmdsSilent( cmds )
  for cmd in a:cmds
    exec 'silent ' . cmd
  endfor
endfunc



func! HsAPIQueryShowInline( searchStr, count, infoFlag )
  let hoogleCmd = GetAPICmdStr( a:searchStr, a:count, a:infoFlag )
  let hoogleLines = split( system( hoogleCmd ), '\n' )
  call append( line('.'), hoogleLines )
  normal jjjgc}kkk
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
" Prelude putStrLn                                                   :: String                                    -> IO ()
" Hoogle TODO support these:
" Data.Aeson data Value
" Data.Aeson type Array = Vector Value
" Data.Aeson class ToJSON a
" Data.Aeson (.=)                                                    :: (KeyValue kv, ToJSON v) => Text -> v        -> kv}}}
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
  " since results are given in the format `Data.IntMap.Strict lookup :: Key                            -> IntMap a -> Maybe a`
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


