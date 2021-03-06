

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

nnoremap glc :call LaunchChromium2( GetUrlFromLine(line('.')) )<cr>

command! ITerm :call OpenITerm()
nnoremap gli :call OpenITerm()<cr>

command! Finder :call OpenFinder()
nnoremap glf :call OpenFinder()<cr>

command! Editor :call OpenCurrentFileInSystemEditor()
nnoremap gle :call OpenCurrentFileInSystemEditor()<cr>
" Tip: alternatively just ":!open $"!

command! OpenInExcel exec "silent !open % -a 'Microsoft Excel'"
command! Alacritty exec "silent !open -n '/Users/andreas.thoelke/Documents/temp/alacritty/target/release/osx/Alacritty.app/'"
" Issue / Todo: this does not show the statusline scrollbar smoothly. Version 0.5.0
" command! Alacritty5 exec "silent !open -n '/Users/andreas.thoelke/Documents/temp/Alacritty.app/'"
" Todo: start Alacritty with options
" command! Alacritty exec "silent !open -n '/Users/andreas.thoelke/Documents/temp/alacritty/target/release/osx/Alacritty.app/ --option \"window.decoration\" \"none\"'"
" command! Alacritty exec "silent !open -n '/Users/andreas.thoelke/Documents/temp/alacritty/target/release/osx/Alacritty.app/ --config-file /Users/andreas.thoelke/.config/alacritty/alacritty.yml"
" command! Alacritty exec "silent !open -n '/Applications/Alacritty.app/"
" exec '!open -n' g:alacrittyAppPath '--config-file' g:alacrittyConfig_startCmd_path
" exec '!open -n' g:alacrittyAppPath '--option' '\"window.decoration\" \"none\"'
" alacritty --option "colors.primary.background='#ff00ff'"
" above all don't seem to with with the older version i use.

let g:alacrittyAppPath = '/Users/andreas.thoelke/Documents/temp/alacritty/target/release/osx/Alacritty.app/'
" let g:alacrittyConfig_startCmd_path = '/Users/andreas.thoelke/.config/alacritty/alacritty_startCmd.yml'
let g:alacrittyConfig_path = '/Users/andreas.thoelke/.config/alacritty/alacritty.yml'
" let g:somest = '--option "colors.primary.background='#ff00ff'"'

nnoremap <silent> <leader>vo :silent call OpenInNewVimInstance( expand("%:p") )<cr>
nnoremap <silent> <leader>vO :silent call OpenInNewVimInstance( '~/Documents/PS/A/' )<cr>
nnoremap <silent> <leader><leader>vO :silent call OpenInNewVimInstance( '~/.vim/' )<cr>

func! OpenInNewVimInstance ( filePath )
  let lineBase = '   - /Users/andreas.thoelke/Documents/vim/nvim-osx64-0.5.0/bin/nvim '
  let newStartVimLine = lineBase . a:filePath

  let allConfLines = readfile( g:alacrittyConfig_path )
  if     allConfLines[-6] == 'shell:'
    let confLinesNormal = allConfLines[0:-3]
    " echo 'Successfully reset alacritty.yml to normal state.'
  elseif allConfLines[-4] == 'shell:'
    let confLinesNormal = allConfLines
    " echo 'Alacritty config file was already in normal state!'
  else
    echoe 'Warning! Alacritty config file is of unsusual length!'
    return
  endif

  let newConfLines = add( confLinesNormal, '   - -c' )
  let newConfLines = add( newConfLines, newStartVimLine )
  call writefile( newConfLines, g:alacrittyConfig_path )
  exec 'silent !open -n' g:alacrittyAppPath
  call AlacrittyResetToNormalConfigFile()
endfunc
" WARN: super careful with the below - don't uncomment - as this causes a recursive call that might crash the Mac!
" DONT UNCOMMENT: call OpenInNewVimInstance( '/Users/andreas.thoelke/.vim/notes/links2' )
" DONT UNCOMMENT: call OpenInNewVimInstance( '/Users/andreas.thoelke/.vim/notes/links' )

func! AlacrittyResetToNormalConfigFile ()
  let allConfLines = readfile( g:alacrittyConfig_path )
  if     allConfLines[-6] == 'shell:'
    call writefile( allConfLines[0:-3], g:alacrittyConfig_path )
    echo 'Successfully reset alacritty.yml to normal state.'
  elseif allConfLines[-4] == 'shell:'
    echo 'Alacritty config file was already in normal state!'
  else
    echo 'Warning! Alacritty config file is of unsusual length!'
  endif
endfunc

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
nnoremap <leader>OPa :vnew package.yaml<cr>
nnoremap <leader>OPA :tabe package.yaml<cr>

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



