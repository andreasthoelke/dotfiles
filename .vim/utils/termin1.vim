

" PURESCRIPT WORKFLOW:
" "mkdir test1" && "cd test1" && "pulp init" && "nvim Main.purs"
" ":PursRepl" will start a pulp repl terminal session
" "gw" saving refeshes syntasic
" "dr" rebuilds syntasic and :r to pulp repl + imports 
" "gei" works on commented expression, toplevel functions and just
" expression (until the end of the line)
" "gsd" and "gsh" for Pursuit


" TODO: attach callbacks to a visible terminal process

" source "/Users/andreas.thoelke/.vim/utils/termin1.vim"

" installing a package requires: 
" "bower install --save <packagename> | pulp build"


function! OnEv1(job_id, data, event) dict
  normal }k

  if a:event == 'stdout'
    " call append(line('.'), a:data[0])
    if a:data[0] =~ 'Error'
      call append(line('.'), a:data)
    else
      call append(line('.'), a:data[0])
    endif

  elseif a:event == 'stderr'
    call append(line('.'), a:data)
    " let str = self.shell.' stderr: '.join(a:data)
  else
    call append(line('.'), "Unknown event?!")
    " let str = self.shell.' exited'
  endif


endfunction

" jobsend(7, "ls\n")

function! PursEval(expr)
  call jobsend(g:PursReplID, a:expr . "\n")
endfun

let Cbs1 = {
\ 'on_stdout': function('OnEv1'),
\ 'on_stderr': function('OnEv1'),
\ 'on_exit': function('OnEv1')
\ }

command! PursRepl :let PursReplID = jobstart("pulp repl", Cbs1)

" ----------------------------------------------------------------------------------
" 1. <leader>su to compile this script
" 2. run this line with <leader>sx
" jobstart("pulp repl", Cbs1)
" 3. check that the returned int is 7
" ----------------------------------------------------------------------------------



" let repl1 = jobstart(['pulp repl'], s:callbacks)

" let job1 = jobstart(['bash'], extend({'shell': 'shell 1'}, s:callbacks))
" let job2 = jobstart(['bash', '-c', 'for i in {1..10}; do echo hello $i!; sleep 1; done'], extend({'shell': 'shell 2'}, s:callbacks))


" Description of what happens:
"   - Two bash shells are spawned by |jobstart()| with their stdin/stdout/stderr
"     streams connected to nvim.
"   - The first shell is idle, waiting to read commands from its stdin.
"   - The second shell is started with -c which executes the command (a for-loop
"     printing 0 through 9) and then exits.
"   - `OnEvent()` callback is passed to |jobstart()| to handle various job
"     events. It displays stdout/stderr data received from the shells.






