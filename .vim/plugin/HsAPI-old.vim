
" Note: this is needed for initial autoload?
" func! HsAPIExplore#start()
  " echo 'HsAPIExplore#start'
" endfunc

" let g:ScratchBuffername = 'HsAPIExplore'

" Todos: still use real(scratch) buffer as it would allow to
" - add intero-tests to better understand/document functions
" - load it into the repl(?)
" - have the floating win as overlay (multiple floating wins are difficult(?)
" - keep the buffer (more to a separate tab/split, save, ect?)


" Ord a => [a] -> [a]
" Data.Set.insert
" +bytestring concat

nnoremap ,gsd :call HsAPIQueryShowFloat( HsCursorKeyword(), 15, 0 )<cr>
vnoremap ,gsd :call HsAPIQueryShowFloat( GetVisSel(),       15, 0 )<cr>
nnoremap ,gSd :call HsAPIQueryShowFloat( HsCursorKeyword(), 60, 0 )<cr>
vnoremap ,gSd :call HsAPIQueryShowFloat( GetVisSel(),       60, 0 )<cr>

nnoremap ,gsD :call HsAPIQueryShowFloat( input( 'HsAPI query: ', HsCursorKeyword()), 15, 0 )<cr>
vnoremap ,gsD :call HsAPIQueryShowFloat( input( 'HsAPI query: ', GetVisSel()),       15, 0 )<cr>
nnoremap ,gSD :call HsAPIQueryShowFloat( input( 'HsAPI query: ', HsCursorKeyword()), 60, 0 )<cr>
vnoremap ,gSD :call HsAPIQueryShowFloat( input( 'HsAPI query: ', GetVisSel()),       60, 0 )<cr>


let g:hoogle_search_buf_size = 10
let g:hoogle_search_count = 30

func! CleanBrowseOutput_bak() " ■
  " Crop namespaces e.g. (Data.Vector.Generic.Base.Vector v a,
  " find first '.', yank the last word, select all, paste
  exec 'g/\i\.\i/normal! f.Eb"tyeBvE"tp'
  " as this crops only the first long namespace, make a second pass
  exec 'g/\i\.\i/normal! f.Eb"tyeBvE"tp'

  " join lines that end with => or :: or ,  - needs several passes
  exec 'g/\(,\|=>\|::\)$/normal! J'
  exec 'g/\(,\|=>\|::\)$/normal! J'
  exec 'g/\(,\|=>\|::\)$/normal! J'
  " or begin with '->'
  exec 'g/^\s*->/normal! kJ'

  " Move classes to the end of buffer
  " exec 'g/class/m$'
  exec 'g/class/d'
  exec 'g/\.\.\./d'
endfunc " ▲

func! HsAPIQueryShowBuf( searchStr, count, infoFlag )
  let hoogleCmd = GetAPICmdStr( a:searchStr, a:count, a:infoFlag )
  let hoogleLines = split( system( hoogleCmd ), '\n' )
  call ActivateScratchWindow('APIquery')
  normal! VGd
  call append( line(1), hoogleLines )
  if !a:infoFlag
    " Delete commented lines
    exec 'g/--/d'
    " Put namespace in separate line. For all lines, line break after big-word (no trailing whitespace), comment the module line
    exec 'g/./normal! Whiki-- '
    " Issue: commenting/uncommenting this line inserts '\' after the 'Whi'
    " call FloatWin_do( 'g/./normal! Whi\ki-- ' )
    " call HsAlignTypeSigs()
    call AlignBufferTypeSigs()
  else
    exec 'normal jjgc}'
  endif

  call HaskellSyntaxAdditions()
  exec 'normal! gg0'
endfunc

func! HsAPIQueryShowFloat( searchStr, count, infoFlag )
  let hoogleCmd = GetAPICmdStr( a:searchStr, a:count, a:infoFlag )
  let hoogleLines = split( system( hoogleCmd ), '\n' )
  call FloatWin_ShowLines( hoogleLines )

  if !a:infoFlag
    " Delete commented lines
    call FloatWin_do( 'g/--/d' )
    " Put namespace in separate line. For all lines, line break after big-word (no trailing whitespace), comment the module line
    call FloatWin_do( 'g/./normal! Whiki-- ' )
    " Issue: commenting/uncommenting this line inserts '\' after the 'Whi'
    " call FloatWin_do( 'g/./normal! Whi\ki-- ' )
    call FloatWin_do( 'call HsAlignTypeSigs()' )
  else
    call FloatWin_do( 'normal jjgc}' )
  endif

  call FloatWin_do( 'call HaskellSyntaxAdditions()' )

  call FloatWin_do( 'normal! gg0' )
  call FloatWin_FitWidthHeight()
endfunc


" Global command tricks:
" prefix a string to some lines
" g/These/s/^/!
" replace the first word in some lines
" g/These/s/^\w*/XX
" Fast delete to blackhole register
" :g/pattern/"_d
" join lines that end with => or :: or ,
" g/\(,\|=>\|::\)$/normal! J
" run only on pattern matched range!
" :g/<p1>/,/<p2>/d deletes inclusively from /<p1>/ to /<p2>/
" /<p>/- and /<p>/+ mean “the line before and after the match”.
" reduce a sequence of empty lines into a single line
" :map ;b   GoZ<Esc>:g/^$/.,/./-j<CR>Gdd
" Put namespace in separate line. For all lines that has one char, line break after big-word (no trailing whitespace), comment the module line
" exec 'g/./normal! Whi\ki-- '

" Todo: one command that
" - persists the buffer into the project folder (but it stays in the same split-below win)
" RenameBuffer ./test/Align1.hs (use `.` and past seachstr)
" - creates concealed toplevelbinds with the full Namespace? Data.List.zip - with type-sig
" - loads into repl
" allow langserver types, docs
" allow intero repl
" RenameBuffer /Users/andreas.thoelke/Documents/Haskell/6/HsTrainingTypeClasses1/test/test23.hs
" Prefix type-sigs with 'cb..'?
" don't seem to need a module name?
















