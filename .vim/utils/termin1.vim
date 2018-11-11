
" TODO: 
" show a type mismatch error in two lines in the code view:
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
" "gw" saving refeshes syntastic
" "dr" rebuilds syntastic and :r to pulp repl + imports
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
" 1. Create a "index.html" file in the project root using the html below.  ":e index.html" 
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
" nnoremap <leader>cco "tyiwolet (xb0 ∷ Int) = <esc>"tp^
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

" VIM WORKFLOW: ----------------------------------------------------------------------    
" Vim Help: use "K" e.g. on this word: session_autoload
" use ":hg<space to expand HelpGrep> <searchterm>", "]q/[q[Q" to browse. it uses ":cwindow" to fill the quickfix list!
" Redirecting Messages: run "RedirMessagesTab messages"
" Temp Split Buffer: - "<c-w>N" 
" Check Error Messages: quick error messages that occur on startup can be seen
" with ":messages" command, and then copied, etc.
" Question: how can I copy echoed text?
" Open Url In Browser: "glb" "Go launch browser" on the visual selection of
" the URL
" Insert Mode Movement: Use Fn Key + "h,j,k,l" to navigate in insert mode (see Karabiner setup: )
" Find Commands: use e.g. ":filter Intero command"
" Repeat Last Command: use "<leader>."
" Nerdtree: "go", Use "o" - "u", "C" to focus, "I" for hidden
" Find Free Mapping: e.g. use ":map <leader>i" to see all mappings that start like this
" run ":map <intended first keys>". ":unmap <first key><tab" .. shows what second
" key mappings need to be deleted to allow a fast/not delayed one key mapping
" Auto Format Code: e.g. json element: "=a}" ("format arount bracket"), document: "gg=G"
" Jump To Matching Bracket: simply "%"
" Previous Buffer: - "c-6"
" Insert File Context: - ":r <path-to-file>" to insert the content of a file!
" Command Suggestions: after "<Tab>" highlighted the first command suggestions, you can "<shift-tab>" to go back the the text you entered and type more chars to get better suggestions.
" Change Inner Big Word: - "abc" or (abc) can be changed nicely with "ciW"!
" Toggle Line Number And Wrap: - "yol", "yow"
" Repeat Last Command: - ","
" Find Search In Code: - "gsb" / "gsf" on code-word or visual selection to search buffers or project root files
"                        ":f " → ":Find " seach from project root or ":fb " → ":Findb " to search in buffer
"                        This will open the file and seach/grepper side split in a Tab. 
"                        Use "}" / "{" to jump files, then "n" to a specific occurence, then "o" to open the buffer in the left window
"                        now to continue collecting results, do "<c-w>n" " 
"                        do "m<abcd>" at a found result, then go to your original tab/window and do "'<abcd>" to load the result here
"                        "cd (..)" the current working dir to search across a specific folder
" Copy Paste File Path: - copy to "p" register "<leader>fpc": , insert: "<leader>fpi", echo: "<leader>fpe"
" Jump To File Path: in split below "<c-w>f", in tab "<c-w>gf"
" View A Folder Env Variable: e.g. VIMRUNTIMEPATH Folder: - "i<c-r>=$VIM<tab><cr>" in buffer, then "<c-w>f" to open Nerdtree.  Or ":NERDTree $VIM<tabs>"

" Spell Checking And Dictionaries: Toggle with "yos" ":Spell"/ "SpellDE"/ "SpellEN" on. "set nospell" turns it off
" Navigate errors: "]s" - "[s", show suggestions: "z=", add to dictionary: "zg" undo "zug"
" Go To Line: - ":123"!

" Debugging: use "set verbose=1 to 15", start without plugins/vimrc: "nvim -u NONE", 
" other vimrc: "nvim -u ~/.vim/bak/vimrc-22-09-2018.vim"
" Debug Test With Mini VIMRC One Plugin: - Start nvim loading vimrc from Gist!: nvim -Nu <(curl https://gist.githubusercontent.com/junegunn/6936bf79fedd3a079aeb1dd2f3c81ef5/raw/vimrc) "https://gist.githubusercontent.com/andreasthoelke/f223558ed5d89341c0f21c41868c92b0/raw/27028c93e046aa4a021fc97f8a59e60b774e0e38"
" Logging Autocommands: - :set verbose=9 - set verbosefile=filename.txt - session_autosave_periodic - http://inlehmansterms.net/2014/10/31/debugging-vim/
" set verbosefile=~/.vim/logs/autocmds112018-1.log
" set verbosefile=''
" Show Source Of Autocmds: - "verbose autocmd BufWritePost *"
" Debug a function: ":debug call FunctionName(arg)"
" Startup time: "nvim --startuptime ~/.vim/Logs/startup1.log" 
" Repeatable Map Setup: e.g. repeat <leader>abb by typing "."! Example RepeatVim Setup:
" nmap <Plug>Eins ieins<esc>:call repeat#set("\<Plug>Eins")<cr>
" nmap <leader>abb <Plug>Eins
" Registers: Default register: ("), Yank register: (0), Black hole register (_), 
" Access - "Ctrl-r" in insert and command mode, ("[name]) in normal mode
" Read Only Registers: Last insert ".", last command ":"
" Copy Between Registers: - "let @+=@%" (Copy current filepath to clipboard)
" Replace a word: On source word: "yiw" - on target: ("_diw) - then "P"
" Append Lines: - ":y a", ":y A", "," (repeat)
" map <Plug>YankCollectAsRowsInRegC <esc>:let @C=" \n " . Get_visual_selection()<cr>"Cy map <leader>yc
" map <leader>yc <Plug>YankCollectAsRowsInRegC

