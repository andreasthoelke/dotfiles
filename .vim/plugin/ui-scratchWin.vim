" ─   Scratch Window                                     ■

nnoremap <leader>os :ScratchWindow<cr>

command! ScratchWindow call ActivateScratchWindow( 'scratch' )

" Create or just activate/focus a disposable window
" TODO this currently writes a file names after bufferNameId - there is an option that would work without a written file
func! ActivateScratchWindow( bufferNameId )
  let bufNr = bufnr( a:bufferNameId )
  let winNr = bufwinnr( bufNr )
  " This makes sure we (1) have a buffer that (2) is visible and (3) the cursor is in it
  if bufNr == -1
    " There is no scratch buffer with 'bufferNameId' yet, so create a new buffer
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

" 
func! ScratchWin_Show( id, linesToShow )
  call ActivateScratchWindow( a:id )
  normal! ggVGd
  call append( line(1), a:linesToShow )
  exec 'normal! gg0'
endfunc
" call ScratchWin_Show( 'test1', ['hi there!', 'second line'] )
" call ScratchWin_Show( 'test1', ['.. just one line!'] )
" ─^  Scratch Window                                     ▲

