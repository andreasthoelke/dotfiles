
" TODO: 
" show a type missmatch error in two lines in the code view:
" redirect command echo text to register: :redir @t,
" take the last line.
" src/Callback1.purs|222 col 24 error| 222:65:  Could not match type ( console ∷ CONSOLE , timeout ∷ TIMEOUT | t1 ) with type ( timeout ∷ TIMEOUT | eff0 ) while trying to match type Eff ( console ∷ CONSOLE , timeout ∷ TIMEOUT | t1 ) with type Eff ( timeout ∷ TIMEOUT | eff0 ) while checking that expression (apply ContT) (\k → (setTimeoutImpl mills) (k unit) ) has type ContT Unit (Eff ( timeout ∷ TIMEOUT | eff0 ) ) Unit in value declaration setTimeoutCont where eff0 is a rigid type variable t1 is an unknown type
" find 'while' 4 words 'v' find 'with' find 'while' again
" src/Callback1.purs|222 col 24 error| 222:65:  Could not match type ( console ∷ CONSOLE , timeout ∷ TIMEOUT | t1 ) with type ( timeout ∷ TIMEOUT | eff0 ) while trying to match type 
" IS:
" Eff ( console ∷ CONSOLE , timeout ∷ TIMEOUT | t1 ) with type 
" SHOULD BE:
" Eff ( timeout ∷ TIMEOUT | eff0 ) 
" while checking that expression (apply ContT) (\k → (setTimeoutImpl mills) (k unit) ) has type ContT Unit (Eff ( timeout ∷ TIMEOUT | eff0 ) ) Unit in value declaration setTimeoutCont where eff0 is a rigid type variable t1 is an unknown type

" PURESCRIPT WORKFLOW:
" "mkdir test1" && "cd test1" && "pulp init" && "nvim Main.purs"
" TODO: run this command from vim: ":PursProject test2" → 
" "mkdir <projname> && cd <projname> && pulp init && vi src/Main.purs"
" ":PursRepl" will start a pulp repl terminal session
" "gw" saving refeshes syntasic
" "dr" rebuilds syntasic and :r to pulp repl + imports
" "gei" works on commented expression, toplevel functions and just
" expression (until the end of the line)
" "gsd" and "gsh" for Pursuit
" use ":PursInstall maps" to "bower install --save purescript-maps" package
" "gas" to apply syntastic suggestions
" ":Pimport foldl" or "gip" to see an import menu
" use "gel" (it just runs the complete line on psci, (or gei) on an "import Control.Monad.Eff (Eff)" to import identifiers into psci
" use "gel" on ":kind Eff", will return # Control.Monad.Eff.Effect → Type → Type
" run "gel" on "import Control.Monad.Eff" (anywhere on the line), then to
" "gel" on ":kind Eff"
" -- :kind Const
" -- Type → Type → Type
" make sure to run do "gel" on "import Data.Const (Const(..))" first to
" import. TODO: command to run "gel" on all lines with "import .."
"
" Repl Eval Insert: ------------------------------------------------
" Evaluate a string in the Repl (purs or ghci) and insert the result of the evaluation
" gee → expr after -- (comment)
"       expr after =
"       selection
" gel → entire line
" gew → keyword
" (cursor-column is only significant for gew)
"
" --------------------------------------------------------------------------------
" "RUN IN NODE.JS - RUN A SIDE EFFECTING FUNCTION IN NODE"
" --------------------------------------------------------------------------------
" "pulp --watch run --main Learn3" will run the 'main' in Lear3 module in "node.js" with JS side-effects
" TODO: have a separate pulp run terminal process and paste output below main
" after each save.
" -- example:
" -- kima1 git:(master) ✗ pulp -w run -m Aff1
"
" --------------------------------------------------------------------------------
" "RUN IN BROWSER - LOAD PROJECT INTO BROWSER"
" --------------------------------------------------------------------------------
" 1. create a "index.html" file in the project root using the html below.  ":e index.html" 
" 2. make sure you are in the project root (run "dpr") then do "glt" to lanch a terminal
" 3. run "pulp -w build -to app.js" to watch-build an app.js bundle that will be loaded by index.html. 
" 4. enable live reloading in chrome
" 5. you can run "PS.Main.myfunction(12)('secondarg')" in the Chrome console to call purescript function in the Main module. 
" Eff functions can be called like "PS.Main.main()"
"
" Use this as "index.html":
" <html PUBLIC "-//W3C//DTD HTML 4.01//EN">
" <html>
"     <head>
"         <title>purescript</title>
"     </head>
"     <body>
"         <canvas id="canvas" width="300" height="300"></canvas>
"         <div id="aabb">aabb text</div>
"         <script src="app.js" type="text/javascript"></script>
"     </body>
" </html>
"
" Browserify is only needed when npn modules are used?
" "pulp --watch browserify --to dist/Main.js"
" TODO: have a separate --watch browserify process that can be killed or
"     : or, don't use --watch and just fire (via key-mapping e.g. "geb") and forget a browserify process that disposes itseft
"
" BUILD A SUB PROJECT/EXAMPLE IN A FOLDER: 
" "pulp --watch build -I examples/counter/src --to examples/counter/app.js -m Counter.Main"
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