" Insert Mode: - "c-x" - "c-w" - "c-g, c-k"
" Insert Variable Content: - "<c-r>=ab<cr>" (that simple) using: let ab = "eins" . "\n" . "zwei"
" Visual Selection Mode: - use "o" to switch to control the start of the selection (see ":help v_o")
" use ":<c-U>" to delete '<,'> . but then how to refer to the selection? TODO
" This '<,'> reads: beginning: '< - comma - '> end
" use "gv" to reactive the prev selection or a selection created with "m<", "m>"

" VIM Plug Plugins:
" Use "PlugDiff" to see what has been updated. Recreate a Plugin Snapshot, specifying commits: .vim/Plug-Snapshots/Snap-02-11-2018.vim
" Diff Compare Files: - With two files side by side in a vertical split, use ":set scrollbind" to lock scrolling

" "g," - "g-;"

" VIM WORKFLOW: ----------------------------------------------------------------------    

" one two three four five
" Substitute Replace text: - ":s/zwei/xx/g" -  Examp text: eins zwei drei vier zwei acht
" Substitute flags: "g" = all occurances, "e" = surpress/continue at errors



" Shell WORKFLOW: ----------------------------------------------------------------------    
" Suspending Background Jobs In Same Terminal: - "<c-z>" to suspend, in terminal: "fg" to bring it back. "jobs" to see all suspended jobs, "fg %2" to bring back second job, "kill %2" to kill it, "bg" to have it running in the background, "ps T" will show a "T" for stopped processes
" Man Pages: - "man ranger" will now use nvim to show the man page, thanks to in .zshrc: export MANPAGER="nvim -c 'set ft=man' -"
" VMan To Read ManPages As PDF: -- "vman ls" from terminal to view ls man page in vim.
" Man And Help Outline: - "gO" content outline 
" Install Paths: -- "which zsh". 
" Brew Installs: Brew installs here: "/usr/local/bin/" use "ls -la /usr/local/bin/zs*" or "brew list", "brew info"
" Brew Cask: - "brew tap caskroom/versions" then "brew cask install iterm2-nightly" 
" Read User Shell From Directory Service: - "dscl . -read /Users/$USER UserShell"
" ITerm Windows: - "Arrangements" tab specifies init window arrangement, "Profiles" tab specifies how a new window is opened
" Quickly create and delete folders: "mkcd test2" then "rmcurdir"
"           Or just the classic way: "mkdir test3 && cd $_", "echo 'test' > test3", "rm *", "cd ..", "rmdir test3"
" Create Hard File Link: - "link target.txt linkname.something" - linkname reads and write to the same data on disk
" Symlink To Folder: - "ln -s ~/Documents/temp ~/Documents/temp2"
" Move Reference Of File Into Current Dir: - "ln subfolder/another/myfile.c" - now has "myfile.c" in the current dir.
" Append To File: - "echo 'next line ..' >> linkname". NOTE: "echo 'i deleted all!' > linkname" deletes the previous content of the file!
" Search In Filenames: - "ls -la ~/ | grep vim" 
" View STDOUT STDIN In Vim: - "grep 'vim' ~/.vimrc | nvim -" or "nvim <(ls -la)" (process substitution)


" Shell WORKFLOW: ----------------------------------------------------------------------    

" Tmux Workflow: -----------------------------------------------------------------------
" Lookup Manual: use "K" on a keyword in "~/.tmux.conf" to open manual entryj
" Run Tmux Commands: - "g!"

" Tmux Workflow: -----------------------------------------------------------------------

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
  nnoremap <localleader>bw <C-\><C-n>:bw!<cr>
endif

command! RestartNodeJs call jobsend( b:terminal_job_id, "\<C-c>npm run server\<CR>")

" TIP:  --------------------------------------------------------------------------
" NEOVIM REMOTE: start nvim like this: "NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim"
" "nvr -l thefilename.hs" from terminal mode to open file in other window.
" https://github.com/mhinz/neovim-remote
" parametrising a vim-command (examples):
"    echo "echo 'hi'" | nvr -c -
"    nvr -c "cd $(pwd) | pwd"
" --------------------------------------------------------------------------------