function! ShowInPreview(name, fileType, lines)
  let l:command = "silent! pedit! +setlocal\\ " .
        \ "buftype=nofile\\ nobuflisted\\ " .
        \ "noswapfile\\ nonumber\\ " .
        \ "filetype=" . a:fileType . " " . a:name

  exe l:command

  if has('nvim')
    let l:bufNr = bufnr(a:name)
    call nvim_buf_set_lines(l:bufNr, 0, -1, 0, a:lines)
  else
    call setbufline(a:name, 1, a:lines)
  endif
endfunction



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

func! AlacrittyFilePath ()
  return '/Users/andreas.thoelke/.config/alacritty/alacritty.yml'
endfunc


python << EOF
import yaml
import vim
def abtest():
  filePath = vim.eval('AlacrittyFilePath()')
  with open( filePath ) as alaconfr:
  # with open("/Users/andreas.thoelke/Documents/Haskell/6/HsTrainingTypeClasses1/package.yaml", 'r') as packageFile:
    packageObj = yaml.load(alaconfr, Loader=yaml.FullLoader)
    packageObj['shell']['args'] = ['eins', 'zwei']

  with open( filePath, 'w') as alaconfw:
    data = yaml.dump( packageObj, alaconfw )

  return packageObj['shell']['args']
EOF
" echo pyeval('abtest()')
" Conclusion: this sort of almost works - it writes the array into the yaml file - but it messes up the sorting


" - /Users/andreas.thoelke/Documents/vim/nvim-osx64-0.5.0/bin/nvim /Users/andreas.thoelke/.vim/notes/releases.md

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
let g:chromiumAppPath2 = "/Applications/Chromium2.app/Contents/MacOS/Chromium"

func! LaunchChromium( url ) abort
  if exists('g:launchChromium_job_id')
    call jobstop( g:launchChromium_job_id )
    unlet g:launchChromium_job_id
  endif
  let g:launchChromium_job_id = jobstart( g:chromiumAppPath . ' --app=' . shellescape( a:url ))
endfunc
" call LaunchChromium2( 'http://purescript.org' )
" call LaunchChromium( 'https://www.stackage.org/lts-14.1/hoogle?q=map' )
" call LaunchChromium( 'http://localhost:8080' )
" call LaunchChromium2( 'https://milesfrain.github.io/purescript-halogen/guide/03-Performing-Effects.html' )
" call LaunchChromium2( 'https://github.com/purescript-halogen/purescript-halogen/blob/master/docs/guide/03-Performing-Effects.md' )
" call LaunchChromium2( 'https://tailwindcss.com/course/setting-up-tailwind-and-postcss' )

func! StopChromium()
  if exists('g:launchChromium_job_id')
    call jobstop( g:launchChromium_job_id )
    unlet g:launchChromium_job_id
  endif
endfunc
" call StopChromium()


command! -nargs=1 C call LaunchChromium2(<q-args>)
" C 'https://tailwindcss.com/course/setting-up-tailwind-and-postcss'

func! LaunchChromium2( url ) abort
  " if exists('g:launchChromium_job_id2')
  "   call jobstop( g:launchChromium_job_id2 )
  "   unlet g:launchChromium_job_id2
  " endif
  let g:launchChromium_job_id2 = jobstart( g:chromiumAppPath2 . ' --app=' . shellescape( a:url ))
endfunc


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


" ─   Bookmarks                                          ■

nnoremap <leader>bt :CocCommand bookmark.toggle<cr>
" https://github.com/voldikss/coc-bookmark




" ─^  Bookmarks                                          ▲

command! Explorer CocCommand explorer
" nnoremap <leader>oe :CocCommand explorer<cr>
nnoremap <leader>oe :CocCommand explorer --preset simplify<cr>

let g:coc_explorer_global_presets = {
  \   '.vim': {
  \     'root-uri': '~/.vim',
  \   },
  \   'tab': {
  \     'position': 'tab',
  \     'quit-on-open': v:true,
  \   },
  \   'floating': {
  \     'position': 'floating',
  \     'open-action-strategy': 'sourceWindow',
  \   },
  \   'floatingTop': {
  \     'position': 'floating',
  \     'floating-position': 'center-top',
  \     'open-action-strategy': 'sourceWindow',
  \   },
  \   'floatingLeftside': {
  \     'position': 'floating',
  \     'floating-position': 'left-center',
  \     'floating-width': 50,
  \     'open-action-strategy': 'sourceWindow',
  \   },
  \   'floatingRightside': {
  \     'position': 'floating',
  \     'floating-position': 'right-center',
  \     'floating-width': 50,
  \     'open-action-strategy': 'sourceWindow',
  \   },
  \   'simplify': {
  \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
  \   }
  \ }

" Use preset argument to open it
nmap <space>oEd :CocCommand explorer --preset .vim<CR>
nmap <space>oEf :CocCommand explorer --preset floating<CR>

" List all presets
nmap <space>oEl :CocList explPresets




" set filetypes as typescript.tsx
autocmd! BufNewFile,BufRead *.js,*.tsx,*.jsx set filetype=typescript.tsx


