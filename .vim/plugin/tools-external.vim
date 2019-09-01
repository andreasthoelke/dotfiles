

nnoremap <leader><leader>ls :call ShellReturn( 'ls -a' )<cr>

func! ShellReturn( cmd )
  let resultLines = split( system( a:cmd ), '\n' )
  call FloatWinAndVirtText( resultLines )
endfunc


" ----------------------------------------------------------------------------------
"  Launching external apps
command! Browser :call OpenVisSel()
vmap glb :call OpenVisSel()<cr>
nnoremap glb :call HandleURL()<cr>

command! ITerm :call OpenITerm()
nnoremap gli :call OpenITerm()<cr>

command! Finder :call OpenFinder()
nnoremap glf :call OpenFinder()<cr>

command! Editor :call OpenCurrentFileInSystemEditor()
nnoremap gle :call OpenCurrentFileInSystemEditor()<cr>
" Tip: alternatively just ":!open $"!

command! OpenInExcel exec "silent !open % -a 'Microsoft Excel'"
command! Alacritty exec "silent !open -n '/Users/andreas.thoelke/Documents/temp/alacritty/target/release/osx/Alacritty.app/'"
" Todo: start Alacritty with options
" command! Alacritty exec "silent !open -n '/Users/andreas.thoelke/Documents/temp/alacritty/target/release/osx/Alacritty.app/ --option \"window.decoration\" \"none\"'"
" command! Alacritty exec "silent !open -n '/Users/andreas.thoelke/Documents/temp/alacritty/target/release/osx/Alacritty.app/ --config-file /Users/andreas.thoelke/.config/alacritty/alacritty.yml"
" command! Alacritty exec "silent !open -n '/Applications/Alacritty.app/"

fun! OpenITerm()
  let path = projectroot#guess()
  exec 'silent !open -a iTerm ' . path
endfun
" this works: :silent !open -a iTerm Documents/purescript

" ----------------------------------------------------------------------------------

" Showing the output of shell commands in a buffer:
command! -nargs=1 AppOut call StdoutToBuffer( <q-args> )
nnoremap <leader>sab :call StdoutToBuffer( getline('.') )<cr>
" Tests:
" ls -o -t -a
" hasktags --help
func! StdoutToBuffer ( cmd )
  let l:resultLines = split( system( a:cmd ), '\n' )
  exec 'vnew'
  call append( line('.'), l:resultLines )
  normal! dd
  echo 'rather use SystemCmdToScratchBuffer?'
endfunc
" cabal info async
" cabal info warp
" cabal info semantic
" cabal info wai-cors
" cabal info these
" cabal info Network.Socket.Address

func! SystemCmdToScratchBuffer( cmd )
  let l:resultLines = split( system( a:cmd ), '\n' )
  call ScratchWin_Show( 'HsAPIdata/' . a:cmd, l:resultLines )
endfunc


nnoremap <leader>Cab :vnew *.cabal<cr>
nnoremap <leader>oPa :vnew package.yaml<cr>
nnoremap <leader>oPA :tabe package.yaml<cr>

" TODO this does not show a man page outline
nnoremap <leader>g0 g0


" nnoremap <leader>zsh :e ~/.zshrc<cr>
command! Zshrc   :e ~/.zshrc
command! ZshOhMy :e ~/.oh-my-zsh/oh-my-zsh.sh
command! Vimrc   :e ~/.vimrc
command! Cabal   :vnew *.cabal
command! PackageYaml :vnew package.yaml

" Insert the $PATH shell variable
command! Path :normal i<c-r>=system("echo $PATH | tr ':' '\n'")<esc>
" current as of 5/5/2018:
" /Users/andreas.thoelke/.cargo/bin
" /Library/Frameworks/Python.framework/Versions/3.6/bin
" /usr/local/bin
" /usr/bin
" /bin
" /usr/sbin
" /sbin
" /Users/andreas.thoelke/.local/bin <<<<<< install executables HERE!!!
" /Users/andreas.thoelke/Library/Python/3.6/bin

" TIP: install locations for executables:
" /Users/andreas.thoelke/.local/bin


" ─   Git                                                ■