" GIT WORKFLOW:  --------------------------------------------------------------------------
" Make a git commit to dotfiles of .vimrc , etc to https://github.com/andreasthoelke/dotfiles  
" Git Commit: (using Fugitive)
" 1. "Gstatus" then use "-" to stage/unstage a changed file.
" 2. Review Changes: "D" (diff) on the file to view what has changed compared to the last commit.
"      Use "]c" to navigate and "do" in the right split to revert/undo a changed 'hunk' (go back to what was is in the last commit)
"      Note: This is super useful to selectivly roll back a change in some functions while keeping other/newer changes in other parts of the code.
"      Alternatively, the changes can also be review using Gitgutter (see 3. below)
" 3. Add notes for commit message to ~/.vim/notes/commit-nts1.txt
" Git Commit: (using terminal)
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
" 5. Run "git add .vimrc .vim/utils/termin1.vim .vim/colors/molokai.vim"
" 6. After confirming with "git status" again, with the commit message in the yank register, create the 
" following line in the terminal (enter "git commit -m '" then paste the yanked text.
" git commit -m "Spell command, use Stackage seach, HaskellProjectName, haskell- git- vim- process documentation in termin1"
" 7. Run "git push". Then the commit should show up here: glb on https://github.com/andreasthoelke/dotfiles/commits/master 
" For a new repo: Link local repo to github remote repo:
" "git remote add origin https://github.com/andreasthoelke/dotfiles.git", 
" "git push -u origin master" `-u` add upstream tracking(!?)
" "git pull --rebase origin" pull in changes from remote, put all local changes on top of it.
" Git Branch Merge: In the following example "freatue1" is a "feature branch". the code for the feature
" is just "feature1 implementation" here. After that feature is commited to the "freature1" branch first, it will then be merged into master.
"  mkdir gitmerge2 && $_                                                             integ-term-changes
"   gitmerge2  echo "base features" > file1                                          integ-term-changes
"  git init                                                              integ-term-changes
" Initialized empty Git repository in /Users/andreas.thoelke/Documents/temp/gitmerge2/.git/
"  git add file1                                                                     master
"  git commit -m "first commit"                                                      master
" [master (root-commit) 5f02eef] first commit
"  1 file changed, 1 insertion(+)
"  create mode 100644 file1
"  ⋯  Documents  temp  gitmerge2  git checkout -b feature1                                                          master
" Switched to a new branch 'feature1'
"  echo "feature1 implementation" >> file1                                  130   feature1
"  cat file1                                                                       feature1
" base features
" feature1 implementation
"  git status                                                                      feature1
"  git add file1                                                                   feature1
"  git commit -m "feature 1"                                                       feature1
" [feature1 8674a08] feature 1
"  1 file changed, 1 insertion(+)
"  git checkout master                                                             feature1
" Switched to branch 'master'
"  cat file1                                                                         master
" base features
"  git merge feature1                                                                master
" Updating 5f02eef..8674a08
" Fast-forward
"  file1 | 1 +
"  1 file changed, 1 insertion(+)
"  cat file1                                                                         master
" base features
" feature1 implementation
" Looking At A Past Commit: Look at the previous commit (HEAD~1):
"  ~  .vim  utils  "git checkout HEAD~1"                                                                   int-termin-changes
" HEAD is now at f3858c5 Gig commit, preparing release
"  ~  .vim  utils                                                                                                   f3858c5
" This has now created a tempoary branch. I could persist any commits I make in this temp branch to a
" new branch using git checkout -b <new-branch-name>
" Note that HEAD detached at f3858c5
" You can just go back to the previous HEAD by checking out the branch again:
"  ~  .vim  utils  git checkout optim-11-2018-1                                                              130   f3858c5
" Previous HEAD position was f3858c5 Gig commit, preparing release
" Switched to branch 'optim-11-2018-1'
"  ~  .vim  utils  git branch                                                                               optim-11-2018-1
" "git branch" shows that the temp branch is gone.
" Use Diff Before Add To Stage: - "git diff" 
" Unstage: - "git reset HEAD" or "git reset HEAD <filename>"
" Erease Delete The Last Commit: - "git reset HEAD~1" This will delete the commit entry but keep the current code (as unstaged changes in relation to the previous (now current) commit).
" Git Undo: - "git reset HEAD~1 --hard" will additionally checkout the previous branch and update/overwrite the working dir files! This is basically a real "undo". Note you still have to reload the files in vim.

" Three Statemanagement Mechanisms: Working Directory |>>| Staged Snapshot |>>| Commit History

" Staging To Git Index: -----------------------------------
" Fugitive status: "<leader>gs", "<cr>" to view the file (nicely cancels the diff mode as well). 
" "D" to get to diff mode.  Use ":Gwrite" on the working copy to stage the entire file. 
" "u"/undo in the (left side) index version of the file will make the diff/difference appear again.  use "diffupdate" to update the diff
" Use "Gwrite" from the index version of the file (left side of diff) to "OVERWRITE the working copy with what is currently in the index/stage (which may be what is in the commit)"
" Alternatively you can "Gread" from the working copy to read from the index/stage and update the working copy to with it.
" Staging Hunks Of Changes: With the cursor on a hunk on the right side of a diff (working copy) do
" ":diffput" or "dp" to put the change to the diff-split left buffer (into the index/stage buffer). Now do
" ":w" to write the index/stage buffer! Note that the file now shows up a "staged for commit" *and* as "unstaged change", as there are still changes in the file that are not staged.
" also "diffget" or "do" ("optain") in the working copy will undo the hunk-change/ revert it back to what was is in the past commit.
" "git diff" in the terminal compares the working copy with what is in the last commit .. vs. 
" "git diff --cached" compared the working copy with what is in the current index/stage
" "Gwrite" to just stages the current file. Basically "!git add %". ":Git add %" works but requires the buffer wipe action to close the neovim terminal that is run.
" Note: In Gstatus you can diff the index/stage to the prev commit. And in the "Changes not staged .." section you can diff the working copy against the index/stage.
" Use "c-w c" on the index/left split to get a proper working buffer back, after a Gdiff is reconciled and/or a commit finished with ":wq", 
" Gitgutter signs update on save and relate to the last commit/ don't consider the index/stage
" To update "Gstatus" preview window, you have to run the command again
" "Gedit :%" to get the index/staged version of the current file into a (temp) buffer
" "Gdiff" compares to the index/staged version of the current file. "Gwrite" on the index/stage/left
" buffer will overwrte the changes in the working copy. Alternatively you could do "Gread" from the working tree/copy.
" Gitgutter Stage Hunk: - "leader ha" "hunk add" stages a hunk, but the effect can not be seen in gitgutter.
" Gitgutter Undo Hunk:  - "leader hr" rolls back the changed code segment to the *index/stage*, not to the last commit
" Staging Partial Hunks: In the diff split on the working copy/right buffer, select a range of lines of a bigger hunk, then ":diffput" only these lines into the index/stage.

