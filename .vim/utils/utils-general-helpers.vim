

" Somewhat simplifies running a command on a range of lines
func! ExecRange( cmd, startLine, endLine )
  let rangeStr = a:startLine . ',' . a:endLine
  exec rangeStr . a:cmd
endfunc

func! FlipListList ( listList )
  let flippedList = []
  for [fst, snd] in a:listList
    call add( flippedList, [snd, fst] )
  endfor
  return flippedList
endfunc
" echo FlipListList( [[11, 22], [33, 44]] )

func! TrimListOfStr( listOfStr )
  return map( a:listOfStr, {key, val -> trim(val)} )
endfunc
" echo map( [" eins ", " zwei"], {key, val -> trim(val)} )

func! Reduce( funcRef, list)
  let acc = ''
  for val in a:list[0:]
    let acc = a:funcRef(acc, val)
  endfor
  return acc
endfun
" echo Reduce( {acc, nextStr -> acc . '(i∷ ' . nextStr . ') '}, ['a → b', 'Maybe a'] )[:-2] . '!'


func! MakeBufferDisposable()
  setl buftype=nofile
  setl bufhidden=hide
  setl noswapfile
  " Buffer is shown with ':ls' but not ctrlP
  setl buflisted
endfunc

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


" ─   Links Rel                                          ■

nnoremap <leader>cl :call LinkRefToClipBoard()<cr>
command! LinkRefToClipBoard call LinkRefToClipBoard()

func! LinkRefToClipBoard()
  let lineText = getline('.')
  let lineText = substitute( lineText, '"\s', '', 'g' )
  let lineText = substitute( lineText, '─', '', 'g' )
  let lineText = substitute( lineText, '■', '', 'g' )
  let lineText = substitute( lineText, ':', '.', 'g' )
  " These substitutes allow linking to a vimscript function (also see not allowed char in rel.vim)
  let lineText = substitute( lineText, '!', '.', 'g' )
  let lineText = substitute( lineText, '(\|)', '.', 'g' )
  " echo substitute( getline('.'), '─\|"', '', 'g' )
  let [w1;mayW3] = split( lineText )
  let searchStr = '#/'.w1
  if len( mayW3 )
    let searchStr .= '%20'.mayW3[0]
  endif
  if len( mayW3 ) > 1
    let searchStr .= '%20'.mayW3[1]
  endif
  let lineRef = expand('%:p') . searchStr
  let lineRef = substitute( lineRef, '/Users/andreas.thoelke/', '~/', 'g' )
  echo 'Copied this text-link-reference to clipboard:'
  echo lineRef
  let @*= lineRef
endfunc
" Example: ~/.vim/utils/utils-general-helpers.vim#/Create%20or%20just
" ~/.vim/utils/utils-general-helpers.vim#/LinkRefToClipBoard()
" Now works also on code markup lines
" ~/.vim/utils/utils-general-helpers.vim#/Links%20Rel%20■

" Basically I want:
" Here is a concealedlink: ..*notes-todos.md//Release notes v1.1.2*
" where the abs path is hidden and the text is readable without the %20
" ~/.vim/notes/notes-navigation.md#/Create%20hyperlink%20to

" ─^  Links Rel                                          ▲


nnoremap <leader>Sgs :call ShellReturn( 'git status' )<cr>
nnoremap <leader>Sgp :call ShellReturn( 'git push' )<cr>
nnoremap <leader>Sls :call ShellReturn( 'ls -a' )<cr>

func! ShellReturn( cmd )
  let resultLines = split( system( a:cmd ), '\n' )
  call FloatWinAndVirtText( resultLines )
endfunc