command!          Gitpush   call ShellReturn( 'git push' )
command!          Gitstatus call ShellReturn( 'git status' )
command! -range -nargs=* GitcommitQuick call GitCommitOverload(<q-args>)
command! -nargs=* GitpublishQuick call GitPublish(<q-args>)

nnoremap <leader><leader>gs :call ShellReturn( 'git status' )<cr>
nnoremap <leader><leader>gp :call ShellReturn( 'git push' )<cr>
nnoremap <leader><leader>gP :call GitPublish( input( 'Commit message: ' ) )<cr>
vnoremap <leader><leader>gP :<c-u>call GitPublish( input( 'Commit message: ', GetVisSel() ) )<cr>
nnoremap <leader><leader>gc :call GitCommit( input( 'Commit message: ' ) )<cr>
vnoremap <leader><leader>gc :<c-u>call GitCommit( input( 'Commit message: ', GetVisSel() ) )<cr>

" Note: No quotes needed to enter multiple words
func! GitCommitOverload( ... )
  if a:0
    let message = a:1
  else
    let visText = GetVisSel()
    let message = input( 'Commit message: ', visText )
  endif
  call GitCommit( message )
endfunc

func! GitCommit( commitMessage )
  let cmd = 'git commit -a -m "' . a:commitMessage . '"'
  call ShellReturn( cmd )
endfunc

func! GitPublish( commitMessage )
  let cmd = 'git publish "' . a:commitMessage . '"'
  call ShellReturn( cmd )
endfunc
" call GitPublish( input('Commit message: ') )

" ─^  Git                                                ▲


" ─   Git Tools                                          ■

" Magit:
command! GitcommitAuthorTab   call GitMagitAuthor( 't' )
command! GitcommitAuthorSplit call GitMagitAuthor( 'v' )

func! GitMagitAuthor( win )
  if a:win == 't'
    exec 'tabe'
    exec 'MagitOnly'
  else
    exec 'Magit'
  endif
  call AttachAutosaveStopEvents()
  let g:auto_save = 0
endfunc

let g:magit_default_show_all_files = 1
let g:magit_default_fold_level = 1
" let g:magit_default_sections = ['info', 'global_help', 'commit', 'staged', 'unstaged']
let g:magit_default_sections = ['commit', 'staged', 'unstaged']

" Z Maps Unimpaired:
" There may be muliple Magit windows. Only when the focus is on any of there Autosave should be off
" nnoremap yog :Magit<cr>:call AttachAutosaveStopEvents()<cr>:let g:auto_save = 0<cr>
" nnoremap yoG :tabe<cr>:MagitOnly<cr>:call AttachAutosaveStopEvents()<cr>:let g:auto_save = 0<cr>
nnoremap <leader>og :Magit<cr>:call AttachAutosaveStopEvents()<cr>:let g:auto_save = 0<cr>
nnoremap <leader>oG :tabe<cr>:MagitOnly<cr>:call AttachAutosaveStopEvents()<cr>:let g:auto_save = 0<cr>

" GitV:
nnoremap <leader>oG :Gitv<cr>
" nnoremap <leader>oG :Gitv!<cr>

let g:Gitv_CustomMappings = {
      \'update': 'r',
      \}

" Fugitive:
nnoremap <leader>Gs :Gstatus<cr>
" autocmd BufNewFile,BufRead fugitive://* set bufhidden=delete
" Disable neovim terminal when e.g. ":Git checkout master" (experimental)
let g:fugitive_force_bang_command = 1
" Deletes hidden fugitive buffers when I hide them?
" au ag BufReadPost fugitive://* set bufhidden=delete

" ─^  Git Tools                                          ▲


" ─   Reading config/ yaml files                         ■
" 
" Read the package names (dependencies) of the current project
python << EOF
import yaml
import vim
def getHSPackageDependencies():
  filePath = vim.eval('projectroot#guess()') + '/package.yaml'
  with open( filePath, 'r') as packageFile:
  # with open("/Users/andreas.thoelke/Documents/Haskell/6/HsTrainingTypeClasses1/package.yaml", 'r') as packageFile:
    packageObj = yaml.load(packageFile, Loader=yaml.FullLoader)

  return packageObj['library']['dependencies']