" Git Reset: Git reset "overwrites" the tree trees:
" 1. Move the branch HEAD via "--soft"
" 2. Make Index look like HEAD "--mixed"
" 3. Make Working Dir look like Index and HEAD "--hard"
" From: https://git-scm.com/book/en/v2/Git-Tools-Reset-Demystified
" Undo Last Commit: - "git reset HEAD~1 --soft" moves the branch (the branch HEAD and the global HEAD) to a previous commit, without
" changing the index/stage or the working directory. From there you can just "add" to index and commit again to e.g. refine the commit message.
" "git reset HEAD~ [--mixed]" Moves HEAD to the previous commit/snapshot *and* "updates the index" with the content of that commit/snapshot!
" So this additionally "unstages" the changes of the last commit. This is a rollback to before I ran all my "git add" and "git commit" commands.
" "git reset --hard HEAD~" additionally undos all the work/changes in the working directory! It basically goes back to the state of the last commit *and* thows away everything that has been done (working dir changes, staging of those and commit) since then.
" Reset Index To HEAD: - "git reset HEAD" (implies --mixed) updates/resets the index/stage with the content of the HEAD commit/snapshot
" Copy File In HEAD Snapshot To Index: - "git reset --mixed HEAD file.txt" or simply "git reset file.txt" - 
" it's basically unstaging that file. E.g. the opposite of "git add file.txt".
" Commit An Old File Version Without Loosing Past Commits And Without Changing Working Dir: 
" "git reset <commitID> -- file.txt" - this just copies that file version into the index (not the working dir!), then you can "commit" that index.
" Patch Option: - "git add", "git reset" and "git checkout" accept the "--patch" option to stage/unstage/overwrite parts/hunks of a file/tree.
" Squash Several Commits Into One: - "git reset --soft HEAD~2" will move the HEAD back to the last meaningful commit. 
" But the working dir and Index are maintained and ready to be commited in one encompassing commit! The previous in-between commit can no longer be seen in the history.
" Checkout Branch: is similar to "git reset --hard [branch]" - it moves HEAD to a commit and updates Index and Working dir.
" However, "checkout" only updates (tries to "merge") unchanged files in the dir. Whereas "reset --hard" - "overwrites" files!
" Update HEAD: .. also, "checkout" moves HEAD to *point to* (the current commit of/ BRANCH HEAD of) another branch, 
" while "reset [branch]" will move the *branch* head (and the global HEAD) to a commit of that other branch!
" Example : HEAD points to 'dev' branch. 
" If we run "git reset master",    dev branch (current commit/branch HEAD) will be (pointing to) the same commit that master does!
" If we run "git checkout master", the global HEAD will be moved to the branch HEAD of master. The Dev branch HEAD does not move.
" Summary: → Checkout moves the global HEAD, Reset moves the branch HEAD.
"          → Reset changes the branch HEAD (potentially including a commit from another branch) and moves the global HEAD to it.
" Checkout File: - "git checkout [branch] -- file.txt" overwrites that file to the current working dir and writes it to the Index.
" Who Does Reset And Checkout Affect: HEAD, Index, Workdir and is it WD Safe?
" ┌────────────────────────────┬──────┬───────┬──────────┬──────────┐
" │                            │  HEAD│  Index│  	Workdir│  WD Safe?│
" ├────────────────────────────┼──────┼───────┼──────────┼──────────┤
" │                Commit Level│      │       │          │          │
" │     "reset --soft [commit]"│   REF│     NO│        NO│       YES│ only undo the commit, not staging or file changes
" │            "reset [commit]"│   REF│    YES│        NO│       YES│ "reset HEAD~" undos the whole commit process (including staging)
" │                            │      │       │          │          │ "reset master" let's you continue from the current state of the master branch
" │     "reset --hard [commit]"│   REF│    YES│       YES│        NO│ complete overwrite
" │         "checkout <commit>"│  HEAD│    YES│       YES│       YES│ will merge with workdir
" │                  File Level│      │       │          │          │
" │    "reset [commit] <paths>"│    NO│    YES│        NO│       YES│ only puts file into the index. usecase: integrate file from another commit with working dir version of that file: A diff with the fetched index let's you "dp" hunks from the working dir into the index.
" │ "checkout [commit] <paths>"│    NO│    YES│       YES│        NO│ overwrite that file in the workdir!
" └────────────────────────────┴──────┴───────┴──────────┴──────────┘
" _, HEAD, Index,	Workdir, WD Safe?
" Commit Level,,,,
" reset --soft [commit], REF, NO, NO, YES
" reset [commit], REF, YES, NO, YES
" reset --hard [commit], REF, YES, YES, NO
" checkout <commit>, HEAD, YES, YES, YES
" File Level,,,,
" reset [commit] <paths>, NO, YES, NO, YES
" checkout [commit] <paths>, NO, YES, YES, NO

