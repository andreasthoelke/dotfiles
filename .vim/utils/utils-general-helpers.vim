

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


func! MakeBufferDisposable() "{{{
  setl buftype=nofile
  setl bufhidden=hide
  setl noswapfile
  " Buffer is shown with ':ls' but not ctrlP
  setl buflisted
endfunc "}}}

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