" TODO: use call PSCIDEListImports and send import statements to repl one by
" one to have the same symbols available in the repl as in the module.
"
" "PSCID" just run "pscid" in project root folder to get something similar to
" "ghcid" (see below)

" source "/Users/andreas.thoelke/.vim/utils/termin1.vim"

" HASKELL WORKFLOW:
"   <leader>io to open intero
"   <leader>ih to hide the intero window
"   <leader>il to load the module
"           dr to type-check the file
"           qq to show errors
"           ]e to jump to next error
"
"   tt or tw or tg to insert type
"   gei to insert return val → works also on commented lines
"   <leader>kk run it in the vim-terminal mode:
"                            use i to type and c-\ c-n to leave insert mode
" use this to format imports/code
" noremap <leader>ci :call StylishHaskell()<cr>
" important: you have to save bofore otherwise new code will be deleted and
" the can't be undoed!!
" also for new projects the ".stylish-haskell" file form "hello44" has to be
" copied to the project root. Important setting is grouping the language
" pragmas 
" use ":browse Web.Spock" in Intero/Ghci to see all loaded vars
" use <leader>to and <leader>th to open and close "Tagbar" (a list of the the
" top-level functions) hit return to jump to a functions, see the focus light
" update in 500ms intervals.
" Find A Typesignature In The Project: run ":Find 'Value → Parser'" also just "//" on the visual selection to search in the same buffer
" Get the type of do-binds by producing a type error:
" nnoremap <leader>cco "tyiwolet (xb0 :: Int) = <esc>"tp^
" Use Hoogle In Vim: "gsd" "go search docs" or "gsh" "go seach hoogle" on visual selection (including type signatures!)
" or keyword to view the search results, then <c-]> on a specific line to see details. 
" then "gsd" again on the keyword to go back to the overview. 
" Import Haskell Identifiers Using Hoogle And Hsimport:
" 1. Use "gsd" ("go search docs") on a missing identifier or e.g. ":Hoogle replicateM"/ or "Hoogle (Applicative m) ⇒ Int → m a → m [a]"
" 2. In the hoogle list of available identifiers, go to the line/version you want to import and 
" run <leader>ii to import the identifier (confirm the import section of your source file has added the identifier)
" See HoogleImportIdentifier in vimrc and /Users/andreas.thoelke/.vim/plugged/vim-hoogle/plugin/hoogle.vim
" also note the "HOOGLE INCLUDE NEW LIBS:" comment in vimrc

