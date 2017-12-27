

" PURESCRIPT WORKFLOW:
" "mkdir test1" && "cd test1" && "pulp init" && "nvim Main.purs"
" ":PursRepl" will start a pulp repl terminal session
" "gw" saving refeshes syntasic
" "dr" rebuilds syntasic and :r to pulp repl + imports
" "gei" works on commented expression, toplevel functions and just
" expression (until the end of the line)
" "gsd" and "gsh" for Pursuit
" use ":PursInstall maps" to "bower install --save purescript-maps" package
" "gas" to apply syntastic suggestions
" ":Pimport foldl" or "gip" to see an import menu
" "pulp --watch run --main Learn3" will run the 'main' in Lear3 module in "node.js" with JS side-effects
" TODO: have a separate pulp run terminal process and paste output below main
" after each save.
" use "gep" (it just runs the complete line on psci, (or gei) on an "import Control.Monad.Eff (Eff)" to import identifiers into psci
" use "gep" on ":kind Eff", will return # Control.Monad.Eff.Effect -> Type -> Type
" "pulp --watch browserify --to dist/Main.js"
" TODO: have a separate --watch browserify process that can be killed or
"     : or, don't use --watch and just fire (via key-mapping e.g. "geb") and forget a browserify process that disposes itseft

" TODO: attach callbacks to a visible terminal process
" TODO: past and then call a test-function, instead of reloading the whole
" Prob: can't redefine declarations! so could send this only once and would
" have to inc the index of the symbol next time
" file :paste
" … withError Nothing  err = Left err
" … withError (Just a) _   = Right a
" … ^D
" TODO: make a queue of caller/command ids: put e.g. "type-insert" into the queue when
" jobsend is issued. then in OnEv1 read (and delete) the last command id and
" use it to apply a specific parsing of the returned data.
" TODO: errors in loclist should be wrapped, colored, unicoded

" TODO: What does Purscript project folder require so vim sets the working
" folder correctly? .DS_Store, .purs-repl, .git/??:

" source "/Users/andreas.thoelke/.vim/utils/termin1.vim"

" INTERO WORKFLOW:
"
"   <leader>io to open intero
"   <leader>il to load the module
"           dr to type-check the file
"           qq to show errors
"           ]e to jump to next error
"
"   tt or tw or tg to insert type
"   gei to insert return val → works also on commented lines
"   <leader>kk run it in the vim-terminal mode:
"                            use i to type and c-\ c-n to leave insert mode


" NEOVIM TERMINAL MODE: ----------------------------------------------------------
if has('nvim')
  " nnoremap <leader>af ipwd<cr><C-\><C-n>kyy:cd <c-r>"<cr>
  nnoremap <leader>af ipwd<cr><C-\><C-n>yy
  nnoremap <leader>ag :cd <c-r>"<cr>

  tnoremap jk <C-\><C-n>

  " jump window up from terminal mode
  tnoremap <c-w>k <C-\><C-n><c-w>k
  tnoremap <silent><c-\>x <C-\><C-n>:bw!<cr>
  tnoremap <c-w>c <C-\><C-n>:bw!<cr>
  " TODO: or just hide the buffer/close the window?
  nnoremap <silent><c-\>x <C-\><C-n>:bw!<cr>
endif

command! Restart call jobsend( b:terminal_job_id, "\<C-c>npm run server\<CR>")

" TIP:  --------------------------------------------------------------------------
" NEOVIM REMOTE: start nvim like this:
" NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim
" "nvr -l thefilename.hs" from terminal mode to open file in other window.
" the manual is here "~/.vim/utils/neovim-remote.md" (just 'gf' on this path!)
" https://github.com/mhinz/neovim-remote
" parametrising a vim-command (examples):
"    echo "echo 'hi'" | nvr -c -
"    nvr -c "cd $(pwd) | pwd"
" --------------------------------------------------------------------------------



function! OnEv1(job_id, data, event) dict
  normal }k

  "TODO: echoe a:data, if =~ '>' → filter out these lines

  if a:event == 'stdout'
    " call append(line('.'), a:data[0])
    if a:data[0] =~ 'Error'
      call append(line('.'), a:data)
    else
      call append(line('.'), a:data)
      " call append(line('.'), a:data[0])
    endif

  elseif a:event == 'stderr'
    call append(line('.'), a:data)
    " let str = self.shell.' stderr: '.join(a:data)
  else
    call append(line('.'), "Unknown event?!")
    " let str = self.shell.' exited'
  endif

  call PurescriptUnicode()
endfunction

" jobsend(7, "ls\n")

" TODO:
" function! PursPaste(expr)
"   call jobsend(g:PursReplID, ":paste " . a:expr . "^D\n")
" endfun

function! PursEval(expr)
  call jobsend(g:PursReplID, a:expr . "\n")
endfun

function! PursType(expr)
  call jobsend(g:PursReplID, ":type " . a:expr . "\n")
endfun

let Cbs1 = {
\ 'on_stdout': function('OnEv1'),
\ 'on_stderr': function('OnEv1'),
\ 'on_exit': function('OnEv1')
\ }

command! PursRepl :let PursReplID = jobstart("pulp repl", Cbs1)

" ----------------------------------------------------------------------------------



" INSTALLING A PACKAGE REQUIRES:
" "bower install --save <packagename> | pulp build"
command! -nargs=1 -complete=custom,PSCIDEcompleteIdentifier
         \ PursInstall
         \ echom jobstart("bower install --save purescript-" . <q-args> . " && pulp build", Cbs1)


" nnoremap <leader>sx y$:echom <c-r>"<cr>

"com! -buffer -nargs=* -complete=custom,PSCIDEcompleteIdentifier
"       \ Ptype
"       \ call PSCIDEtype(len(<q-args>) ? <q-args> : PSCIDEgetKeyword(), v:true)
" com! -buffer -nargs=1 -complete=custom,PSCIDEcompleteIdentifier
"       \ Psearch
"       \ call PSCIDEsearch(len(<q-args>) ? <q-args> : PSCIDEgetKeyword())


" ----------------------------------------------------------------------------------
" 1. <leader>su to compile this script
" 2. run this line with <leader>sx
" jobstart("pulp repl", Cbs1)
" 3. check that the returned int is 7
" ----------------------------------------------------------------------------------



