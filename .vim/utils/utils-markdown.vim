
" MARKDOWN: -----------------------------------------------------------------------

" This works! Opens a terminal with the running grip server process and moves the cursor to the browser
command! Demo1Markdown Dispatch grip -b %

" function! OpenMarkdownPreview() abort
"   " stops any previous/running job!
"   if exists('s:markdown_job_id')
"     silent! call jobstop(s:markdown_job_id)
"     unlet s:markdown_job_id
"   endif
"   let s:markdown_job_id = jobstart(
"     \ 'grip ' . shellescape(expand('%:p')) . " 0 2>&1 | awk '/Running/ { printf $4 }'",
"     \ { 'pty': 1, 'on_stdout': {_, output → system('open ' . output[0])} }
"     \ )
" endfunction

" a simpler version of the above
function! OpenMarkdownPreview() abort
  if exists('g:markdown_job_id') && g:markdown_job_id > 0
    call jobstop(g:markdown_job_id)
    unlet g:markdown_job_id
  endif
  let g:markdown_job_id = jobstart('grip ' . shellescape(expand('%:p')))
  if g:markdown_job_id <= 0 | return | endif
  " call system('open http://localhost:6419')
  call LaunchChromium( 'http://localhost:6419' )
endfunction

" MARKDOWN: -----------------------------------------------------------------------