" GHCID:
" RELOAD WEBSERVER:
" e.g. reload any long running process with "ghcid" by calling a test-suite
" function
" 1. In the .cabal file change the "main-is:" to the file/module of the main
" function that ghcid should call:
" test-suite hello44-test
"   type:                exitcode-stdio-1.0
"   hs-source-dirs:      test
"   main-is:             src/Spock3.hs
" 2. Launch a terminal with "glt" + "ghcid -T :main"
" this now runs independant of Intero and compiles+reloads on save file,
" showing errors, ect.

" Just run an app based on a mobule file: xstack runghc helloworld.hs"


" Ale: -------------------------------------------------------------------------------
" shows the underlined warning (Data.Char)
" and the listing in the loclist
" navigation via ]w [w
" Updates live/no safe required
" Does not require intero running
" This will be hlint based + errors!? For Hlint config use :Hlint… command
"
" Neomake: ---------------------------------------------------------------------------
" shows the intero (ghci) warnings
" /requires intero to run. Requires a “dr” /reload to update
" Example screenshot in Evernote shows “-Wunused-imports warning
" Warnings show in quickfix-list: navigate via ]e [e
" Configured via intero_ghci_options:
" let g:intero_ghci_options = '-Wall -Wno-unused-matches -Wno-missing-signatures -Wno-type-defaults -Wno-unused-top-binds'
"
" <leader>oq opens all warnings? (how to exclude .vimrc warnings?)

" VIM WORKFLOW:    
" Open File With CTRLP: do "<leader>oj" and use <c-j>, <c-k> and fuzzy search to get to recent files
" and open offers, changed hunks?
" Quick Vim Help: use "K" on work/string that's in the vim help, e.g. this
" word: session_autoload
" Temp Buffer: ":sp" ":e temp" 
" Check Error Messages: quick error messages that occur on startup can be seen
" with ":messages" command, and then copied, etc.
" Question: how can I copy echoed text?
" Open Url In Browser: "glb" "Go launch browser" on the visual selection of
" the URL


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

" Git Workflow Commit:  --------------------------------------------------------------------------
" Make a git commit to dotfiles of .vimrc , etc to https://github.com/andreasthoelke/dotfiles  
" 1. open a terminal at "~" (root folder), "ls -a" confirms that ".vimrc" file is
" at the users root directory
" 2. "git status" should show:
" Changes not staged for commit:
"   (use "git add <file>..." to update what will be committed)
"   (use "git checkout -- <file>..." to discard changes in working directory)
"         modified:   .vim/colors/molokai.vim
"         modified:   .vim/utils/termin1.vim
"         modified:   .vimrc
" You can use <c-j>, <c-k> to scroll and "q" to quit the view.
" 3. Review changes to get an idea of a commit message. Use:
" nmap <leader>gg :GitGutterToggle<cr>
" nmap ]c <Plug>GitGutterNextHunk
" nmap [c <Plug>GitGutterPrevHunk
" you may use GitGutterUndoHunk (leader hr) to see what was changed
" 4. Use a temp buffer to make notes for the commit message
" 5. Run "git add .vimrc .vim/utils/termin1.vim .vim/colors/molokai.vim" (copy
" paste this string? 
" or alternatively:
" ➜  ~ git:(master) ✗ git add .vimrc
" ➜  ~ git:(master) ✗ git add .vim/utils/termin1.vim
" ➜  ~ git:(master) ✗ git add .vim/colors/molokai.vim
" (Note that fugitive :Gstatus does not work here somehow -
" " it makes it much easier to stage/unstage files)
" 6. After confirming with "git status" again, with the commit message in the yank register, create the 
" following line in the terminal (enter "git commit -m '" then paste the yanked text.
" git commit -m "Spell command, use Stackage seach, HaskellProjectName, haskell- git- vim- process documentation in termin1"
" 7. Run "git push". Then the commit should show up here: "glb" on "https://github.com/andreasthoelke/dotfiles/commits/master" 
" For a new repo: Link local repo to github remote repo:
" "git remote add origin https://github.com/andreasthoelke/dotfiles.git", 
" "git push -u origin master" `-u` add upstream tracking(!?)
" "git pull --rebase origin" pull in changes from remote, put all local changes on top of it.


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