EOF
" echo pyeval('getHSPackageDependencies()')

" ─^  Reading config/ yaml files                         ▲


" ─   Launching Chromium                                 ■

" Using the full path on MacOS: "/Applications/Chromium.app/Contents/MacOS/Chromium --window-size=200,500 --window-position=0,20"
" Using an alias: "chromium --window-size=800,400 --window-position=222,222"
" Dedined in "~/.zshrc" file: alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"
" Chromium switches are listed here: https://peter.sh/experiments/chromium-command-line-switches/
" Switches are only effective when launching the first window - one needs to close the window, and then open it again, to move it?
" Using mini bar and start URL: "chromium --app=http://purescript.org --window-position=200,50 --window-size=60,60"
" Closing The Window: End the terminal session? Use "call jobstop(s:markdown_job_id)"

" Terminal win opens
command! -nargs=1 Chromium exec ':Dispatch' '/Applications/Chromium.app/Contents/MacOS/Chromium --app=' . <q-args> '--window-size=500,400 --window-position=800,20'
" With addressbar and terminal in other tab
command! -nargs=1 Chromium1 exec ':Start!' '/Applications/Chromium.app/Contents/MacOS/Chromium ' . <q-args>
" Test: open more wins per invocation
" Chromium 'http://purescript.org'

" let Tid = jobstart("/Applications/Chromium.app/Contents/MacOS/Chromium http://purescript.org")

" command! -nargs=1 Chromium :let  = jobstart("pulp repl", Cbs1)
" TODO try chromium-browser --force-device-scale-factor=0.79 - but can also set this globally in Chromium app settings

let g:chromiumAppPath = "/Applications/Chromium.app/Contents/MacOS/Chromium"

func! LaunchChromium( url ) abort
  if exists('g:launchChromium_job_id')
    call jobstop( g:launchChromium_job_id )
    unlet g:launchChromium_job_id
  endif
  let g:launchChromium_job_id = jobstart( g:chromiumAppPath . ' --app=' . shellescape( a:url ))
endfunc
" call LaunchChromium( 'http://purescript.org' )
" call LaunchChromium( 'https://www.stackage.org/lts-14.1/hoogle?q=map' )

func! StopChromium()
  if exists('g:launchChromium_job_id')
    call jobstop( g:launchChromium_job_id )
    unlet g:launchChromium_job_id
  endif
endfunc
" call StopChromium()

" ─^  Launching Chromium                                 ▲


" ─   Running AppleScript                                ■
func! AppleScriptRunAndForget (ascode)
  silent exec      '!osascript' '-e' shellescape( a:ascode ) | redraw!
endfunc
" testarg: 'tell application "Finder" to make new Finder window'
" find next testarg line, "Wy[to some other register])"

func! AppleScriptRunAndForgetAsync (ascode)
  exec 'Dispatch!' 'osascript' '-e' shellescape( a:ascode )
endfunc

" call AppleScriptRunAndForget('tell application "Google Chrome" to open location "http://github.com"'){{{
" call AppleScriptRunAndForget('tell application "Finder" to make new Finder window')
" call AppleScriptRunAndForget('tell application "System Events" to key code 124 using {control down}')
" call AppleScriptRunAndForgetAsync('tell application "Finder" to make new Finder window')
" call AppleScriptRunAndForgetAsync('tell application "System Events" to key code 124 using {control down}')
func! DemoBackForth ()
  silent exec      '!osascript' '-e' shellescape( 'tell application "System Events" to key code 124 using {control down}' ) | redraw!
  silent exec      '!osascript' '-e' shellescape( 'tell application "System Events" to key code 123 using {control down}' ) | redraw!
endfunc
" call DemoBackForth()

func! DemoBackForth2 ()
  silent exec 'Dispatch!'    '!osascript' '-e' shellescape( 'tell application "System Events" to key code 124 using {control down}' ) | redraw!
  silent exec 'Dispatch!'    '!osascript' '-e' shellescape( 'tell application "System Events" to key code 123 using {control down}' ) | redraw!
endfunc

" ─^  Running AppleScript                                ▲









