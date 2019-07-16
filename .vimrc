filetype plugin indent on

" vim-plug:
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'
" This is probl. just to have the help/docs available

" File Selectors Browsers: ------------------------------------------
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/ctrlp-mark'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" CtrlPArgs will show the arglist
Plug 'kshenoy/vim-ctrlp-args'

" Plug 'justinmk/vim-dirvish'
" Added a convenient "silent" 'z' buffer local map for the Shdo command window
Plug 'andreasthoelke/vim-dirvish'
" test these
" Plug 'vifm/neovim-vifm'
" Plug 'vifm/vifm.vim'

" Browser Integration: ---------
" Plug 'carlosrocha/vim-chrome-devtools', { 'do': 'npm install && npm run build' }

" Tools: ------------------------------------------
" Show Tags. Note: There is a Haskell integration, but it does not work :Tag.. not..  Update 11-12-2018: It currently does seem to work for Haskell .. see the spock project TODO just purescript does not work
Plug 'majutsushi/tagbar'
" Make the preview window more convienient to use
Plug 'skywind3000/vim-preview'
" Display registers on '"' or "c-r" or @
Plug 'junegunn/vim-peekaboo'
" Vim clipboard features: Delete is not yank, substitute operator, yank buffer
" Plug 'svermeulen/vim-easyclip'
" " Changes: Add every yank position to the jumplist, comment out 'repeat#invalidate()' as it seems to cause jump to the top of the file
Plug 'andreasthoelke/vim-easyclip'
" TODO replace with smaller plugins
" Briefly highlight the yanked region
Plug 'machakann/vim-highlightedyank'
" Highlight trailing whitespace
Plug 'ntpeters/vim-better-whitespace'
" Display marks with nearby code
" Plug 'Yilin-Yang/vim-markbar'
" Changed header style
Plug 'andreasthoelke/vim-markbar'
" Creates vertical window-splits from visual-selections
Plug 'wellle/visual-split.vim'

" Used as tool functions for working with jumps
Plug 'inkarkat/vim-ingo-library'
Plug 'andreasthoelke/vim-EnhancedJumps'

" Just a default split command
" Plug 'vimlab/split-term.vim'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'

" Git: --------------------------------------------------
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv', {'on': ['Gitv']}

" Search: -----------------------------------------------
" Currently using this via "Find"
Plug 'mhinz/vim-grepper'
" Plug 'mileszs/ack.vim'
" Search integration
Plug 'rking/ag.vim'

" Tabline Statusline: -----------------------------------------------------------
" Faster than airline and cleaner config?
Plug 'itchyny/lightline.vim'
" Lightline complient buffer/tabline
" Plug 'mengelbrecht/lightline-bufferline'

" May activate this at times to create styled promptline
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Minimal script that shows all buffernames of a tab
" Plug 'kcsongor/vim-tabbar'

" Shows Tabs as numbers on the right and the buffers of the tab on the left side of the tabline
" Clean code. Extend/ modify this?
" Plug 'pacha/vem-tabline'
" Plug 'pacha/vem-statusline'

Plug 'gcavallanti/vim-noscrollbar'
" Plug 'drzel/vim-line-no-indicator'

" Outside Of Vim:
" Creates tmux colors e.g. at ".tmuxline.conf"
" Plug 'edkolev/tmuxline.vim'
" This inserts unicode icons file-type into airline/bufferline, nerdtree and ctrlp!
" Requires a patched font ("Nerd Font" e.g. "family: MesloLGLDZ Nerd Font") which is set in "alacritty.yaml" or "kitty.conf" or ITerm2 settings.
" Plug 'ryanoasis/vim-devicons'
" Creates a (zsh) command prompt based on vim-airline style: ":PromptlineSnapshot ~/.promptline.sh airline" then in zsh: "source .promptline.sh"
" Plug 'edkolev/promptline.vim'
" True color support:
Plug 'plexigras/promptline.vim'
" Tabline Statusline: -----------------------------------------------------------



" Colorschemes: ------------------
" Plug 'tomasr/molokai'
Plug 'NLKNguyen/papercolor-theme'
" Another colorscheme used (where?)
" Plug 'dim13/smyck.vim'
Plug 'yosiat/oceanic-next-vim'
Plug 'cormacrelf/vim-colors-github'

Plug 'chrisbra/Colorizer'
Plug 'KabbAmine/vCoolor.vim'



" Highlight
" Plug 't9md/vim-quickhl'
" fullscreen mode
" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
" Note taking with vim
" Plug 'fmoralesc/vim-pad', { 'branch': 'devel' }

" Plug 'kshenoy/vim-signature'

Plug 'AndrewRadev/linediff.vim'

" Session: --------------------------------------------------------------
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
" Restore folding
" Plug 'vim-scripts/restore_view.vim'
" TODO test this
" Plug 'Twinside/vim-haskellFold'
Plug 'dbakker/vim-projectroot'
" Plug 'xolox/vim-shell'
" iTerm2 integration
Plug 'sjl/vitality.vim'
" Show undotree with inline diffs and search
" Plug 'simnalamburt/vim-mundo'
Plug 'andreasthoelke/vim-mundo' " removed the string 'ago ' to shorten lines in display

" Autosaves buffers on specific events
Plug '907th/vim-auto-save'

" Mappings: -----------------
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'

" Language Support: -----------------------------------------------------
Plug 'jelera/vim-javascript-syntax'
Plug 'elzr/vim-json'
Plug 'leafgarland/typescript-vim'
Plug 'mityu/vim-applescript'
" Plug 'bendavis78/vim-polymer'
" Plug 'vmchale/dhall-vim'

" Markdown: -------------
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

Plug 'jszakmeister/markdown2ctags'
Plug 'aklt/rel.vim'

" Tmux .config features
Plug 'tmux-plugins/vim-tmux'
" Allows listening to Tmux focus events to allow autoloading files changed outside vim
Plug 'tmux-plugins/vim-tmux-focus-events'
" Vimscript debugging
" Plug 'tpope/vim-scriptease'
" This works, but not sure I need it often
Plug 'chrisbra/csv.vim'

" Nyaovim for realtime markdown writing
" Plug 'andreasthoelke/nyaovim-markdown-preview'

" Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'euclio/vim-markdown-composer'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Code Navagation Editing: ---------------------------------------------
" Plug 'easymotion/vim-easymotion'
Plug 'andreasthoelke/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'bkad/camelcasemotion'
Plug 'tomtom/tcomment_vim'

Plug 'kana/vim-textobj-user'
" This does fail many function types - search alternative
" Plug 'gilligan/vim-textobj-haskell'
" TODO test/document this
Plug 'kana/vim-textobj-fold'
Plug 'coachshea/vim-textobj-markdown'
" Plug 'kana/vim-textobj-function'
" Plug 'blackheaven/vim-textobj-function'
" Add haskell function textobject
Plug 'andreasthoelke/vim-textobj-function'
" Provides around/inner line 'al'/'il' objects
Plug 'kana/vim-textobj-line'
" Plug 'kana/vim-operator-user'

" Aligning: ------------------------------------------------------------
Plug 'junegunn/vim-easy-align'
Plug 'godlygeek/tabular'


" Plug 'purescript-contrib/purescript-vim'
Plug 'andreasthoelke/purescript-vim'
" Plug 'FrigoEU/psc-ide-vim'
" Plug 'coot/psc-ide-vim', { 'branch': 'vim' }


" ─   Haskell IDE features                               ■

" Plug 'parsonsmatt/intero-neovim'
Plug 'andreasthoelke/intero-neovim'

" Plug 'Twinside/vim-hoogle'
Plug 'andreasthoelke/vim-hoogle'

" Haskell IDE Engine HIE:
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': './install.sh'
      \ }

" lookup ":h vim2hs", e.g. Tabularize haskell_types is useful
" Plug 'goolord/vim2hs'
Plug 'andreasthoelke/vim2hs'
Plug 'andreasthoelke/haskell-env'
" Interact with Hoogle Haskell API
Plug 'andreasthoelke/HsAPIExplore'
" Add an identifier to the import section of a hasell file
Plug 'dan-t/vim-hsimport'
" This does show some nice unicode symbols (see "conceal" screenshots).
" TODO customize some symbols e.g return looks not destinct enough. also apply to purescript
" TODO this has some nice unicode conceal suggestions  ~/.vim/plugged/vim-haskellConcealPlus/after/syntax/haskell.vim
" Plug 'enomsg/vim-haskellConcealPlus'
Plug 'eagletmt/ghcmod-vim', {'for': 'haskell'}
" Plug 'eagletmt/ghcmod-vim'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }

Plug 'Shougo/vimproc.vim', {'do': 'make'}

" Plug 'bitc/vim-hdevtools'
" still can't get it to work 9-2018
" create a new project then run: "hdevtools check 'src/Lib.hs'" - runs
" indefinetly
" crashes vim on :HdevtoolsType command


" Problem: this did not indent Record syntax properly
" Plug 'neovimhaskell/haskell-vim'
" Unicode supporting fork
" Plug 'unclechu/haskell-vim'
Plug 'unclechu/haskell-vim', { 'branch': 'my-fork' }
Plug 'idris-hackers/idris-vim'
Plug 'itchyny/vim-haskell-indent'
" Plug 'alx741/vim-hindent'

" compliant with brittany
Plug 'sbdchd/neoformat'

" Syntax Checkers:
" Plug 'jaspervdj/stylish-haskell'
Plug 'w0rp/ale'
" Just 10 lines of code. uses "to" default map
" Plug 'mpickering/hlint-refactor-vim'
Plug 'neomake/neomake'
Plug 'vim-syntastic/syntastic'


" Completion:
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " Plug 'ncm2/ncm2'
  " Plug 'ncm2/float-preview.nvim'
  " Plug 'roxma/nvim-yarp'
  " Plug 'ncm2/ncm2-bufword'
  " Plug 'ncm2/ncm2-path'
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Now substituted by HIE
" Plug 'eagletmt/neco-ghc'
" Plug 'ervandew/supertab'
" did not work with omnicomplete so far

Plug 'thalesmello/webcomplete.vim'

" ─^  Haskell IDE features                               ▲



call plug#end()
" ----------------------------------------------------------------------------------

" This deletes all autocmds of that have the 'ag' tag/group so they aren't registered again when the vimrc is re-sourced
augroup ag
  au!
augroup end




" This needs to be set early in the vimrc, as the mappings below will refer to it!
let mapleader="\<Space>"
let maplocalleader="\\"

" Enables 'setlocal' for filestypes
filetype plugin on


" Increase this for debugging
set verbose=0
" Will write a log file with debug level 9
" vim -V9myVim.log


" let $PATH .= (":" . $HOME . "/.cabal/bin")
" let $PATH .= (":" . "/Users/andreas.thoelke/.local/bin")

" let g:python2_host_prog = '/usr/local/bin/python'
let g:python2_host_prog = '/Users/andreas.thoelke/Library/Python/2.7'
let g:python3_host_prog = '/usr/local/bin/python3'
" strangely Pyhon 3 is installed here:
" /Library/Frameworks/Python.framework/Versions/3.6


" uncomment this to disable Python support
" let g:loaded_python_provider = 1
" let g:loaded_python3_provider = 1

" TODO experiment with textobject?
" /Users/andreas.thoelke/.vim/plugged/vim-textobj-haskell/python/haskell-textobj.py
" let abj = '~/.vim/plugged/vim-textobj-haskell/python/haskell-textobj.py'

" Nice Python Integration Tutorial:
" https://vimways.org/2018/a-python-interface-cookbook/