" [alias]
" 	co = checkout
"   ci = commit
"   st = status
"   br = branch
"   unstage = reset HEAD --
"   last = log -1 HEAD
"   hist = log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short
"   visual = !gitk

" VIMIUM WORKFLOW:
" "f" to open link, 
" "<c-[>" to cancel
" "J" - "K" for prev - next tab
" "T" - Tab menu! "<c-j>"/ "<c-k" for up/down, "<c-[" to cancel, also use "^" for previous tab!
" "x" to close tab, "X" restore cloed tab!
" "vc" for carret mode, "ve" to select word, "y" to copy to clipboard
" "gi" to select text input (mode!), <shift><tab>, <tab> to select input field, "<c-[" to exit! 
" "?" for help/command overview
" "H" - "L" navigate back/forward! instead of backspace!
" "ge" to edit URL, "gE" to open the changed URL in a new tab
" "t" for new tab, "yt" to dublicate tab. 
" "<<" and ">>" to move tab!
" Move Tab To Other Window: - "yy", <c-arrowKey> to move to other space/window, "P" to open a new tab for the copied URL in the new window.
" Select Copy Paste Text: With source text area in view, hit "vc" and confirm 'carret mode' is active. use regular movements, 
" hit "v" for visual selection mode, use "o" to switch to adapt the beginning of the selection. the
" "y" to copy. In VIM, do "*P to past the clipboard.
" Google Search Copied Text: just hit "P" to search in a new Tab!

" JSON Workflow: ----------------------------------------
" use "set foldmethod=syntax"
"
"
"
" JSON Workflow: ----------------------------------------





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

" let Tid = jobstart("ls") 

"--* 

" echo jobsend(g:Tid, "ls /n")

"--*

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


" DO THIS TO PUT A FILTERED ERROR LIST FROM NEOMAKE INTO A BUFFER:
" 1. create an empty buffer:
" :e temp2
" 2. prevent automatic line breaks:
" set textwidth?
" set textwidth=400
" 3. yank the filter code:
" filter(getqflist(), 'v:val.type == "w"')
" 4. Run and insert the result into the buffer:
" i<c-r>=<c-r>"<cr>
" insert mode, control + r, =, (then in the comman line:) (again!) control + r, ", return!

" {'lnum': 8, 'bufnr': 2, 'col': 1, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': 'w', 'pattern': '', 'text': '[-Wunused-imports]'}
" {'lnum': 11, 'bufnr': 2, 'col': 1, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': 'w', 'pattern': '', 'text': '[-Wunused-imports]'}
" {'lnum': 16, 'bufnr': 2, 'col': 1, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': 'w', 'pattern': '', 'text': '[-Wunused-imports]'}

" convert markdown to simple html tags
" :%!/usr/local/bin/Markdown.pl --html4tags
" also shows how to run a perl script!



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
  if exists('s:markdown_job_id') && s:markdown_job_id > 0
    call jobstop(s:markdown_job_id)
    unlet s:markdown_job_id
  endif
  let s:markdown_job_id = jobstart('grip ' . shellescape(expand('%:p')))
  if s:markdown_job_id <= 0 | return | endif
  call system('open http://localhost:6419')
endfunction

" MARKDOWN: -----------------------------------------------------------------------

" Vim Anywhere:
command! CopyAndQuit :%y+ | :q!
nnoremap <leader>ccl :CopyAndQuit<cr>
" nnoremap <leader>ccl :%y+<cr>:q!<cr>

" command! SourceLine :normal yy:@"<cr>:echo 'Line sourced!'<cr>


" ----------------------------------------------------------------------------------
" helpers from https://github.com/jeromedalbert/dotfiles/blob/master/.vim/init.vim 
" TODO: test these!

if has('nvim')
  augroup on_display_events
    autocmd!
    autocmd TermOpen * call OnTermOpen()
  augroup end
endif

function! OnTermOpen()
  if &buftype != 'terminal' | return | endif
  setlocal nonumber norelativenumber colorcolumn=
  nnoremap <silent><buffer> G G{}
endfunction

command! -range=0 FocusSelection call FocusSelection(<count>)
cabbrev focus FocusSelection
function! FocusSelection(visual)
  if !a:visual | return | endif
  let filetype = &filetype
  normal gv"zy
  enew
  exe 'set filetype=' . filetype
  normal "zpggdd
endfunction


noremap <leader>ytw :call ToggleOption('wrap')<cr>
function! ToggleOption(option_name, ...)
  let option_scope = 'local'
  if a:0 | let option_scope = '' | endif
  exe 'let enabled = &' . a:option_name
  let option_prefix = enabled ? 'no' : ''
  exe 'set' . option_scope . ' ' . option_prefix . a:option_name
endfunction


" ----------------------------------------------------------------------------------
" Tryouts:


" idea for insert mode mappings:
" go to just before the first non-blank text of the line
inoremap II <Esc>I


" ToDo: reconsider usage
" some command abbreviations
" cnoreabbrev f Find
" cnoreabbrev fb Findb
" cnoreabbrev hg HelpGrep
" cnoreabbrev h Hoogle
" cnoreabbrev he help
" cnoreabbrev ge grep
" cnoreabbrev pi PlugInstall

cnoreabbrev ssp set syntax=purescript
cnoreabbrev ssh set syntax=help

" .. or have shortcuts like this:
nnoremap \sh :set syntax=help<cr>
nnoremap \sv :set syntax=vim<cr>
nnoremap \sm :set syntax=markdown<cr>
" TODO Note: a different leader key for all "set" operations? "set syntax help" = "\sh"

" demos:
abbrev mul Multiple<CR>lines

" eins zwei drei vier fuenf sechs 

" Launching Chromium: ---------------------------------------------------------------
" Using the full path on MacOS: "/Applications/Chromium.app/Contents/MacOS/Chromium --window-size=200,500 --window-position=0,20"
" Using an alias: "chromium --window-size=800,400 --window-position=222,222"
" Dedined in "~/.zshrc" file: alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"
" Chromium switches are listed here: https://peter.sh/experiments/chromium-command-line-switches/
" Switches are only effective when launching the first window - one needs to close the window, and then open it again, to move it?
" Using mini bar and start URL: "chromium --app=http://purescript.org --window-position=200,50 --window-size=60,60"
" Closing The Window: End the terminal session? Use "call jobstop(s:markdown_job_id)"

command! -nargs=1 Chromium exec ':Dispatch' '/Applications/Chromium.app/Contents/MacOS/Chromium --app=' . <q-args> '--window-size=500,400 --window-position=800,20' 
command! -nargs=1 Chromium1 exec ':Start!' '/Applications/Chromium.app/Contents/MacOS/Chromium ' . <q-args> 

" let Tid = jobstart("/Applications/Chromium.app/Contents/MacOS/Chromium http://purescript.org") 

command! -nargs=1 Chromium :let  = jobstart("pulp repl", Cbs1)


let g:chromiumAppPath = "/Applications/Chromium.app/Contents/MacOS/Chromium"

function! LaunchChromium( url ) abort
  if exists('s:launchChromium_job_id') && s:launchChromium_job_id) > 0
    call jobstop( s:launchChromium_job_id )
    unlet s:launchChromium_job_id
  endif
  let s:launchChromium_job_id = jobstart( g:chromiumAppPath . ' --app=' . shellescape( a:url ))
endfunction

" Launching Chromium: ---------------------------------------------------------------



" Defining Commands And Utility Example Commands: -----------------------------------------------------
" Rename the current buffer
command! -nargs=1 -bang -complete=file RenameBuffer f <args>|w<bang>
" Replace a range with the contents of a file
command! -range -nargs=1 -complete=file Replace <line1>-pu_|<line1>,<line2>d|r <args>|<line1>d
" Count the number of lines in the range
command! -range -nargs=0 Lines  echo <line2> - <line1> + 1 "lines"
" Call a user function (example of <f-args>)
command! -nargs=* SomeTest1 call SomeTest1(<f-args>)
" Use normal mode in a command
" command! SourceLine :normal yy:@"<cr>:echo 'Line sourced!'<cr>
" Ex commands can be run from a command prefixing the ":" but not the "<cr>"
" command! CopyAndQuit :%y+ | :q!
" command! -nargs=1 Find  :Grepper -side -query <args>
" but alternatively you could/should? use exec:
" Chaining Commands:
command! -nargs=1 HelpGrep  exec ':helpgrep' <q-args> | exec ':cwindow'

" Expr Maps: right side is an expression, conditional ( <test-exp> ? <exp1> : <exp2> )
noremap <expr> <leader>sn demo4 == 'ein' ? ":echo 'ja'<cr>" : ":echo 'nein'<cr>"
let demo4 = 'eins'
" calling a function to get a condition:
noremap <expr> <leader>sn Demo5() ? ":echo 'ja'<cr>" : ":echo 'nein'<cr>"
func! Demo5()
  return 0
endfunc

" "<Plug>" is setting up a reference to a (public/API) function in a Plugin that can be called from a mapping like this:
" nmap _p <Plug>ScriptFunc

" Normal maps can call a command by prefixing ":" and appending "<cr>"
" nnoremap <leader>ccl :CopyAndQuit<cr>
" Expression mapping example: build a string and run it as an expression
" nnoremap <expr> GG ":echom " . screencol() . "\n"
" nnoremap <silent> GG :echom screencol()<CR>

" Defining Commands And Utility Example Commands: -----------------------------------------------------


" Running Commands: ------------------------------------------------------------
" Calling a command with args. Is there no nicer way?
fun! SomeTest2( ar1 )
  exec "Find " shellescape( a:ar1 )
endfun
" call SomeTest2( 'replicateM' )
" call SomeTest2( 'Terminal' )

" Run Terminal Commands:
" run any command with ':!{cmd}' or use <C-z> to suspend nvim, then run 'fg'
" to bring nvim back to the foreground
" Uncomment line then run "<leader>sl"
" exec "!osascript -e 'tell application \"Finder\" to make new Finder window'"
" exec '!osascript' '-e' shellescape( 'tell application "Finder" to make new Finder window' )
" silent exec "!osascript -e 'tell application \"Finder\" to make new Finder window'"
" Issue: silent does produce artefacts on the lower bar of vim. this can be avoided with ":redraw!"
" Discard Return Dialog: example: "silent !echo Hello" then use ":redraw!" to refresh screen
" This closed (but flashes) the return message: 
command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
" example: "Silent ps" instead of ":!ps"
" Using Vim Dispatch:
" Dispatch! osascript -e 'tell application "Finder" to make new Finder window'
" Start! osascript -e 'tell application "Finder" to make new Finder window'
func! DemoOpenFinderWindow ()
  silent exec "!osascript -e 'tell application \"Finder\" to make new Finder window'" | redraw!
  Dispatch! osascript -e 'tell application "Finder" to make new Finder window'
  " It's sort of surprising this this works, you usually need "exec" to run commands
endfunc
" call DemoOpenFinderWindow()
" Todo: jobsend example!

" Use A Range Of Lines:
" echo join( getline(".", line(".") + 3), "\n" )
" Piping Text Selection To Shell Command: Select the following lines:
" B
" C
" A
" then run ":'<,'>!sort | pbcopy | ps". The sorted lines are put into the clipboard, the selected text is replaced
" This has a similar effect: ":'<,'>!call DemoPipeRange()"
" Note how "a:firstline/lastline" are enabled by adding the "range" arg
function! DemoPipeRange() range
  echo system('echo '.shellescape(join(getline(a:firstline, a:lastline), "\n")).'| sort | pbcopy | ps')
endfunction
" Also note the usage of terminal "echo" cmd to start a pipe and the vim-shell "echo" that uses a concatinated string from shellescaped args as it's arg.
" Similarly "-range" for commands allows to use "<line1/2>" for start end linenums on the right side:
command! -range=% -nargs=0 DemoPipeRange1 :<line1>,<line2>call DemoPipeRange()

" Running Commands: ------------------------------------------------------------
" last


" Running AppleScript: ----------------------------------------------------------------
func! AppleScriptRunAndForget (ascode)
  silent exec      '!osascript' '-e' shellescape( a:ascode ) | redraw!
endfunc
" testarg: 'tell application "Finder" to make new Finder window'
" find next testarg line, "Wy[to some other register])"

func! AppleScriptRunAndForgetAsync (ascode)
  exec 'Dispatch!' 'osascript' '-e' shellescape( a:ascode )
endfunc

" call AppleScriptRunAndForget('tell application "Finder" to make new Finder window')
" call AppleScriptRunAndForget('tell application "System Events" to key code 124 using {control down}')
" call AppleScriptRunAndForgetAsync('tell application "Finder" to make new Finder window')
" call AppleScriptRunAndForgetAsync('tell application "System Events" to key code 124 using {control down}')
" Running AppleScript: ----------------------------------------------------------------



" Range To CSV: -----------------------------------------------------------------------
" Copies paragraph into split (of filetype=csv) using csv.vim
fun! CSVBufferFromParagraph ()
  exec 'silent normal! y}'
  exec 'vnew'
  exec 'normal! P'
  set filetype=csv
endfun
" call CSVBufferFromParagraph()
" eins,zwei,drei
" 1,23,334
" 44,6,6 

" Detect CSV delimiter in paragraph using a temp csv.vim buffer
fun! FindCSVDelimiterInParagraph ()
  call CSVBufferFromParagraph()
  let l:detectedDelim = b:delimiter
  exec 'bd!'
  return l:detectedDelim
endfun
" echo FindCSVDelimiter()

" Example for automating common processes:
fun! ShowAsciiTableOfVisualSelection () range
  " This process will involve temp windows/buffers, we need this var to go back:
  let l:startWindowNr = winnr()
  " Paste the visual selection into a new split buffer
  let l:visSelLines = getline( a:firstline, a:lastline) 
  exec 'vnew'
  call append( 1, l:visSelLines )
  exec 'normal dd'
  " Activate csv.vim plugin
  set filetype=csv
  exec 'normal VG'
  " Produces the Asciitable in a split below and jump to it
  exec 'CSVTabularize'
  " Copy then dispose the buffer
  let g:asciiLines = getline( 1, line('$') ) 
  exec 'bd!'
  " Also dispose the csv.vim buffer
  " Issue: Is this save? / Can never dispose the original buffer?
  exec 'bd!'
  " This is not needed anymore as we have closed the other wins/buffers
  exec l:startWindowNr . 'wincmd w'
  " call append(line('.'), g:asciiLines)
  call append( a:lastline, g:asciiLines)
endfun
" Example Use: Visually select the 3 CSV lines, then run
" '<,'>call ShowAsciiTableOfVisualSelection()
" eins,zwei,drei
" 1,23,334
" 44,6,6 
" This will then paste this Ascii table just below the CSV lines
" ┌─────┬─────┬─────┐
" │ eins│ zwei│ drei│
" ├─────┼─────┼─────┤
" │    1│   23│  334│
" │   44│    6│   6 │
" └─────┴─────┴─────┘

" Commmands Range Args Example Usage:
" Run: '<,'>OpenRangeInExcel ','
" on this csv text:
" eins,zwei,drei
" 1,23,334
" 44,6,6 
command! -range -nargs=1 OpenRangeInExcel <line1>,<line2>call OpenRangeInExcel( <args> )
fun! OpenRangeInExcel ( origDelim ) range
  " get CSV text from range in current buffer
  let l:linesCSV = getline( a:firstline, a:lastline) 
  " Substitute the orig delimiter to Excels preferred one
  let l:linesExcelCSV = SubstituteInLines( l:linesCSV, a:origDelim, ';' )
  "
  let l:tmpFn = tempname() . '.csv'
  " let l:tmpFn = 'apropername1.csv'
  call writefile( l:linesExcelCSV, l:tmpFn )
  exec "silent !open " . l:tmpFn . " -a 'Microsoft Excel'"
  " call delete(l:tmpsofile)
endfun

fun! SubstituteInLines ( lines, origDelim, newDelim )
	let l:idx = 0
	while l:idx < len(a:lines)
	   let l:line = a:lines[l:idx]
	   let a:lines[l:idx] = substitute(l:line, a:origDelim, a:newDelim, 'ge')
	   let l:idx = l:idx + 1
	endwhile
  return a:lines
endfun
" Substitute flags: "g" = all occurances, "e" = surpress/continue at errors
" Range To CSV: -----------------------------------------------------------------------


" does not work in nvim!
function! RangerExplorer()
    exec "!ranger --choosefile=/tmp/vim_ranger_current_file " . expand("%:p:h")
    if filereadable('/tmp/vim_ranger_current_file')
        exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
        call system('rm /tmp/vim_ranger_current_file')
    endif
    redraw!
endfun

" nvim terminal works!
function! OpenRanger()
  let rangerCallback = { 'name': 'ranger' }
  function! rangerCallback.on_exit(id, code)
    try
      if filereadable('/tmp/chosenfile')
          exec 'edit ' . readfile('/tmp/chosenfile')[0]
          call system('rm /tmp/chosenfile')
      endif
    endtry
  endfunction
  enew
  call termopen('ranger --choosefile=/tmp/chosenfile', rangerCallback)
  startinsert
endfunction




" Testfunctions: -------------------------------------------------------------
func! DemoBackForth ()
  silent exec      '!osascript' '-e' shellescape( 'tell application "System Events" to key code 124 using {control down}' ) | redraw!
  silent exec      '!osascript' '-e' shellescape( 'tell application "System Events" to key code 123 using {control down}' ) | redraw!
endfunc
" call DemoBackForth()

func! DemoBackForth2 ()
  silent exec 'Dispatch!'    '!osascript' '-e' shellescape( 'tell application "System Events" to key code 124 using {control down}' ) | redraw!
  silent exec 'Dispatch!'    '!osascript' '-e' shellescape( 'tell application "System Events" to key code 123 using {control down}' ) | redraw!
endfunc

" Example function moving cursor
function! GoToSelErrorLine()
  call cursor( getqflist()[0].lnum, getqflist()[0].col)
endfunction
" same things can be done with ":cr"!

" Autocommands Events: ----------------------------
" Give a preview window local settings on WinEnter:
" Note: the use of "if" in one line!
augroup PreviewAutocmds
  autocmd!
  autocmd WinEnter * if &previewwindow | setlocal nonumber | endif
augroup END


" Codeformatting Examples: -----------------------------------------------------
" from: https://github.com/sdothum/dotfiles/blob/master/vim/.vim/config/buffer.vim
" TODO there must be a script the facilites this ..

" Keyboard
" ▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂

"   Keyboard (re)mappings ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁

"     .................................................................... Setup

" let mapleader   = "\<Space>"          " remap <leader> a la spacemacs
" let g:mapleader = "\<Space>"

" augroup kbd
"   autocmd!
" augroup END

"   Cursor ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁

"     ....................................................... Backspace settings

" set backspace=indent,eol,start        " allow backspace in insert mode
" set whichwrap=b,s,h,l,<,>,[,]         " backspace and cursor keys wrap

"     ......................................................... Cursor movements

" up/down by screen lines, not file lines
" nnoremap k         gk
" vnoremap k         gk


" Keyboard
" ▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂

  " Keyboard (re)mappings ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁

    " .................................................................... Setup

      " let mapleader   = "\<Space>"          " remap <leader> a la spacemacs
      " let g:mapleader = "\<Space>"
      "
      " augroup kbd
      "   autocmd!
      " augroup END

  " Cursor ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁

    " ....................................................... Backspace settings

      " set backspace=indent,eol,start        " allow backspace in insert mode
      " set whichwrap=b,s,h,l,<,>,[,]         " backspace and cursor keys wrap

    " ......................................................... Cursor movements

      " up/down by screen lines, not file lines
      " nnoremap k         gk
      " vnoremap k         gk