" Messages: ----------------------------------------------------------------------
" avoid |hit enter| prompts
" set shortmess+="mW"
set shortmess=aoOtT
" Cut completion messages?
set shortmess+=c

" Persistence Saving: -----------------------------------------------------------------

" Undo: -----------------------

" This was somehow set to 1000 before
set undolevels =300

function! ClearUndo()
  let choice = confirm("Clear undo information?", "&Yes\n&No", 2)
  if choice == 1
    let old_undolevels = &undolevels
    set undolevels=-1
    exe "normal a \<Bs>\<Esc>"
    let &undolevels = old_undolevels
    echo "done."
  endif
endfunction
command! ClearUndo :call ClearUndo()<CR>
" echom undofile('.')
" /Users/andreas.thoelke/vimtmp/undo/%Users%andreas.thoelke
" echo &undolevels 

" Mundo: ----------------------
let g:mundo_width = 50
let g:mundo_preview_height = 35
let g:mundo_right = 1
let g:mundo_auto_preview_delay = 10
let g:mundo_verbose_graph = 0
let g:mundo_mirror_graph = 0
let g:mundo_inline_undo = 1

" Z Maps Unimpaired:
" There is only one instance/window of Mundo. Whenever a Mundo window is open, Autosave should be off
" nnoremap you :MundoToggle<cr>:AutoSaveToggle<cr>
" Mundo: ----------------------


" Autosave: -------------------
" Use "AutoSaveToggle" enable/disable
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
let g:auto_save_events = ["CursorHold", "WinLeave", "VimLeavePre"]
" VimLeavePre does not save before Vim displays it's alerts
" Maybe need this?
" let g:auto_save_postsave_hook = 'TagsGenerate'  " this will run :TagsGenerate after each save
" Note: Plugin will "set updatetime=200"
func! AttachAutosaveStopEvents()
  autocmd! BufEnter,WinEnter <buffer> let g:auto_save = 0 | echo "Autsave off"
  autocmd! BufHidden,WinLeave <buffer> let g:auto_save = 1 | echo "Autsave on"
endfunc
" Autosave: -------------------

" Example: Auto insert/update info in source files!
" autocmd BufWritePre,FileWritePre *.vim ks | call LastMod() | 's
" Issue: This clutters the undo-history when used with autosave
" func! LastMod()
"   if line("$") > 20
"     let l = 20
"   else
"     let l = line("$")
"   endif
"   exe "1," . l . "g/Last modified: /s/Last modified: .*/Last modified: " . strftime("%Y %b %d")
" endfun


" Cleanup: ----------------------------------------------------------------------------
" NOTE This might slow down exiting vim
au ag VimLeavePre * call VimLeaveCleanup()
func! VimLeaveCleanup()
  " TODO close all Markbar wins, other tool windows?
  " tabdo windo if &buftype == 'nofile' | close | endif
  Tabdofast Windofast if &buftype == 'nofile' | close | endif
endfunc

" Vim Sessions: -----------------------------------------------------------------------

" Not needed? now after plugin/gitv.vim
" nnoremap <leader>sd :OpenSession! default<cr>:call OpenSessionCleanup()<cr>
nnoremap <leader>sd :OpenSession! default<cr>
nnoremap <leader>so :OpenSession!<cr>
" Load locked session after a vim crash
command! SessionLoadLocked OpenSession!
command! SessionShowName echo xolox#session#find_current_session()

let g:session_autosave = 'yes'
let g:session_autoload = 'no'
let g:session_command_aliases = 1
let g:session_menu = 1

" 'sessionoptions' (default: "blank,buffers,curdir,folds,
" 					       help,tabpages,winsize"

" func! OpenSessionCleanup ()
"   set splitbelow
"   set splitright
" endfunc

set sessionoptions+=folds
set sessionoptions+=curdir
" TODO test this effect?
set sessionoptions+=tabpages
set sessionoptions+=winsize
set sessionoptions+=help
" Don't save hidden and unloaded buffers
set sessionoptions-=buffers

let g:session_persist_font = 0
let g:session_persist_colors = 0
let g:session_autosave_periodic = 0

" Falls back to writing undo file into cwd if "vimtmp/undo" is not available(?)
set undodir=~/vimtmp/undo,.
" Just activates saving the undo history
set undofile

" Default undo steps
" set undolevels=1000

" Restore view settings
set viewoptions=cursor,folds,slash,unix
" set viewdir=$HOME/.vim_view//
set viewdir=~/vimtmp/view//
" au BufWritePost,BufLeave,WinLeave ?* mkview
" au BufWritePost ?* mkview
" au BufWinEnter ?* silent loadview

" Local Plugin Patch:
" ~/.vim/plugged/vim-session/autoload/xolox/session.vim modefied code: commented this line:
  " call xolox#session#save_qflist(a:commands)
" to prevent "call setqflist([])" as this sometimes throws errors on session load.
" Troubleshooting: look at: "e ~/.vim/sessions/default.vim" delete that file or the "...lock" addition
" Issue: "badd" is commented out and only one buffer is reloaded: Solutions: unsolved.


" Shada: (Shared Persistence) ---------
command! ShadaClear :call ClearShada()
" abbrev sc ShadaClear
function! ClearShada()
    echo "Shada file deleted!"
    silent exec "!rm" . ' ~/.local/share/nvim/shada/main.shada'
endfunction

command! ShadaLoad :call LoadShada()
function! LoadShada()
    exec       ':e ~/.local/share/nvim/shada/main.shada'
endfunction

" define what is saved/restored from ~/.local/share/nvim/shada/main.shada
if has('nvim')
  " set shada=",'10,f1,<10,h
  " set shada="!,'100,<50,s10,h,f0"
endif
" only save marks of 10 files, save global marks and only 10 lines in registers
" see: *21.3*	Remembering information; ShaDa

" f0 disables global marks
" uncomment this line to ignore marks on load! (Markers, Marks persisting)
" TODO: as there is a bug that causes that marks can't be deleted, one could just
" delete the shada file to delete the marks
" Shada: ---------


" Vim Sessions: -----------------------------------------------------------------------

" Undotree Mundo: ---------------------------------------------------------------------------


" let g:undotree_WindowLayout = 4
" let g:undotree_ShortIndicators = 1
" In after/plugin/zmaps \bc unimpaired:
" nnoremap you :UndotreeToggle<cr>

" Undotree Mundo: ---------------------------------------------------------------------------


" Fonts: -------------------------------------------------------------------------

" Set Font Props in Alacritty or ITerm2. This is Used for MacVim only:
" set guifont=Menlo:h11.5
" set guifont=Menlo\ for\ Powerline:h11.5
" set guifont=MesloLGSDZ\ Nerd\ Font:h11.5
if has("gui_macvim")
  " "Mono" means: with small icons:
  " set guifont=MesloLGSDZ\ Nerd\ Font\ Mono:h11
  " set guifont=MesloLGSDZ\ Nerd\ Font:h11
  " set guifont=Hasklig:h11
  " set guifont=FuraCode\ Nerd\ Font:h11
  set guifont=Hasklug\ Nerd\ Font:h11
  set linespace=1
  set macligatures
endif



" Fonts: -------------------------------------------------------------------------



" Color:  ------------------------------------------------------------------------

set background=dark
colorscheme munsell-blue-molokai

" set background=light
" colorscheme PaperColor

" let g:airline_theme = 'papercolor'
" let g:lightline = { 'colorscheme': 'PaperColor' }

" colorscheme github
" let g:github_colors_soft = 0

" if has("termguicolors")
"     let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"     set termguicolors
" else
"     set t_Co=256
" endif

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15




" Style Colors: ----------------------------{{{
" Change colors in the colorscheme: Open vimfiles/colors/molokai
" save and run colorscheme molokai
" colorscheme molokai
" colorscheme OceanicNext
" let g:rehash256 = 1}}}

" TODO: show some colors e.g. for TODO: in purescript comments
"       show syntax highlight in purescript comments (within `..code..`)
" Left margin aesthetics

" Set up a rather small column width on the left
set foldcolumn=0
" TODO switch to foldcolumn = 1
set numberwidth=2
set nonumber

" Don't show the Pipe "|" character vertical window split borders
" set fillchars+=vert:\  
" This is to allow a <Space> at the end of an expression
" Note that the \ to escape the ' ' also needs to be escaped, hence the \\
exec "set fillchars+=vert:\\ "
"hsl(348, 100%, 83%) Could also use the "VertSplit" highlight group

" Trailing Whitespace:
" vim-better-whitespace plugin
let g:better_whitespace_guicolor='#333333'
let g:better_whitespace_filetypes_blacklist=['gitcommit', 'unite', 'qf', 'help']
" Notes: highlight TrailingWhitespace guibg=#333333 match TrailingWhitespace /\s\+$/ Remove trailing whitespace: ":%s/\s\+$//e" autocmd BufEnter,WinEnter * call matchadd('Error', '\v\s+$', -1) autocmd BufEnter * call matchadd('Error', '\v\s+$', -1)

" use "StripWhitespace" and "ToggleWhitespace"  
nnoremap <leader>sw :StripWhitespace<cr>

" Tested: unprintable chars, tabs, show trailing whitespace chars
" set list
" set listchars=tab:>-,trail:_,extends:#,nbsp:_

" Try this approach:■■
" augroup myTodo
"   autocmd!
"   autocmd Syntax * syntax match myTodo /\v\_.<(TODO|FIXME).*/hs=s+1 containedin=.*Comment
" augroup END
" highlight link myTodo Todo
" https://vi.stackexchange.com/questions/15505/highlight-whole-todo-comment-line
 "▲▲



" Style Colors: ----------------------------


" General Settings: ------------------------
set cmdheight=3
set ignorecase
set fileencoding=utf-8
set encoding=utf-8
" set backspace=indent,eol,start

" prevents unnecessary execution when sourcing vimrc
if !exists("g:syntax_on")
  syntax enable
endif

set smartcase

" Not compatible with classic "vi" is ok
set nocompatible

" Note: this inverts what 'g' does in substitute!! avoid this
" set gdefault
set incsearch
set showmatch
" Allows to switch buffers without saving
set hidden
set nowrap
" wrapmargin=0
" vim automatically breaks the line/starts a new line after 100 chars
set textwidth=120

" activate line wrapping for a window:
" command! -nargs=* Wrap set wrap linebreak nolist
" Todo: do I want linebreak and nolist?
" Update: linebreak avoids words being split across lines. so I want this, but when wrap is enabled?
" use "set wrap" and "set nowrap" instead?
" command! -nargs=* Wrap set wrap linebreak nolist
" use `gq<motion` or gqq to merely wrap a range/line

set linebreak

" Auto load files that have changed outside of vim! (only when there are no unsaved changes!). This requires
" tmux focus events "FocusGained".
set autoread

" This seems needed to reload files that have changed outside of vim (https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044)
" autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
au ag FocusGained,BufEnter * if mode() != 'c' | checktime | endif
" autocmd FileChangedShellPost *
"   \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
" Issue: This is throwing an error in Command history window

set noswapfile
if has('nvim')
  set cursorline
endif


" augroup CursorLine
"   au!
"   au VimEnter,WinEnter,BufWinEnter * setlocal nocursorline
"   au WinLeave * setlocal nocursorline
" augroup END


" set autochdir
" CAREFUL! this sets the current working directory the the current file on
" every buffer change!!

" TODO do I need all of these?
set wildignorecase
set smartcase
set ignorecase
set infercase
set wildmenu
set wildmode=longest:list,full
" Well behaved flat menu
" set wildmode=longest:full

" Tab navigate the file system while in insert mode
" inoremap <Tab> <c-x><c-f>
" In command mode use <c-d> and Tab

cnoremap <C-t> <C-\>e(<SID>RemoveLastPathComponent())<CR>
function! s:RemoveLastPathComponent()
  return substitute(getcmdline(), '\%(\\ \|[\\/]\@!\f\)\+[\\/]\=$\|.$', '', '')
endfunction

set lazyredraw
set selection=inclusive
" this allows to move the cursor where there is no actual chracter
set virtualedit=all
" Console integration
" Send more characters for redraws
set ttyfast
" Enable mouse use in all modes
set mouse=a

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
" set ttymouse=xterm2

set guioptions =
" set guioptions-=T
" set guioptions-=m
" set guioptions-=r
" set guioptions-=L
" " No graphical tabline in Macvim
" set guioptions-=e

" disable sounds
set noerrorbells
set novisualbell
" why this?
set t_vb=

" General Settings: ------------------------



" GENERAL MAPPINGS: ----------------------------------------------

" TIP: ---------------------------------------------------------------------------
" Python: install from git repo: "pip3 install -e ." in repo, "pip3 list" to confirm

" windows should not be kept at equal size
set noequalalways
set nostartofline


" COMMAND HISTORY: --------------------------------------------
" Type a command slightly more quickly: (also → jumplist)
noremap ; m':
" This requires that all maps that use ":" (commands!) need to be defiled with "nnoremap"/ "vnoremap"
" TODO suspend this. wanted to use this to silence/non-<cr> the dirvish shell commands. → fnid a different map for this
" nnoremap : :silent !

" Open command history with the cursor on the last command. Avoids conflicts with bufferlocal/plugin "q"/quick maps.
" Also avoid accidential Exmode shell, can still be accessed by "gQ"
" TODO change this as Q is now used in CodeMarkup.vim
" nnoremap Q q:k
" vnoremap Q q:k

" Default command history is 20
set history =40

" Issue: Using "q" as sort of a leader key in a custom mapping will delay plugin "q" = quit maps! e.b. in Gstats.
" workaround may be to double/ "qq" or to "q<space" instead.
" Issue: needs two c-c to exit?

" Repeat last command
" To Learn: use "@:"
map <leader>. @:
" nnoremap , @:

" Editing Past Commands: (usage example)
" run "call SomeTest1( 'hithere4' )", do "q;www<c-a><cr>" to see "hithere5" echoed.
" "<cr>" in insert mode runs the command, no need for "<esc>"
" you can "/" seach for past commands in the command history!
" Enter Editing A Command: hit "<c-f>" in command mode!
" Edit Partially Typed Commands: When you are stuck writing out e.g. a path on the command line,
" type "<c-f>" then e.g. "yy" to later either "q:jP" or ':<c-r>"'
" Find in all user commands: - ":filter Intero command" or just ":command"

nnoremap <silent> <leader>pe :call PasteLastEchoText()<cr>
func! PasteLastEchoText()
  exec "RedirMessagesBuf" histget("cmd", -1)
endfunc

" COMMAND HISTORY: --------------------------------------------

" Tab key remap:
" This is documented in .vim/notes/notes-todos.md . Use the following lines to Test <Tab> and <S-Tab>:
" nnoremap œ :echo col('.')<cr>
" nnoremap Œ :echo line('.')<cr>
" TODO currently Tab in command line mode can only be triggered by "c-i"! Now I could set up a command map like this:
" cnoremap œ <C-\>=Tee1()<CR>
" cnoremap œ <c-i>
" nnoremap <leader>abb :call Tee1()<cr>
" func! Tee1()
"   call feedkeys("\<Tab>", 'tn')
" endfunc
" However this does not trigger the Tab completion!


" Unicode: ---------------------------------------------------

inoremap :: <c-k>::
inoremap -> <c-k>->
inoremap <- <c-k><-
inoremap => <c-k>=>
" inoremap <= <c-k><=
inoremap forall <c-k>FA

" To type a unicode char, in insert-mode type "<c-k>a:"
" nnoremap cuc :%s/::/<c-k>::/g<cr>:%s/forall/<c-k>FA/g<cr>
nnoremap cuf :%s/forall/<c-k>FA/ge<cr>
nnoremap cuc :%s/::/<c-k>::/ge<cr>
nnoremap cua :%s/->/<c-k>->/ge<cr>
nnoremap cub :%s/<-/<c-k><-/ge<cr>
nnoremap cue :%s/>=>/>#>/ge<cr>
" safe Kleisi!
nnoremap cud :%s/=>/<c-k>=>/ge<cr>
nnoremap cug :%s/>#>/>=>/ge<cr>
" restore Kleisi!
" vnoremap <leader>bu :s/\%V→/->/ge<cr>:s/\%V∷/::/ge<cr>:s/\%V⇒/=>/ge<cr>
" vnoremap <leader>bi :s/\%V->/→/ge<cr>:s/\%V::/∷/ge<cr>:s/\%V=> /⇒ /ge<cr>

" Alternative for bind? ⤜ or »= or >>= or ≥


" nnoremap cue :%s/<=/<c-k><=/e<cr>
" TODO: could do the reverse replacement to revert back to non-unicode
" also: what to do with 'greater-than-or-qual'?

" Replace all purescript unicode characters
noremap <leader>cu :call PurescriptUnicode()<cr>
fun! PurescriptUnicode()
  " normal cufcuccuacubcudcue
  " TODO: there was a reason to NOT convert forall, what was it??
  normal cufcuccuacubcuecudcuf
endfun


" ─   Movement                                          ──

" ─   General                                           ──
" Go up/down in wrapped lines mode as well
nnoremap j gj
nnoremap k gk

" Add start of visual mode to jumplist
nnoremap v m'v

" Want to go to last visible char most of the times and g_ is tricky to type
nnoremap $ m'g_
onoremap $ g_
vnoremap $ g_

" Add line motions to jumplist
nnoremap ^ m'^
nnoremap 0 m'0

nnoremap zz m'zz

" Note L and H are used for Sneak
noremap ,L L
noremap ,H H
vnoremap ,L L
vnoremap ,H H

" Go back to insert start (+ jumplist)
" autocmd! InsertLeave * exec "normal! m'`["
au ag InsertLeave * call InsertLeave()
" autocmd! InsertEnter * exec "normal! m'"

func! InsertLeave()
  " echo 'hi there'
  " Put end of inserted text into jumplist, then go to the beginning of the insert
  normal! m'`[
  " normal! `[
  " Test if character under cursor is a <space>
  if getline('.')[col('.')-1] == ' '
    normal! w
  endif
endfunc


" Example autocmd timeout jumplist: ■
" This saves the cursor pos to the jumplist when the cursor rested for 4 seconds. See ISSUE below.
" augroup JumplistTimeout
"   au!
"   autocmd CursorHold,CursorMoved * call JumplistTimeout_WaitStart( 5 )
" augroup END
" function! JumplistTimeout_WaitStart( secs )
"   if !exists('g:jumplisttimeout_starttime')
"     " When the cursor-wait starts
"     let g:jumplisttimeout_starttime = localtime()
"     let g:jumplisttimeout_waitloc = getpos('.')
"     " echo "----- WAIT START ------"
"   else
"     " A first cursor-motion happened after a wait was had been started
"     if (localtime() - g:jumplisttimeout_starttime) >= a:secs
"       " this wait was long enought - add the wait loc to the jumplist
"       call AddLocToJumplist( g:jumplisttimeout_waitloc )
"       " echo "saved to loclist!"
"       unlet g:jumplisttimeout_starttime
"     endif
"   endif
" endfunction
" call JumplistTimeout_WaitStart( 3 )
 " ▲

" Add a location (a list as returned by getpos() - [bufnum, lnum, col, off]) to the jumplist, 
" restoring the cursor pos. (Note: this fills in to what I think setpos("''", <loc>) is supposed to do)
func! AddLocToJumplist ( loc )
  let l:maintainedCursorPos = getpos('.')
  " Store the arg-location in the jumplist (there is seemingly no other way to do this)
  " ISSUE: this line jumps the viewport!
  call setpos('.', a:loc)
  normal! m'
  " Go back to original cursor pos
  call setpos('.', l:maintainedCursorPos)
  " This does the same but requires indivitual arg handling: call cursor(a:cursor_pos[1], a:cursor_pos[2])
endfunc
" Test: This is the loc of this >> X << character: [0,1158,30,0]. Run the next the next line, then <c-o> to jump to that char
" call AddLocToJumplist([0,1158,30,0])





" Jumplist: --------------------------------------

" Add cursor-rests to jumplist
augroup JumplistTimeout
  au!
  autocmd CursorHold * exec "normal! m'"
  " Example Debug Jumplist:
  " autocmd CursorHold * call JumpsToQuickfix()
  " autocmd CursorHold * exec "normal! m'" | call JumpsToQuickfix()
  " autocmd CursorHold * exec "normal! m'" | echo localtime()
augroup END
" TODO try this with updatime
" Issue: this interval is also used for tagbar loc update
set updatetime=1000
" Note: This also defines the time you have to c-o to get to the insert end location. And after this time the jumplist
" will also get cleaned up/ suffled a bit. Typically c-i is not useful *after* this time - the jumps then basically become c-o jumps

" Skip cursor-rest jump if cursor hasn't moved (unfortunate fix) 
noremap <silent> <c-o> :call JumpBackSkipCurrentLoc()<cr>
func! JumpBackSkipCurrentLoc ()
  let l:origCursorPos = getpos('.')
  exec 'normal!' "\<C-o>"
  if getpos('.') == l:origCursorPos
    " Jump back one more, /bc the jump back was to the JumplistTimeout autocmd (see below)
    exec 'normal!' "\<C-o>"
  endif
endfunc

nnoremap <leader>cj :clearjumps<cr>

func! JumpsToQuickfix ()
  call setqflist(map( EnhancedJumps#Common#GetJumps('jumps'), function('MapJumpLineToDict') ) )
endfunc
func! MapJumpLineToDict (_, line)
  return EnhancedJumps#Common#ParseJumpLine( a:line )
endfunc

" Example Quickfix Lambda: {{{
" call setloclist(0, map(systemlist('ls -a ~/'), {_, p -> {'filename': p}}))
" call setloclist(0, map(systemlist('ls .vim/notes'), {_, p -> { 'filename': fnamemodify('~/.vim/notes/' . p, ':p:.'),   'text': 'The text: ' . p }}))
" let Abb = { idx, path -> { 'filename': fnamemodify('~/.vim/notes/' . path, ':p:.'), 'lnum': idx, 'text': 'Index: ' . idx }}
" call setloclist(0, map(systemlist('ls .vim/notes'), Abb))
" let Abb = { idx, path -> { 'filename': fnamemodify('~/.vim/notes/' . path, ':p:.'), 'lnum': idx, 'text': 'Index: ' . idx }}
" call setloclist(0, map(systemlist('ls .vim/notes'), Abb))
" Without Lambda: using "v:val" magic var
" call setloclist(0, map(systemlist('ls .vim/notes'), "{'filename': v:val}"))
" call setloclist(0, map( ['.vim/notes/release-notes1.txt', '.vim/notes/color-scheme-doc.md'], "{'filename': v:val, 'col': 2, 'lnum': 4, 'type': '', 'text': 'hi there'}"))
" call setqflist(map( ['.vim/notes/release-notes1.txt', '.vim/notes/color-scheme-doc.md'], "{'filename': v:val, 'col': 2, 'lnum': 4, 'type': '', 'text': 'hi there'}"))
" }}}

" Jumplist: --------------------------------------


" General: -----------------------------------------------------------------------------

nnoremap <leader>cab :vnew *.cabal<cr>

" TODO this does not show a man page outline
nnoremap <leader>g0 g0


" nnoremap <leader>zsh :e ~/.zshrc<cr>
command! Zshrc   :e ~/.zshrc
command! ZshOhMy :e ~/.oh-my-zsh/oh-my-zsh.sh
command! Vimrc   :e ~/.vimrc
command! Cabal   :vnew *.cabal

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

" ignored? based on `:checkhealth`
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

let &t_SI = "\<Esc>]50;CursorShape=0\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set termguicolors
set guicursor=n:block-iCursor
" Option: Blinking cursor: (in ITerm only)
" set guicursor=n:block-iCursor-blinkwait300-blinkon200-blinkoff150
" Cursor Speed: run this in terminal (seemed to not have an effect when last tested): "defaults write NSGlobalDomain KeyRepeat -int 0" for max speed - "2" is the setting from system preferences

" General: ---------------------------------------------------------------------------




" ALE: --------------------------------------------------------
" let g:hindent_on_save = 0
" let g:ale_linters = {'haskell': ['stack-ghc-mod', 'hlint', 'hdevtools']}
let g:ale_linters = {'haskell': ['stack-ghc-mod', 'hlint'],
                    \'javascript': ['eslint'],}
" let g:ale_linters = {'haskell': ['hlint']}
" let g:ale_linters = {'haskell': ['ghc']}
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_enabled = 0
" let g:ale_set_quickfix = 1
" Note: Ale sets the loclist, not the quickfix-list!
let g:ale_emit_conflict_warnings = 0
nnoremap <leader>aa :ALEToggle<cr>

" let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '•'

let g:sign_warning = '⚠'
let g:sign_error = '•'

let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

" let g:ale_set_highlights = 0
" hi link ALEErrorSign    Error
" hi link ALEWarningSign  Warning
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign

" otherwise the bg-color looks off
hi AleErrorSign   ctermfg=white

" let g:airline#extensions#ale#enabled = 1
" needed?

" Configure Hline/Ale warnings!
command! HlintConf :exec (':e ' . projectroot#guess() . '/.hlint.yaml')



" Mappings in the style of unimpaired-next
" nmap <silent> [W <Plug>(ale_first)
" nmap <silent> [w <Plug>(ale_previous)
" nmap <silent> ]w <Plug>(ale_next)
" nmap <silent> ]W <Plug>(ale_last)
" ALE: --------------------------------------------------------


" UNIMPAIRED: -------------------------------------------------

" Note: have to copy maps to ~/.vim/after/plugin/zmaps.vim because unimpaired overwrites

" Todo: add to the dictionary
" Issue: this does not seem to be recognized: (therefore using after/plugins script)
" let g:nnoremap = {"]a": "", "[a": ""}
" let g:nnoremap = {"]a": ':<C-U>call signature#mark#Goto("next", "spot", "global")', "[a": ""}
" "]a" is used for mark navigation

" Disable certain unimpaired maps!:
let g:nremap = {'[b': '', ']b': '', '[t': '', ']t': '', '[T': '', ']T': ''}


" UNIMPAIRED: -------------------------------------------------


" SYNTASIC: ---------------------------------------------------

" Deactivate Syntasic for haskell dev in favour of Ale
let g:syntastic_haskell_checkers = []
let g:syntastic_javascript_checkers = ['jshint']

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
" turn off initially
let g:syntastic_check_on_wq = 0

" let g:psc_ide_syntastic_mode = 1

hi SyntasticErrorSign   ctermfg=white
hi SpellBad term=reverse ctermbg=darkgreen

let g:syntastic_error_symbol = "•"
let g:syntastic_style_error_symbol = "⚠"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_warning_symbol = "⚠"

" Todo Temp:
" nmap <leader>ss :SyntasticToggle<cr>
nnoremap <leader>sc :SyntasticCheck<cr>
nnoremap <leader>st :SyntasticToggleMode<cr>
nnoremap <leader>sr :SyntasticReset<cr>

" SYNTASIC: ---------------------------------------------------


" Neomake: ----------------------------------------------------
" Neomake does the same as Ale
" While Hlint (and stack-ghc-mod?) uses Ale for signs in the signcolumn,
" Intero uses Neomake to show error and ghc warnings
hi NeomakeErrorSign   ctermfg=white
hi NeomakeWarningSign ctermfg=white
hi NeomakeInfoSign    ctermfg=white
hi NeomakeMessageSign ctermfg=white

hi ErrorSign   ctermfg=white
hi WarningSign ctermfg=white
hi IntoSign    ctermfg=white
hi MessageSign ctermfg=white


" Autoexpand quickfix list not always wanted? controlling this elsewhere
" let g:neomake_open_list=2
" let g:neomake_list_height=10

let g:neomake_highlight_columns = 1
let g:neomake_highlight_line = 1
" Uses NVIMs nvim_buf_add_highlight feature

command! SignsClear :sign unplace *
command! ClearSigns :sign unplace *
" Neomake defaults
let g:neomake_error_sign = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {
   \   'text': '⚠',
   \   'texthl': 'NeomakeWarningSign',
   \ }
let g:neomake_message_sign = {
    \   'text': '➤',
    \   'texthl': 'NeomakeMessageSign',
    \ }
let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}
" Neomake: ----------------------------------------------------


" Hdevtools is not yet needed, using Intero instead
" currently it crashes vim on :HdevtoolsType command
" set shell=bash\ -i
" let g:hdevtools_options = '-g-fdefer-type-errors -g-isrc -g-Wall'
" let g:syntastic_haskell_hdevtools_args = g:hdevtools_options
" hdevtools type 'src/Aeson2.hs' 634 1


" GitGutter: -------------------------------------------------------
let g:gitgutter_map_keys = 0

nnoremap <leader>gg :GitGutterToggle<cr>
" Note: Gutter updates on save!

nnoremap ]c <Plug>GitGutterNextHunk
nnoremap [c <Plug>GitGutterPrevHunk
" Issue Note: does not work after buffer change? temp-fix: make a change and safe!
" alt: disable gutter, close file, open file, enable gutter → ]c should work again

" TIP: use: GitGutterUndoHunk, ..PreviewHunk
" TODO: might enable these:
" stage the hunk with <Leader>hs or
" undo it with <Leader>hu.
" TIP: this actually undos the section (hunk). this is specifically useful at
" the yellow "~", to see what was changed!
nnoremap <Leader>hr <Plug>GitGutterUndoHunk
" Todo: not sure how staging a hunk works..
nnoremap <Leader>ha <Plug>GitGutterStageHunk

let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_enabled = 0
let g:gitgutter_diff_base = 'HEAD'

nmap <silent> ]c :GitGutterNextHunk<CR>
nmap <silent> [c :GitGutterPrevHunk<CR>
" nmap <silent> ]c :call NextHunkAllBuffers()<CR>
" nmap <silent> [c :call PrevHunkAllBuffers()<CR>
" nnoremap <expr> ]c &diff ? ']c' : ':call NextHunkAllBuffers()<CR>'
" nnoremap <expr> [c &diff ? '[c' : ':call PrevHunkAllBuffers()<CR>'

nnoremap <expr> <C-J> &diff ? ']c' : '<C-W>j'

"
" GitGutter: -------------------------------------------------------


" let g:ghcmod_open_quickfix_function = 'GhcModQuickFix'
function! GhcModQuickFix()
  " for unite.vim and unite-quickfix
  " :Unite -no-empty quickfix
  " for ctrlp
  :CtrlPQuickfix
  " for FuzzyFinder
  ":FufQuickfix
endfunction




" ------------------------------------------------------
" Paste and delete -------------------------------------

" Paste from the yank register
nnoremap <leader>p "0p
nnoremap <leader>P "0P

" Paste and copy System clipboard
nnoremap <leader><c-p> "+P

" nnoremap <leader>vv "+P
nnoremap <leader>vv "+P:call PurescriptUnicode()<cr>h

" copy from clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Paste to Command line
nnoremap <leader><m-p> :<c-r>"
" <c-r>"


" SOME TOOLS FUNTIONS TIPS: -------------------------------------------------
" in insert mode, the key sequence backslash f p will insert the current working directory
inoremap \fp <C-R>=getcwd()<CR>
" TIP: Move to a blank line, "V" to visually select it, then "!pwd" or "!ls"
" TIP: To insert the RETURN VAL OF ANY VIM FUNCTION into insert position:
" - hit: 'i', then '<strg>r', then '=', then 'SomeTest1("Hi!")'<cr>
" TIP: can also do i<strg>r=system('ls')<cr>  try this:
nmap     <leader>dcg i<c-r>=system('ls')<cr><esc>
nnoremap <leader>ls  i<c-r>=system('ls -a')<cr><esc>
nnoremap <leader>ds  i<c-r>=system('
nnoremap <leader>iwd i<c-r>=system('pwd')<cr><esc>
" Example: a minimal 'choose buffer' prompt:
nnoremap <leader>aab :ls<cr>:b<space>

" TIP: Refer to the current file: "%" or alternate/previous file "#"
" Normal mode: "%p
" Insert mode: i<c-r>%

" nnoremap <leader>fpe :echom @%<cr> " NOTE: use "<c-g>"!
nnoremap <leader>fpc :let @p = @%<cr>
" nnoremap <leader>sf i<c-r>=fnamemodify('package.yaml',':h:t')<cr><esc>^
command! PasteFilepath :normal i<c-r>=expand("%:p")<cr><esc>^

" Abbreviate this string in command mode: "expand('[cursor pos]')" - Note the moved cursor position!
cabbrev ep expand('')<Left><Left><C-R>=Eatchar('\s')<cr>
" Learn: Use like this: ":echo ep #" to get "echo expand('<cword>')" , "<cfile>" for filename under the cursor
" or echo expand('%') echo expand('%:t') " for filename ('tail' of path)
" Learn: Trigger abbreviation with "c-]", avoid it with "c-v" - e.g. "unabbreviate ep<c-v> <cr>"

function! Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c " Tip: matching a pattern
endfunc

" Example: use "getchar()"
nnoremap <leader>abb :echo getchar()<cr>
nnoremap <leader>abb i<c-r>=getchar()<cr>

" TODO a useful prompt?
nnoremap <leader>abb @=

fun! SomeTest1( ar1 )
  if a:ar1 == "abc"
    return "stopping here!"
  endif
  echo "out: " . a:ar1
  return "Some arg: " . a:ar1
endfun


" TIP: print the file type: ":echo &ft"
" (returns filetype as literal string, e.g. 'haskell', instead of 'hs')
" (note the system-variable expression type "&ft". This gets resolved to the file type)
" TIP: copy a past ex-command/vim-shell command: hit "q:"
" TIP: print last messages/errors: ":messages". only "echom" not "echo" writes into this log
" TIP: create a directory: `:! mkdir src/modules`
" TIP: use :substitute command: "%s/exports./var /" replaces "exports.jsvar1 = function" with "var jsvar1 = function" in the whole file!
" TIP: get the string/spaces of how much a line is indented: let indent = matchstr(getline(lnr), '^\s*\ze')
" paste last command: ":p
" redirect command echo text to register: :redir @t, then pt, later :redir end
" TIP: :new creates a new buffer, ":read !cat /etc/shells" → append output of the command to the current buffer at cursor positon.
" run a date/time loop in the shell: "terminal while true; do date; sleep 1; done
" TIP: The expression register reads-in an arbitary expression into the p-register or insert-mode:
" "<c-r>=v:version<cr>" will insert the vim-version in insert-mode, "=v:version<cr> will allow to 'p'/'P' in normal mode
" :let, :let g:, :let b:<cr> lists global-, or buffer-variables
" example: ":let test12=123<cr>" and then in insert mode: <c-r>=test12<cr> will paste "123"
" TIP: look through OS-environment variables: ":echo $" and then TAB
"      example: paste environment variable: "i<c-r>=$SHELL" → /bin/zsh
" TIP: write an environment variable: ":let $TEST12=321"?
" TIP: git config --global core.editor "nvim"
"      lookup: "cat ~/.gitconfig"
" TIP: ad-hock environment variable: in terminal: "export test44=$PATH:~/Documents" this appends another dir to the PATH
" TIP: use (%) current file name in shell: ":!cat %"
" TIP: use 'find' to get full path and then 'gf': terminal: "find $PWD" and then "gf" on the the absolute path
" If Expressions: echo (v:true ? 'yes' : 'no') -- echo (v:false ? 'yes' : 'no')
" TIP: set the cursor pos: let cursor = getcurpos(), call cursor(cursor[1], startColumn - 1)
"      also: line('.') and col('.') get row and column num
" TIP: "<C-z>" to suspend nvim and get back to the terminal. then run "fg" to
" get back to nvim.
" TODO: delete long space between words: "elldw" example: ^ord            next

" TIP: use ":earlier" and ":later" to jump the ":undolist" back and forth in
" *time* (disregarding branches of the undotree). use ":earlier 10m" or ".. 5h" to go back 10 minutes/ 5 hours
" TIP: Vim-anywhere replacement: use: "alfred vim(mac vim)", edit text, then
" do "<leader>ccl" to copy to clipboard and ":q!" vim.
"
"
" SHELL, EMACS MAPPINGS
" beginning-of-line (C-a)
" Move to the start of the current line.
"
" end-of-line (C-e)
" Move to the end of the line.
"
" forward-char (C-f)
" Move forward a character.
"
" backward-char (C-b)
" Move back a character.
"
" Tip: Link local repo to github remote repo:
" "git remote add origin https://github.com/andreasthoelke/dotfiles.git",
" "git push -u origin master" `-u` add upstream tracking(!?)
" "git pull --rebase origin" pull in changes from remote, put all local changes on top of it.
"
" copy a folder: cp -a /source/. /dest/
"



" Replacing: ---------------------------------------------
" nnoremap <leader>re "_die"0P`[
" nmap <leader>re ve"0pb
" nmap <leader>re "_die"0Pb
" nmap <leader>rf "_daf"0PB

" Replace inner word
nnoremap <leader>rw "_diw"0Pb
" nmap yrw "_diw"0Pb
nnoremap yriw "_diw"0Pb
nnoremap yrw Pl"_dwb
" Register, black hole, delete, inner word, paste from yank register, go to beginning

" Replace words
" nmap <leader>rw "_diw"0Pb
" nmap <leader>rW "_diW"0PB
" beginning of pasted text.

" Replace rest of the line
nnoremap <leader>r0 "_d$"0p`[

" Make deleting to black hole register easier?
nnoremap D "_d
" Replacing: ---------------------------------------------



" Folding Folds: ------------------------------------------------

set foldenable
set foldmethod=marker
set foldmarker=\ ■,\ ▲
set foldlevelstart=1

" Partially expand syntax and expression based folding (of markdown and gitv plugins)
" au ag Syntax git set foldlevel=1
" au ag FileType markdown set foldlevel=1
" au ag FileType vim set foldlevel=1
" au ag FileType haskell set foldlevel=1

" Go to the beginning not the end of a previous fold section
nnoremap zk zk[z

" nnoremap z<space> za
" Use this on top of "zj" and "zk"?
" nnoremap ]z :call GoToOpenFold("next")<cr>
" nnoremap [z :call GoToOpenFold("prev")<cr>

" Go to beginning/end of the current fold
nnoremap z] ]z
nnoremap z[ [z

" Example (not used) set ]z and [z go to find open folds{{{
function! GoToOpenFold(direction)
  if (a:direction == "next")
    normal zj
    let start = line('.')
    while foldclosed(start) != -1
      let start = start + 1
    endwhile
  else
    normal zk
    let start = line('.')
    while foldclosed(start) != -1
      let start = start - 1
    endwhile
  endif
  call cursor(start, 0)
endfunction "}}}

set foldtext=DefaultFoldtext()
func! DefaultFoldtext()
  let l:line = getline(v:foldstart)
  let l:subs = substitute(l:line, '{\|"\|--\|▲\|■', '', 'g')
  " return ' ●' . l:subs
  return '▶ ' . l:subs
endfunc

" set fillchars=fold:\

" Don't show the default '.' in the fold text
exec "set fillchars=fold:\\ "
" exec .. is to allow a <Space> at the end of an expression
" Note that the \ to escape the ' ' also needs to be escaped, hence the \\

" Folding: ------------------------------------------------


" Comments: --------------------------

" Issue: this seems needed to prevent the cursor from jumping to the beginning of the line on the first vertical motion after commenting
nnoremap <silent> gcc :TComment<cr>lh
" → zmaps

" Deactivate the TComment "ic" inside comment textobject - as this is mapped to "inside content" with CodeMarkup
let g:tcomment_textobject_inlinecomment = ''

" Comments: --------------------------


" CamelCaseMotion: ------------------------------------------------------
call camelcasemotion#CreateMotionMappings(',')
" map <silent> w <Plug>CamelCaseMotion_w
" map <silent> b <Plug>CamelCaseMotion_b
" map <silent> e <Plug>CamelCaseMotion_e
" sunmap w
" sunmap b
" sunmap e
" omap <silent> iw <Plug>CamelCaseMotion_iw
" xmap <silent> iw <Plug>CamelCaseMotion_iw
" omap <silent> ib <Plug>CamelCaseMotion_ib
" xmap <silent> ib <Plug>CamelCaseMotion_ib
" omap <silent> ie <Plug>CamelCaseMotion_ie
" xmap <silent> ie <Plug>CamelCaseMotion_ie
" imap <silent> <S-Left> <C-o><Plug>CamelCaseMotion_b
" imap <silent> <S-Right> <C-o><Plug>CamelCaseMotion_w
" CamelCaseMotion: ------------------------------------------------------


" Sneak Code Navigation: ------------------------------------------------
" 1-character enhanced 'f'
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
" 1-character enhanced 't'
" nmap ,t <Plug>Sneak_t
" nmap ,T <Plug>Sneak_T
" xmap ,t <Plug>Sneak_t
" xmap ,T <Plug>Sneak_T
" omap ,t <Plug>Sneak_t
" omap ,T <Plug>Sneak_T
" Use L/H for next so ";" and "," can be used elsewhere
map L <Plug>Sneak_;
map H <Plug>Sneak_,
" let g:sneak#label = 1
" let g:sneak#absolute_dir = 1 " 'L' alway navigates forward
let g:sneak#use_ic_scs = 1 " 1 : Case sensitivity is determined by 'ignorecase' and 'smartcase'.
" let g:sneak#target_labels = "funqt/FGHLTUNRMQZ?0"
hi! link Sneak Cursor
augroup colsneak
  autocmd!
  autocmd ColorScheme * hi! link SneakScope Normal
  " autocmd ColorScheme * hi! Sneak guifg=green guibg=orange
  autocmd ColorScheme * hi! link Sneak Cursor
augroup END
" Disables default s-map
nmap <Plug>(go_away_sneak) <Plug>Sneak_s
" Sneak Code Navigation: ------------------------------------------------


" ─   Easymotion Code Navigation                         ■
" Endhanced word and line motions
map <localleader>w <Plug>(easymotion-w)
map <localleader>b <Plug>(easymotion-b)
map <localleader>j <Plug>(easymotion-j)
map <localleader>k <Plug>(easymotion-k)
" Jump to paragraphs
map <localleader><c-l> :call EasyMotion#Paragraph(0, 0)<cr>
map <localleader><c-h> :call EasyMotion#Paragraph(0, 1)<cr>
" Jump to typical spots
map <localleader>l <Plug>(easymotion-lineforward)
map <localleader>h <Plug>(easymotion-linebackward)
" Jump to specific char within a word
nmap <localleader>f <Plug>(easymotion-overwin-f)
xmap <localleader>f <Plug>(easymotion-bd-f)
omap <localleader>f <Plug>(easymotion-bd-f)
" map t <Plug>(easymotion-tl)
" Search replacement
" nmap / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)

let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_do_shade = 0
let g:EasyMotion_disable_two_key_combo = 0
let g:EasyMotion_verbose = 0
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
hi EasyMotionTarget guifg=black guibg=white ctermfg=black ctermbg=white
hi EasyMotionTarget2First guifg=black guibg=white ctermfg=black ctermbg=white
hi EasyMotionTarget2Second guifg=black guibg=white ctermfg=black ctermbg=white
hi EasyMotionIncSearch guifg=black guibg=white ctermfg=black ctermbg=white
" let g:EasyMotion_re_anywhere = '\v' .
"   \ '(<.|^$)' . '|' .
"   \ '(.>|^$)' . '|' .
"   \ '(\l)\zs(\u)' . '|' .
"   \ '(_\zs.)' . '|' .
"   \ '(#\zs.)'

" ─^  Easymotion Code Navigation                         ▲





" Search: ---------------------------------

" Search within subdirectories
set path+=**
" Also use *somecars to fuzzy the first part of the filename

" Find files and populate the quickfix list
command! -nargs=1 FindFile call FindFiles(<q-args>)
func! FindFiles(filename)
  let error_file = tempname()
  silent exe '!find . -name "'.a:filename.'" | xargs file | sed "s/:/:1:/" > '.error_file
  set errorformat=%f:%l:%m
  exe "cfile ". error_file
  copen
  call delete(error_file)
endfunc

" set hlsearch

" nnoremap / :set hlsearch<cr>:noh<cr>/\v
" this seems needed to reactivate hlsearch after nohlsearch
" also the "\v" flag makes sure that I can type regex consistent with other regex engines
nnoremap / :set hlsearch<cr>:noh<cr>/\v
" vnoremap / /\v
" nnoremap <M-/> /

" Search visually selected text
vnoremap // y/<C-R>"<CR>



" HOW TO SEARCH:

" http://vimdoc.sourceforge.net/htmldoc/pattern.html

" Silver searcher
" --------------------------------------------------------------------------------
let g:ag_highlight=1

" --------------------------------------------------------------------------------

" Search next: Select, deselect. Similar to "*" / "#"
" nnoremap <silent> ga m':let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap <silent> ga :call HiSearchCursorWord()<cr>
nnoremap <silent> g- m':set nohlsearch<cr>
" nnoremap <silent> <c-[> m':set nohlsearch<cr>
nnoremap <silent> <c-[> m':set nohlsearch<cr>:call FloatWin_close()<cr>
" Don't add seach next/prev to the jumplist
nnoremap <silent> n :keepjumps normal! n<cr>:call ScrollOff(14)<cr>
nnoremap <silent> N :keepjumps normal! N<cr>
" Note "normal!" ignores all mappings - to prevent recursion

func! HiSearchCursorWord()
  normal! m'
  let cword = expand('<cword>')
  let @/= l:cword
  call histadd( 'search', l:cword )
  set hlsearch
endfunc

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " let g:ctrlp_use_caching = 0
endif

" Color: ----------------------------------

" Hex Color editor vCooler.vim
let g:vcoolor_map = 'glc'
command! ColorPicker VCoolor

" Files Buffer:  --------------------------------------------


"  --- Project Root --------------------------------------------

" let g:rootmarkers = ['.projectroot', 'bower.json', 'package.json', 'stack.yaml', '*.cabal', 'README.md', '.git']
" Prioritise looking for git repo roots
let g:rootmarkers = ['.git', '.projectroot', 'bower.json', 'package.json', 'stack.yaml', '*.cabal', 'README.md']

"
" open file relative to project-root
" nnoremap <expr> <leader>ep ':e '.projectroot#guess().'/'
" well, not really needed?!

" remove/delete a file relative to project-root
nnoremap <expr> <leader>df ':!rm '.projectroot#guess().'/'

command! DelFile :call delete(expand('%')) | bdelete!

" Spell check
command! Spell   :set spell
command! SpellDE :set spelllang=de
command! SpellEN :set spelllang=en

" Show suggestion:
nmap z<c-\> z=

" Open file rel to current buffer dir
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>

" TODO Test Bufenter - TabNewEntered is only for nvim
" Whenever a new tab is created, set the tab-working dir accordingly
" autocmd! TabNewEntered * call OnTabEnter(expand("<amatch>"))
au ag BufEnter * call OnTabEnter(expand("<amatch>"))
func! OnTabEnter(path)
  if isdirectory(a:path)
    let dirname = a:path
  else
    " let dirname = fnamemodify(a:path, ":h")
    let dirname = projectroot#guess( a:path )
  endif
  " Issue: "tcd" makes mksession fail to reload buffers in tabs where tcd was used
  " execute "tcd ". dirname
  execute "lcd ". dirname
endfunc

au ag BufWinEnter * call SetWorkingDirectory(expand("<amatch>"))
func! SetWorkingDirectory(path)
  let dirname = projectroot#guess( a:path )
    " let dirname = fnamemodify(a:path, ":h")
  execute "lcd ". dirname
endfunc

" Change Working Directory: ---------------
nnoremap <expr>dpr ":lcd " . projectroot#guess() . "\n"
nnoremap <expr>dpR ":cd "  . projectroot#guess() . "\n"
" Also consider using ":ProjectRootCD"


" set to current file path
nnoremap <leader>dcf :cd %:p:h<cr>:pwd<cr>
nnoremap <leader>dclf :lcd %:p:h<cr>:pwd<cr>

function! <SID>AutoProjectRootCD()
  try
    if &ft != 'help'
      ProjectRootCD
    endif
  catch
    " Silently ignore invalid buffers
  endtry
endfunction



" Quickfix List: -------------------------------------------------

" Refesh/force some style on the quickfix list:
" autocmd! QuickFixCmdPost * :call QuickfixRefeshStyle()
" autocmd! QuickFixCmdPost * botright copen 8
" autocmd! QuickFixCmdPost * echom "hii"
" TODO test this. This is what Intero uses?
au ag User NeomakeJobFinished call QuickfixRefeshStyle()

function! QuickfixRefeshStyle()
  if len( filter(getqflist(), 'v:val.type == "e"') ) > 0
    exec 'copen'
    exec 'set syntax=purescript'
    exec 'setlocal modifiable'
    exec 'call PurescriptUnicode()'
    exec 'setlocal nomodifiable'
    wincmd p
  else
    exec 'cclose'
  endif
endfunction

" Demo Examples: this also worked:
" autocmd BufReadPost quickfix :call QuickfixRefeshStyle()
" autocmd QuickFixCmdPost * :call WinDo( winnr(), "set syntax=purescript" )
" num of 'valid' entries in quickfixlist:
" echo len(filter(getqflist(), 'v:val.valid'))

command! -nargs=0 -bar QfToArgs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" Quickfix List: -------------------------------------------------



" CTRLP:  --------------------------------------------------
let g:ctrlp_cmd = 'CtrlPBuffer'
" let g:ctrlp_cmd = 'CtrlPMRU'
" let g:ctrlp_map = '<localleader>a'
let g:ctrlp_map = 'go'
nnoremap gp :CtrlPMRU<cr>

" Don't list files fromm certain folders:
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.cache$\|\.stack$\|\.stack-work$\|vimtmp\|undo\bower_components$\|dist$\|node_modules$\|project_files$\|test$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
" This needs a restart to take effect.

let g:ctrlp_root_markers = ['src/', '.gitignore', 'package.yaml', '.git/']
let g:ctrlp_by_filename = 1
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:20,results:40'

" Use the nearest .git directory as the cwd
let g:ctrlp_working_path_mode = 'w'

" Select multiple files with <c-z> then do <c-o> to load the first into the current window (r) and
" the others in vertical splits (v), jump to the first window (j)
let g:ctrlp_open_multiple_files = 'vjr'
" include hidden files (of course!)
let g:ctrlp_show_hidden = 1
let g:ctrlp_follow_symlinks = 2

" <c-v> to reveal/go to buffer if it's shown in a tab-window anywhere
" otherwise opens a vertical split.
let g:ctrlp_switch_buffer = 'V'

let g:ctrlp_match_current_file = 1

" Customize CtrlP mappings:
let g:ctrlp_prompt_mappings = {
  \ 'PrtDeleteEnt()':       ['<c-x>'],
  \ 'PrtClearCache()':      ['<c-R>', '<F5>'],
  \ 'AcceptSelection("h")': ['<c-cr>', '<c-s>'],
  \ }

" let g:ctrlp_extensions = ['dir', 'undo', 'line', 'changes']
" let g:ctrlp_extensions = ['dir', 'line']
" let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
"                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
" let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir']
" let g:ctrlp_extensions = ['undo', 'line', 'changes']
" let g:ctrlp_extensions = ['tag', 'line', 'changes']
let g:ctrlp_extensions = ['dir']


let g:ctrlp_max_files = 2000
let g:ctrlp_max_depth = 10
let g:ctrlp_clear_cache_on_exit = 0
" --- quickfix & loclist ----

" Demo function:
" Set up a "Delete Buffer" map:
" let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }
" func! MyCtrlPMappings()
"     nnoremap <buffer> <silent> <c-x> :call <sid>DeleteBuffer()<cr>
" endfunc
" func! s:DeleteBuffer()
"     let line = getline('.')
"     " let bufid = line =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(line, '\d\+')) : fnamemodify(line[2:], ':p')
"     let bufid = fnamemodify(line[2:], ':p')
"     exec "bd" bufid
"     exec "norm \<F5>"
" endfunc
 " CTRLP:  --------------------------------------------------


" Dirvish: --------------------------------------------------
" Example of how to set up custom maps
" autocmd FileType dirvish nnoremap <buffer><silent> <c-p> :CtrlP<cr>

" Sort folders at the top
let g:dirvish_mode = ':sort ,^.*[\/],'

augroup dirvish_config
  autocmd!
  " Map `t` to open in new tab.
  " Example: buffer local maps
  autocmd FileType dirvish
        \  nnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
        \ |xnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
  " Map `gr` to reload.
  autocmd FileType dirvish nnoremap <silent><buffer> gr :<C-U>Dirvish %<CR>
  " Map `gh` to hide dot-prefixed files.  Press `R` to "toggle" (reload).
  autocmd FileType dirvish nnoremap <silent><buffer> gh :silent keeppatterns g@\v/\.[^\/]+/?$@d _<cr>:setl cole=3<cr>
augroup END

" Dirvish: --------------------------------------------------

" Vifm: -----------------------------------------------------
let g:vifmSplitWidth = 70
let g:vifmFixWidth = 0

" Windows: -----------------------------
set splitbelow
set splitright
" Windows will always have status bar
set laststatus=2

" close win above, below, left, right
nnoremap <c-w>dk <c-w>k<c-w>c
nnoremap <c-w>dj <c-w>j<c-w>c
nnoremap <c-w>dh <c-w>h<c-w>c<c-w>p
nnoremap <c-w>dl <c-w>l<c-w>c

" Jump to rightmost window
nnoremap <c-w>\ <c-w>5l

" Split: current buffer left
nnoremap <c-w>S :vs<cr>
" new buffer left
nnoremap <c-w>N :vnew<cr>
" Note: the standard map "<c-w>s" & "<c-w>n" will split below

" Vim Rel Links:
" ":h rel-links" - "gk" split right. though "c-w f" splits below - TODO
let g:rel_open = 'vsplit'

" Resize: Using <c-./,> maps from Karabiner
" Note: Can't Control-map non-alphanum chars like "."/period:
" nnoremap <c-.> :exec "resize +4"<cr>
nnoremap ≥ :vertical resize +4<cr>
nnoremap ≤ :resize +4<cr>

" Note: - "<c-s-.>", "<c-s-,>", "<c-.>", "<c-,>" are not possible within Vim, thus remapping these
" keys to "alt-t",   "alt-s-,", "alt-.", "alt-,". Used "alt-t" instead of "alt-s-." which is a partial character

" Still use the native maps as they allow to 'move back' a step
nnoremap <c-w>- 4<c-w>-
nnoremap <c-w>+ 4<c-w>+
nnoremap <c-w>> 4<c-w>>
nnoremap <c-w>< 4<c-w><

" Note: Consider adopting tmux map <prefix>HJKL

" Pinning Windows:
" Pin paragraph "window pin"
nmap <leader>wp <Plug>(Visual-Split-SplitAbove)ip
xmap <leader>wp <Plug>(Visual-Split-VSSplitAbove)

" Workaround to force vim-help to open below
" augroup vimrc_help
"   autocmd!
"   autocmd BufEnter *.txt if &buftype == 'help' | wincmd J | endif
" augroup END

" Windows: -----------------------------



" Tabs: -----------------------------------------
" next - prev tab
nnoremap <c-f> gt
nnoremap <c-d> gT

" Move tab commands are vim-repeatable
map <localleader>t[ <Plug>TabmoveLeft
map <localleader>t] <Plug>TabmoveRight
noremap <silent> <Plug>TabmoveLeft  :tabmove -1<cr>:call repeat#set("\<Plug>TabmoveLeft")<cr>
noremap <silent> <Plug>TabmoveRight :tabmove +1<cr>:call repeat#set("\<Plug>TabmoveRight")<cr>

" zoom/duplicate the current buffer in a new tab
nnoremap <c-w>t :tabe %<cr><c-o>
nnoremap <c-w><c-t> :tabe %<cr><c-o>

" close tab and go to the previous window
" nnoremap <localleader>tc :call CloseTabGoToPrevious()<cr>
nnoremap <localleader>x :call CloseTabGoToPrevious()<cr>
function! CloseTabGoToPrevious()
  if tabpagenr("$") > 1 && tabpagenr() > 1 && tabpagenr() < tabpagenr("$")
    tabclose | tabprev
  else
    tabclose
  endif
endfunction


" This has to be disabled, otherwise <leader>1 .. maps get overwritten.
let g:airline#extensions#tabline#buffer_idx_mode = 0

nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <Leader>^ :exe "tabn " . g:lasttab<CR>

if !exists('g:lasttab')
  let g:lasttab = 1
endif

au ag TabLeave * let g:lasttab = tabpagenr()


" Tabs: -----------------------------------------


" Buffers: -----------------------------------------

" TODO this map isn't really used/appropriate?
" Prevent closing a window when closing a buffer
" nnoremap \X :bp<bar>sp<bar>bn<bar>bd!<CR>
" some as: ?
" nnoremap \X :bp | :sp | :bn | :bd!<CR>
nnoremap <leader>bd :bd<cr>
nnoremap <leader>bD :bd!<cr>

" Buffers: -----------------------------------------



" General Leader Cmd Shortcut Maps: ---------------------------------

nnoremap <silent> <localleader>QA :wqa<cr>
nnoremap <localleader>QQ :q<cr>

" Shortcuts to popular folders:
nnoremap <leader>ou :tabe ~/.vim/utils/<cr>
nnoremap <leader>on :tabe ~/.vim/notes/<cr>
nnoremap <leader>ov :tabe ~/.vimrc<cr>
nnoremap <leader>od :tabe ~/Documents/<cr>
nnoremap <leader>oh :tabe ~/Documents/Haskell/<cr>
nnoremap <leader>oc :tabe ~/Documents/Haskell/6/<cr>

" nnoremap gw :w<cr>
" nnoremap <localleader>w :w<cr>

nnoremap <localleader>t. :t.<cr>

" Vim Plug:
nnoremap <leader>pc :PlugClean<cr>
nnoremap <leader>pi :PlugInstall<cr>

nnoremap <leader>op :tabe ~/.vim/plugged/<cr>

" General Leader Cmd Shortcut Maps: ---------------------------------



" General: ----------------------------------------------------------

" Exit insert mode
" inoremap <c-[> <esc>l


" General: ----------------------------------------------------------


" Scrolling: ------------------------

" Cursor offset from window top and buttom
set scrolloff=8

" Scroll the current cursor line into view with <offset> lines
func! ScrollOff( offset )
  if winline() < a:offset
    return
  endif
  let scof = &scrolloff
  exec 'set scrolloff=' . a:offset
  redraw
  exec 'set scrolloff=' . l:scof
endfunc

" Move when using "c-d" (down) and "c-u" (up)
set scroll=4

nnoremap <c-y> 4<c-y>
nnoremap <c-e> 4<c-e>

nnoremap <C-j> jjj
nnoremap <C-k> kkk
vnoremap <C-j> jjj
vnoremap <C-k> kkk

" nnoremap <C-H> {{j
" nnoremap <C-L> }}{j

" Vertical scrolling
nnoremap zh 7zh
nnoremap zl 7zl

" Shift cursor line to the top or bottom
nnoremap zH zt
nnoremap zL zb

" Scrolling: ------------------------

" Show syntax highlighting groups for word under cursor
nnoremap <F4> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" ---------------------------------------------------------
" Edit MACRO:
" Record it into the register t: qt---q
" show the t register :reg t
" paste the t register :put t or "tp
" edit the text, keep wired characters 'f,lli'
" then visually select the macro characters f,lli and type "dy to yank it
" into the d register
" alternativly you can v-select the following let statement
" let @s = 'f,lli\'
" type y, then deselect and then
" paste it into the command line with <leader><alt>p and return
" you can now run the macro by typing @d
" ---------------------------------------------------------

" Delete-CUT element and black hole delete the space after it, to
" be able to paste the cut element
" Todo: ? does not work
" nmap de die"_dl

" Diffing: --------------------------------------------------------
nnoremap <silent> <F5><F5> :call DiffToggle()<CR>
function! DiffToggle()
    if &diff
        diffoff
    else
        diffthis
    endif
endfunction

vnoremap <leader>di :Linediff<cr>
nnoremap <leader>dr :LinediffReset<cr>

set diffopt+=vertical


" Show a Git diff of the current file
command! Diff execute 'w !git diff --no-index % -'
" - "RedirMessagesTab Diff" creates a file of only the code that has changed (nice for searching).
"   just delete the first column (the "+") to see syntax highlighting.

" Diffing: --------------------------------------------------------


" Magit: ----------------------------------------------------------
let g:magit_default_show_all_files = 1
let g:magit_default_fold_level = 1
" let g:magit_default_sections = ['info', 'global_help', 'commit', 'staged', 'unstaged']
let g:magit_default_sections = ['commit', 'staged', 'unstaged']

" Z Maps Unimpaired:
" There may be muliple Magit windows. Only when the focus is on any of there Autosave should be off
" nnoremap yog :Magit<cr>:call AttachAutosaveStopEvents()<cr>:let g:auto_save = 0

" Magit: ----------------------------------------------------------

" Don't show "-- INSERT --" in command line when in insert mode?
set noshowmode

" Unicode: -----------------
" https://unicode-table.com
" https://unicode-table.com/en/blocks/supplemental-mathematical-operators/

" Arglist: -----------------
nnoremap <leader>oa :CtrlPArgs<cr>
" https://github.com/junegunn/fzf.vim/issues/605

" -----------------------------------------------------------------
" -----------------------------------------------------------------




" Fugitive Gitv: -----------------------------------------------------------

nnoremap <leader>gv :Gitv<cr>
nnoremap <leader>gV :Gitv!<cr>

nnoremap <leader>Gs :Gstatus<cr>

let g:Gitv_CustomMappings = {
  \'update': 'r',
\}

" autocmd BufNewFile,BufRead fugitive://* set bufhidden=delete

" Disable neovim terminal when e.g. ":Git checkout master" (experimental)
let g:fugitive_force_bang_command = 1

" Deletes hidden fugitive buffers when I hide them?
" au ag BufReadPost fugitive://* set bufhidden=delete

" Fugitive Gitv: -----------------------------------------------------------


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



" Tagbar: --------------------------------------------------------------------------
" In ~/.vim/after/plugin/zmaps.vim
" nnoremap yot :TagbarToggle<cr>
" Use this because tagbar is the rightmost win?
" nnoremap to :TagbarOpen j<cr>
nnoremap <leader>to :TagbarToggle<cr>
" discontinued maps
" nnoremap <leader>th :TagbarClose<cr>
" nnoremap <leader>to :TagbarOpen j<cr>
let g:tagbar_width = 23
let g:tagbar_zoomwidth = 0
let g:tagbar_indent = 1
let g:tagbar_autoshowtag = 0
let g:tagbar_autopreview = 0
let g:tagbar_silent = 1
let g:tagbar_compact = 1

" don't use the defaul <space> map
let g:tagbar_map_showproto = ''

" Tagbar: --------------------------------------------------------------------------

" Peekaboo: -------------------"
" Delay to display the peedaboo window"
" let g:peekaboo_delay = 1000
" let g:peekaboo_delay = 0
let g:peekaboo_prefix = '<leader>'

" A yank in vim writes to the system clipboard, and a system copy is available to paste in vim. but gets overwritten at the first yank.
set clipboard=unnamed

" Easyclip: ----------------------------------------
let g:EasyClipUseYankDefaults = 1
let g:EasyClipUseCutDefaults = 0
let g:EasyClipUsePasteDefaults = 1

let g:EasyClipEnableBlackHoleRedirect = 1
let g:EasyClipEnableBlackHoleRedirectForSelectOperator = 0

let g:EasyClipUsePasteToggleDefaults = 0
let g:EasyClipUseSubstituteDefaults = 0

" Paste features
let g:EasyClipAutoFormat = 1
nmap <leader>cf <plug>EasyClipToggleFormattedPaste
imap <c-v> <plug>EasyClipInsertModePaste
cmap <c-v> <plug>EasyClipCommandModePaste
" Also use

" This keeps the cursor at the position where the paste occured
nmap p <Plug>G_EasyClipPasteAfter`[
nmap P <Plug>G_EasyClipPasteBefore`[
" Note: not sure what these do - the cursor pos is not maintained. now added "`[" which moves the cursor to the beginning
xmap p <Plug>XEasyClipPaste`[
xmap P <Plug>XEasyClipPaste`[
xmap S <Plug>XEasyClipPaste`[
" Subtitute motion
nmap S <Plug>G_SubstituteOverMotionMap
" nmap S <Plug>G_SubstituteToEndOfLine
nmap SS <Plug>SubstituteLine

" Cut Move:
nmap <localleader>d <Plug>MoveMotionPlug
xmap <localleader>d <Plug>MoveMotionXPlug
nmap <localleader>dd <Plug>MoveMotionLinePlug

" Yank Buffer History: Save yank history to file - allows to paste in other vim instance
let g:EasyClipShareYanks = 1
" Prefer to have a clean view in the visual menu
let g:EasyClipYankHistorySize = 6
" Use a menu to select from the yank buffer
" Note: use <leader>"<regnumber> instead
nnoremap <leader>P :IPasteBefore<cr>

nmap ,p <plug>EasyClipPasteUnformattedAfter
nmap ,P <plug>EasyClipPasteUnformattedBefore

" Easyclip: ----------------------------------------


" Vim Highlighedhank:
let g:highlightedyank_highlight_duration = 700
" hi! HighlightedyankRegion guibg=#585858
hi! link HighlightedyankRegion Search


" Marks: ----------------------------------------------------------------

let g:markbar_marks_to_display = 'abcdefghijklnpqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

" generate maps to include a markbar update in the map
func! MapMarks ()
  " Note this lacks the o, m! for open an update maps
  let l:labels = split( g:markbar_marks_to_display, '\zs')
  for label in l:labels
    exec 'nmap m'  . label .  ' m' . l:label . ':MarkbarUpdate<cr>'
    " exec "nmap \'" . label . " \'" . l:label
    exec 'nnoremap M'  . label .  ' :delm ' . l:label . '<cr>' . ':MarkbarUpdate<cr>' . ':call ForceGlobalRemovalMarks()<cr>'
  endfor
endfunc
call MapMarks()

command! MarkbarUpdate call markbar#ui#RefreshMarkbar(g:__active_controller)

command! DelLocalMarks  exec 'delmarks a-z' | call ForceGlobalRemovalMarks()
command! DelGlobalMarks exec 'delmarks A-Z' | call ForceGlobalRemovalMarks()


" TODO Ctrlp-mark plugin useful?
nnoremap <leader>om :CtrlPMark<cr>

" Issue: Deleted markers are currcntly recreated after session save/load a temp fix is to "ShadaClear".
" Adopted from https://github.com/kshenoy/vim-signature/blob/eaa8af20ac4d46f911a083298d7a19e27be180e0/autoload/signature/mark.vim#L324
function! ForceGlobalRemovalMarks()
  " Description: Edit viminfo/shada file to forcibly delete Global mark since vim's handling is iffy
  if has('nvim') | wshada! | else | wviminfo! | endif
endfunction

" Markbar: --------------------------------------------------------------------------"
nmap yom <Plug>ToggleMarkbar
" nmap mo <Plug>OpenMarkbar | wincmd p
nmap mo :call g:standard_controller.toggleMarkbar()<cr>:wincmd p<cr>
nmap mm :call markbar#ui#RefreshMarkbar(g:__active_controller)<cr>
let g:markbar_enable_peekaboo = v:false
let g:markbar_width = 30
" Default mark name should just be the plain filename- no extension
func! MarkbarPlainFName(mark_data) abort
    return fnamemodify( a:mark_data['filename'], ':t:r')
    " return printf('l: %4d, c: %4d', a:mark_data['line'], a:mark_data['column'])
endfunc
" For win-local marks
let g:markbar_mark_name_format_string = ''
let g:markbar_mark_name_arguments = []
" For global/file marks
let g:markbar_file_mark_format_string = '%s'
let g:markbar_file_mark_arguments = [ function('MarkbarPlainFName') ]
" let g:markbar_file_mark_format_string = '-- %s'
" let g:markbar_file_mark_arguments = ['fname']
" No indent
let g:markbar_context_indent_block = ''
" No highlighting
let g:markbar_enable_mark_highlighting = v:false
let g:markbar_context_indent_block_NOWARN = 1

" number of lines of context to retrieve per mark
let g:markbar_num_lines_context = 2
" TODO: changing this global var updates the markbar display automatically!

let g:markbar_close_after_go_to = v:false

" markbar-local mappings
let g:markbar_jump_to_mark_mapping  = 'o'
let g:markbar_next_mark_mapping     = '<c-n>'
let g:markbar_previous_mark_mapping = '<c-p>'
let g:markbar_rename_mark_mapping   = '<c-r>'
let g:markbar_reset_mark_mapping    = '<c-b>'
let g:markbar_delete_mark_mapping   = '<c-x>'


" Markbar: --------------------------------------------------------------------------


" Rel Links: -------------
nmap gk <Plug>(Rel)
" see "h rel-links" or help:rel.txt#/should%20refer
" example: ~/.vimrc#/set
" Rel Links: -------------


" GOYO LIMELIGHT: -----------------------------------------------------------------------
function! s:goyo_enter()
  set scrolloff=13
  Limelight
  hi Search guibg=#3E3E3E guifg=#DDDDDD
  hi Visual guibg=#3E3E3E gui=none
endfunction

function! s:goyo_leave()
  set scrolloff=13
  Limelight!
  hi Search guibg=#3E3E3E guifg=#DDDDDD
  hi Visual guibg=#3E3E3E gui=none
endfunction

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 2
let g:limelight_default_coefficient = 0.8

augroup goyo
  autocmd!
  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()
augroup END

" ---- GOYO - LIMELIGHT -----------------------------------------------------------------------


" Quickfix loclist ----
" Quickfix Navigation: - "leader qq", "]q" with cursor in code, "c-n/p" and "go" with cursor in quickfix list
au ag BufWinEnter quickfix call QuickfixMaps()
func! QuickfixMaps()
  nnoremap <buffer> go :.cc<cr>:wincmd p<cr>
  nnoremap <buffer> <c-n> :cnext<cr>:wincmd p<cr>
  nnoremap <buffer> <c-p> :cprev<cr>:wincmd p<cr>
  nnoremap <silent><buffer> p :PreviewQuickfix<cr>
  nnoremap <silent><buffer> P :PreviewClose<cr>
  " autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
  " autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
endfunc


" nmap <leader>ll :lopen<cr>:Wrap<cr>
nnoremap <leader>ll :lopen<cr>
" nmap <leader>qq :copen<cr>
" Todo: this get's overwrittern on quickfix refesh:
" nnoremap <leader>qq :copen<cr>:set syntax=purescript<cr>
nnoremap <leader>qq :copen<cr>





hi Directory guifg=#11C8D7 ctermfg=DarkMagenta


let g:easy_align_delimiters = {
\ '>': { 'pattern': '>>\|=>\|>' },
\ '/': {
\     'pattern':         '//\+\|/\*\|\*/',
\     'delimiter_align': 'l',
\     'ignore_groups':   ['!Comment'] },
\ ']': {
\     'pattern':       '[[\]]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ ';': { 'pattern': ';\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment']  },
\ ')': {
\     'pattern':       '[()]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ 'd': {
\     'pattern':      ' \(\S\+\s*[;=]\)\@=',
\     'left_margin':  0,
\     'right_margin': 0
\   }
\ }


" Obsolete, use :h json_encode()
" copied from purescript - pscide-mac:
" fun! s:jsonEncode(thing, ...)
"   let nl = a:0 > 0 ? (a:1 ? "\n" : "") : ""
"   if type(a:thing) == type("")
"     return '"'.escape(a:thing,'"\').'"'
"   elseif type(a:thing) == type({}) && !has_key(a:thing, 'json_special_value')
"     let pairs = []
"     for [Key, Value] in items(a:thing)
"       call add(pairs, s:jsonEncode(Key).':'.s:jsonEncode(Value))
"       unlet Key | unlet Value
"     endfor
"     return "{".nl.join(pairs, ",".nl)."}"
"   elseif type(a:thing) == type(0)
"     return a:thing
"   elseif type(a:thing) == type([])
"     return '['.join(map(copy(a:thing), "s:jsonEncode(v:val)"),",").']'
"     return
"   elseif string(a:thing) == string(s:jsonNULL())
"     return "null"
"   elseif string(a:thing) == string(s:jsonTrue())
"     return "true"
"   elseif string(a:thing) == string(s:jsonFalse())
"     return "false"
"   else
"     throw "unexpected new thing: ".string(a:thing)
"   endif
" endf
"
" fun! s:jsonNULL()
"   return {'json_special_value': 'null'}
" endf
" fun! s:jsonTrue()
"   return {'json_special_value': 'true'}
" endf
" fun! s:jsonFalse()
"   return {'json_special_value': 'false'}
" endf
" fun! s:jsonToJSONBool(i)
"   return  a:i ? s:jsonTrue() : s:jsonFalse()
" endf

" ------- Git gutter ----------------------------------
function! NextHunkAllBuffers()
  let line = line('.')
  GitGutterNextHunk
  if line('.') != line
    return
  endif

  let bufnr = bufnr('')
  while 1
    bnext
    if bufnr('') == bufnr
      return
    endif
    if !empty(GitGutterGetHunks())
      normal! 1G
      GitGutterNextHunk
      return
    endif
  endwhile
endfunction

function! PrevHunkAllBuffers()
  let line = line('.')
  GitGutterPrevHunk
  if line('.') != line
    return
  endif

  let bufnr = bufnr('')
  while 1
    bprevious
    if bufnr('') == bufnr
      return
    endif
    if !empty(GitGutterGetHunks())
      normal! G
      GitGutterPrevHunk
      return
    endif
  endwhile
endfunction
" ------- Git gutter ----------------------------------




" Utilities: --------------------------------------------------------------------------

" Make sure the cursor position and view does not change when running the ex-command{{{
func! ExecKeepView(arg)
  let l:winview = winsaveview()
  exec a:arg
  call winrestview(l:winview)
endfunc "}}}

" Make sure the cursor position and view does not change when calling the function
func! CallKeepView( fnname, args )
  let l:winview = winsaveview()
  " Calls function of this name with the args in the list (length must be == fn args)
  call call( a:fnname, a:args )
  call winrestview(l:winview)
endfunc
" Tests{{{
" echo call( "Test3", ["aber"])
" echo CallKeepView('Test3', ['eins'])
" func! Test3( ar )
"   echo ('the arg: ' . a:ar)
" endfunc}}}



function! HandleURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;"]*')
  " See https://regexr.com/41u3c
  echo s:uri
  if s:uri != ""
    silent exec "!open '".s:uri."'"
  else
    echo "No URI found in line."
  endif
endfunction
" Works on these lines no matter where the cursor is: test "http://yahoo.com" vs: test http://yahoo.com

" Just like windo, but restore the current window when done.
function! WinDo(command)
  let currwin=winnr()
  execute 'windo ' . a:command
  execute currwin . 'wincmd w'
endfunction
com! -nargs=+ -complete=command Windo call WinDo(<q-args>)
" Just like Windo, but disable all autocommands for super fast processing.
com! -nargs=+ -complete=command Windofast noautocmd call WinDo(<q-args>)

" Like tabdo but restore the current tab.
function! TabDo(command)
  let currTab=tabpagenr()
  execute 'tabdo ' . a:command
  execute 'tabn ' . currTab
endfunction
com! -nargs=+ -complete=command Tabdo call TabDo(<q-args>)
com! -nargs=+ -complete=command Tabdofast noautocmd call TabDo(<q-args>)

command! JSONFormat exec "%!python -m json.tool"

" Chrome Bookmarks: a simple big JSON file "Library/Application\ Support/Google/Chrome/Default/Bookmarks"
command! ChromeBookmarks exec ":tabe Library/Application\ Support/Google/Chrome/Default/Bookmarks"


" Redirect Vim Messages: --------------------------------------------------------------
" Code from https://stackoverflow.com/questions/2573021/how-to-redirect-ex-command-output-into-current-buffer-or-file
function! RedirMessages(msgcmd, destcmd)
  redir => message
  " Execute the specified Ex command, capturing any messages that it generates into the message variable.
  silent execute a:msgcmd
  redir END
  if strlen(a:destcmd) " destcmd is not an empty string
      silent execute a:destcmd
  endif
  silent put=message
endfunction

command! -nargs=+ -complete=command RedirMessagesBuf call RedirMessages(<q-args>, ''       )
command! -nargs=+ -complete=command RedirMessagesWin call RedirMessages(<q-args>, 'new'    )
command! -nargs=+ -complete=command RedirMessagesTab call RedirMessages(<q-args>, 'tabnew' )
" :BufMessage registers
" :WinMessage ls
" :WinMessage let g:
" :WinMessage let b:
" :WinMessage let v:
" :TabMessage echo "Key mappings for g.." | map g

" Just an altenative to the above
funct! RedirMessages2(command, to)
  exec 'redir '.a:to
  exec a:command
  redir END
endfunct
" call RedirMessages2('ls', '=>g:buffer_list')

command! -nargs=+ RedirectMessages call call(function('RedirMessages2'), split(<q-args>, '\s\(\S\+\s*$\)\@='))
" :RedirMessages2 ls @">
" :RedirMessages2 ls =>g:buffer_list
" :RedirMessages2 ls >buffer_list.txt
" Redirect Vim Messages: --------------------------------------------------------------



" Window Resize: -----------------------------------------------------------------
function! IsLeftMostWindow()
    let curNr = winnr()
    wincmd h
    if winnr() == curNr
        return 1
    endif
    wincmd p " Move back.
    return 0
endfunction

function! IsTopMostWindow()
    let curNr = winnr()
    wincmd k
    if winnr() == curNr
        return 1
    endif
    wincmd p " Move back.
    return 0
endfunction

" Window Resize: -----------------------------------------------------------------


" TODO use runtimepath to lazyload

" ─   " Helper functions                                ──
source ~/.vim/utils/utils-search.vim
source ~/.vim/utils/utils-search-replace.vim
source ~/.vim/utils/utils-code-line-props.vim
source ~/.vim/utils/utils-code-haskell.vim
source ~/.vim/utils/utils-syntax-color.vim
source ~/.vim/utils/utils-general-helpers.vim

" ─   Haskell maps and syntax additions                 ──
source ~/.vim/utils/HsMotions.vim
source ~/.vim/utils/HsSyntaxAdditions.vim
source ~/.vim/utils/CodeMarkup.vim
source ~/.vim/utils/HsAPIExplore.vim
" Note: There is an unfinished plugin here:
" tabe .vim/plugged/HsAPIExplore/autoload/HsAPIExplore.vim
" call HsAPIExplore#start()
" Intero maps and helpers:
source ~/.vim/utils/tools-intero.vim
source ~/.vim/utils/utils-align.vim
source ~/.vim/utils/utils-format.vim
source ~/.vim/utils/utils-stubs.vim

" ─   " General tools                                   ──
source ~/.vim/utils/utils-terminal.vim
" Todo: move the helper/commands in this note file
source ~/.vim/notes/notes-workflow.vim
source ~/.vim/utils/utils-vimscript-tools.vim
source ~/.vim/utils/tools-markdown.vim
source ~/.vim/utils/utils-chromium.vim
source ~/.vim/utils/utils-floatwin.vim
source ~/.vim/utils/tools-tab-status-lines.vim
source ~/.vim/utils/tools-langClientHIE-completion.vim


" ─   " Minor                                           ──
source ~/.vim/utils/utils-virtualtext.vim
source ~/.vim/utils/utils-csv.vim
source ~/.vim/utils/utils-applescript.vim
" source ~/.vim/utils/GuiVim.vim

" ─   " Split-out setup sections                        ──
source ~/.vim/utils/setup-tags.vim



" Accounts
let g:accountsGithub = ''
let g:accountsGithub = readfile( expand( '~/.vim/accounts/github' ) )[0:0][0]



