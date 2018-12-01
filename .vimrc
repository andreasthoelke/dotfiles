filetype plugin indent on

" vim-plug:
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'
" This is probl. just to have the help/docs available

" File Selectors Browsers: ------------------------------------------
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'justinmk/vim-dirvish'
" Added a convenient "silent" 'z' buffer local map for the Shdo command window 
Plug 'andreasthoelke/vim-dirvish'
" test these
" Plug 'vifm/neovim-vifm'
" Plug 'vifm/vifm.vim'

" Completion: -------------------------------------
Plug 'ajh17/VimCompletesMe'

Plug 'majutsushi/tagbar'
" there is a Haskell integration, but it does not work :Tag.. not..

" Git Integration: --------------------------------------------------
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv', {'on': ['Gitv']}

" Search Integration: -----------------------------------------------
" Currently using this via "Find"
Plug 'mhinz/vim-grepper'
Plug 'mileszs/ack.vim'
" Search integration
Plug 'rking/ag.vim'

" Styling: -----------------------------------------------------------
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Creates tmux colors e.g. at ".tmuxline.conf"
" Plug 'edkolev/tmuxline.vim'
" This inserts unicode icons file-type into airline/bufferline, nerdtree and ctrlp!
" Requires a patched font ("Nerd Font" e.g. "family: MesloLGLDZ Nerd Font") which is set in "alacritty.yaml" or "kitty.conf" or ITerm2 settings.
" Plug 'ryanoasis/vim-devicons'
" Creates a (zsh) command prompt based on vim-airline style: ":PromptlineSnapshot ~/.promptline.sh airline" then in zsh: "source .promptline.sh"
Plug 'edkolev/promptline.vim'

" Color schemes
Plug 'tomasr/molokai'
" Another colorscheme used (where?)
Plug 'dim13/smyck.vim'
Plug 'yosiat/oceanic-next-vim'
Plug 'cormacrelf/vim-colors-github'

Plug 'chrisbra/Colorizer'
Plug 'KabbAmine/vCoolor.vim'

Plug 'rhysd/nyaovim-popup-tooltip'


" Highlight
" Plug 't9md/vim-quickhl'
" fullscreen mode
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Note taking with vim
" Plug 'fmoralesc/vim-pad', { 'branch': 'devel' }

" Plug 'kshenoy/vim-signature'
Plug 'mattn/ctrlp-mark'

Plug 'AndrewRadev/linediff.vim'

" Session: --------------------------------------------------------------
Plug 'xolox/vim-misc'
" Plug 'kopischke/vim-stay'
Plug 'xolox/vim-session'
" Restore folding
" Plug 'vim-scripts/restore_view.vim'
" Plug 'Twinside/vim-haskellFold'
Plug 'https://github.com/dbakker/vim-projectroot'
" Plug 'xolox/vim-shell'
" iTerm2 integration
Plug 'sjl/vitality.vim'
" Show undotree with inline diffs and search
" Plug 'simnalamburt/vim-mundo'
Plug 'andreasthoelke/vim-mundo' " removed the string 'ago ' to shorten lines in display
" Alternative undotree visualizer that does not allow inline diffs and search
" Plug 'mbbill/undotree'

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

" Markdown: -------------
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'jszakmeister/markdown2ctags'
Plug 'rhysd/nyaovim-markdown-preview'

" Tmux .config features
Plug 'tmux-plugins/vim-tmux'
" Allows listening to Tmux focus events to allow autoloading files changed outside vim
Plug 'tmux-plugins/vim-tmux-focus-events'
" Vimscript debugging
Plug 'tpope/vim-scriptease'
" This works, but not sure I need it often
Plug 'chrisbra/csv.vim'

" Code Navagation Editing: ---------------------------------------------
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'tomtom/tcomment_vim'
Plug 'kana/vim-textobj-fold'
" Plug 'kana/vim-operator-user'
" Aligning: ------------------------------------------------------------
Plug 'junegunn/vim-easy-align'
Plug 'godlygeek/tabular'


Plug 'raichoo/purescript-vim'
Plug 'FrigoEU/psc-ide-vim'
" Plug 'coot/psc-ide-vim', { 'branch': 'vim' }

" lookup ":h vim2hs", e.g. Tabularize haskell_types is useful
Plug 'goolord/vim2hs'
Plug 'eagletmt/ghcmod-vim', {'for': 'haskell'}
" Plug 'eagletmt/ghcmod-vim'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }

Plug 'Shougo/vimproc.vim', {'do': 'make'}

" Plug 'eagletmt/neco-ghc'
" Plug 'bitc/vim-hdevtools'
" still can't get it to work 9-2018
" create a new project then run: "hdevtools check 'src/Lib.hs'" - runs
" indefinetly
" crashes vim on :HdevtoolsType command

Plug 'dan-t/vim-hsimport'

" Problem: this did not indent Record syntax properly
" Plug 'neovimhaskell/haskell-vim'
Plug 'itchyny/vim-haskell-indent'
" Plug 'alx741/vim-hindent'

" compliant with brittany
Plug 'sbdchd/neoformat'

Plug 'kana/vim-textobj-user'
" TODO test this: (works in nvim but conflicts with vim?)
" Plug 'gilligan/vim-rextobj-haskell'
" requires python

" Plug 'jaspervdj/stylish-haskell'
Plug 'w0rp/ale'
" Just 10 lines of code. uses "to" default map
" Plug 'mpickering/hlint-refactor-vim'
Plug 'neomake/neomake'
Plug 'vim-syntastic/syntastic'

Plug 'parsonsmatt/intero-neovim'

Plug 'Twinside/vim-hoogle'

" Plug 'ervandew/supertab'
" did not work with omnicomplete so far
"
" Just a default split command
" Plug 'vimlab/split-term.vim'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'


call plug#end()
" ----------------------------------------------------------------------------------

" This needs to be set early in the vimrc, as the mappings below will refer to it!
let mapleader="\<Space>"
let maplocalleader="\\"


set verbose=0

" set omnifunc=syntaxcomplete#Complete


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

" /Users/andreas.thoelke/.vim/plugged/vim-textobj-haskell/python/haskell-textobj.py
let abj = '~/.vim/plugged/vim-textobj-haskell/python/haskell-textobj.py'


" Nyaovim Markdown: ------------------------
let g:markdown_preview_eager = 1
let g:markdown_preview_auto = 0

nnoremap <leader>mp :call MarkdownPreviewToggle()<cr>

func! MarkdownPreviewToggle()
  if exists( "g:markdown_preview_active" )
    StopMarkdownPreview
    unlet g:markdown_preview_active
  else
    StartMarkdownPreview
    let g:markdown_preview_active = 1
  endif
endfunc
" Nyaovim Markdown: ------------------------

" Nyaovim Popup: ------------------------
nnoremap <silent><localleader>gi <Plug>(nyaovim-popup-tooltip-open)
vmap <silent><localleader>gi <Plug>(nyaovim-popup-tooltip-open)
" Nyaovim Popup: ------------------------


" Airline Settings: --------------------------------------------------------------
let g:airline_theme='simple'
" Powerline fonts work but the > seperator doesn't seem expressive for tabs to status
let g:airline_powerline_fonts = 1

" Airline Extensions: ---
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t:r'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#keymap_ignored_filetypes = ['vimfiler', 'nerdtree']

let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number

" not sure what this does
" let g:airline#extensions#tabline#show_tab_type = 0



let g:airline#extensions#hunks#enabled = 1
" Airline Extensions: ---


" Airline Sections: -------
let g:airline_section_a = '%-0.18{getcwd()}'
" let g:airline_section_a = '%-0.18{ expand("%:~:.") }'
" let g:airline_section_b = '%<%f%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
let g:airline_section_b = '%<%f %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
" removed the modified flag 'm' here!
let g:airline_section_c = ''
let g:airline_section_x = ''
let g:airline_section_y = "%{airline#util#wrap(airline#extensions#hunks#get_hunks(),0)}%{airline#util#wrap(airline#extensions#branch#get_head(),0)}"
" Airline Sections: -------

" Minor Settings:
let g:airline#extensions#whitespace#enabled = 0
let g:airline_highlighting_cache = 0
let g:airline_detect_modified=0
let g:airline_inactive_collapse=0
let g:airline_exclude_preview = 0

" abbriviate vim-mode (e.g. "Normal" to "N"):
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'n',
      \ 'i'  : 'i',
      \ 'R'  : 'r',
      \ 'c'  : 'c',
      \ 'v'  : 'v',
      \ 'V'  : 'v',
      \ '' : 'v',
      \ 's'  : 's',
      \ 'S'  : 's',
      \ '' : 's',
      \ }

" Airline Settings: --------------------------------------------------------------


" Promptline Settings: ------------------------------------------------------------
" Creates a (zsh) command prompt based on vim-airline style: "PromptlineSnapshot ~/.promptline.sh airline" then in zsh: "source .promptline.sh"
" sections (a, b, c, x, y, z, warn) are optional
" Note: Needs to briefly plugins-install airline to work
let g:promptline_preset = {
        \'b' : [ '$vim_mode' ],
        \'c' : [ promptline#slices#cwd({ 'dir_limit': 3 }) ],
        \'y' : [ promptline#slices#vcs_branch() ],
        \'z' : [ promptline#slices#jobs() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}

" Promptline Settings: ------------------------------------------------------------


" Messages: ----------------------------------------------------------------------
" avoid |hit enter| prompts
" set shortmess+="mW"
set shortmess=aoOtT

" This is slow when exiting vim
" autocmd! VimLeavePre * call VimLeaveCleanup()
" func! VimLeaveCleanup()
"   MundoShow " Briefly open Mundo in the current tab (closes it in other tabs) to then close it. Otherwise empty mundo buffers are open after restart.
"   MundoHide
" endfunc


" Persistence Saving: -----------------------------------------------------------------


" Mundo: ----------------------
let g:mundo_width = 50
let g:mundo_preview_height = 35
let g:mundo_right = 1
let g:mundo_auto_preview_delay = 10
let g:mundo_verbose_graph = 0
let g:mundo_playback_delay = 200
let g:mundo_mirror_graph = 0
let g:mundo_inline_undo = 1
let g:mundo_help = 1

" Z Maps Unimpaired:
" There is only one instance/window of Mundo. Whenever a Mundo window is open, Autosave should be off
" nnoremap you :MundoToggle<cr>:AutoSaveToggle<cr>
" Mundo: ----------------------


" Autosave: -------------------
" Use "AutoSaveToggle" enable/disable
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
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

" Vim Sessions: -----------------------------------------------------------------------

" Not needed? now after plugin/gitv.vim
" nnoremap <leader>sd :OpenSession! default<cr>:call OpenSessionCleanup()<cr>
nnoremap <leader>sd :OpenSession! default<cr>
nnoremap <leader>sl :OpenSession!<cr>
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
let session_autosave_periodic = 0
" Prevent mkview to save and restore the cwd per file! This uses the command API of the vim-stay plugin.
" augroup stay_no_lcd
"   autocmd!
"   if exists(':tcd') == 2
"     autocmd User BufStaySavePre  if haslocaldir() | let w:lcd = getcwd() | exe 'cd '.fnameescape(getcwd(-1, -1)) | endif
"   else
"     autocmd User BufStaySavePre  if haslocaldir() | let w:lcd = getcwd() | cd - | cd - | endif
"   endif
"   autocmd User BufStaySavePost if exists('w:lcd') | execute 'lcd' fnameescape(w:lcd) | unlet w:lcd | endif
" augroup END

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


" Shared Persistence: ---------
command! ShadaClear :call ClearShada()
abbrev sc ShadaClear
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
" Shared Persistence: ---------


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
colorscheme molokai

" Github Colors: Run "leader s s" on each line in sequence
" let g:airline_theme = "github"
" let g:github_colors_soft = 1
" colorscheme github

set nocompatible
set background=dark
set laststatus=2

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


" Show a nice output of how all the vim-highlight groups are colored
command! HighlightTest exec "source $VIMRUNTIME/syntax/hitest.vim"

" Style Colors: ----------------------------
" Change colors in the colorscheme: Open vimfiles/colors/molokai
" save and run colorscheme molokai
" colorscheme molokai
" colorscheme OceanicNext
" let g:rehash256 = 1

" TODO: show some colors e.g. for TODO: in purescript comments
"       show syntax highlight in purescript comments (within `..code..`)
" Left margin aesthetics

" Set up a rather small column width on the left
set foldcolumn=0
" TODO switch to foldcolumn = 1
set numberwidth=2
set nonumber

highlight FoldColumn guibg=gray10 guifg=gray20
hi        LineNr     guibg=gray10 guifg=gray15
hi        Folded     guifg=#4B5B61 guibg=#0B0B0B

" JSON colors for ".vim/plugged/vim-json/syntax/json.vim" syntax file
hi link jsonPadding		Operator
hi link jsonString		vimString
hi link jsonTest			Label
hi link jsonEscape		Special
hi! link jsonNumber		Function
hi link jsonBraces		Delimiter
hi link jsonNull			Include
hi link jsonBoolean		Boolean
hi link jsonKeyword		Keyword
hi link jsonCommentError				Error


" Style Colors: ----------------------------


" General Settings: ------------------------
set cmdheight=3
set ignorecase
set fileencoding=utf-8
set encoding=utf-8
" set backspace=indent,eol,start
" TODO what does this do? see ':hg syntax enable'
syntax enable

set ts=2 sts=2 sw=2 expandtab

set smartcase

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
" use "set wrap" and "set nowrap" instead?
" command! -nargs=* Wrap set wrap linebreak nolist
" use `gq<motion` or gqq to merely wrap a range/line

" Auto load files that have changed outside of vim! (only when there are no unsaved changes!). This requires
" tmux focus events "FocusGained".
set autoread

" This seems needed to reload files that have changed outside of vim (https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044)
" autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
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
set completeopt=menuone,preview

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
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=L
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
" Type a command slightly more quickly:
noremap ; :
" This requires that all maps that use ":" /commands! need to be defiled with "nnoremap"/ "vnoremap"
nnoremap : :silent !

" Open command history with the cursor on the last command. Avoids conflicts with bufferlocal/plugin "q"/quick maps.
" Also avoid accidential Exmode shell, can still be accessed by "gQ"
nnoremap Q q:k
vnoremap Q q:k

" Issue: Using "q" as sort of a leader key in a custom mapping will delay plugin "q" = quit maps! e.b. in Gstats.
" workaround may be to double/ "qq" or to "q<space" instead.
" Issue: needs two c-c to exit?

" This is supposed to "unmap" the native "q" map to record macros (i don't need this often), to allow me to double "qq"
" to quit a plugin dialog instead of "q.." wait for timeout because I use "q.." as a sort of leader key (see ":map q")
" nnoremap <silent> q :<cr>
" This is sort of a black hole map. But not needed as I can currently live without 'q ..' leader key maps

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
" COMMAND HISTORY: --------------------------------------------






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
  " TODO: there as a reason to NOT convert forall, what was it??
  normal cufcuccuacubcuecudcuf
endfun


" Movement Navigation:  ---------------------------------------------------------------------
" TODO: move to a function with something like `?`. (`gf` or `<leader>F` do something else)

" Learn: Use "$" and "^" instead of the maps below
" nnoremap $ g_
" onoremap $ g_
" vnoremap $ g_
"
" nnoremap 0 g_
" onoremap 0 g_
" vnoremap 0 g_
"
" nnoremap ( ^
" onoremap ( ^
" vnoremap ( ^
" Learn: Uncomment a range of non consecutive lines, e.g. the once above:
" With cursor on the first line: "dcfap<label>" - using a motion to a sneak labeled char/line

" `)` is a free mapping!

" move in haskell function signature ---------------------------------------------
" nnoremap <silent> - :call FindArrow()<cr>w
" fun! FindArrow()
"   exec "silent normal! /→\\|⇒\\|∷\<cr>"
" endfun

" nnoremap <silent> _ :call FindArrowB()<cr>w
" fun! FindArrowB()
"   exec "silent normal! ?→\\|⇒\\|∷\<cr>"
" endfun

" TODO do I need these?
" nnoremap <silent> - ?[\(\$\∷\.\⇒\>\→\[\{]<cr>
" nnoremap <silent> ) /[\(\$\∷\.\⇒\<\→\[\{\#]<cr>
" nnoremap <silent> - ?[\(\∷\.\⇒\→\[\{]<cr>
" nnoremap <silent> ) /[\(\∷\.\⇒\→\[\{\#]<cr>

" move to next paragraph/fn ------------------------------------------------------
nnoremap <silent> <c-l> :call ParagNext()<cr>
vnoremap <silent> <c-l> }
" nnoremap <silent> ) :call ParagNext()<cr>
fun! ParagNext()
  exec "silent normal! }"
  call JumpNextNonEmptyLine()
endfun

fun! JumpNextNonEmptyLine()
  call search('^.\+')
endfun


" move to previous paragraph/fn
nnoremap <silent> <c-h> :call ParagPrev()<cr>
vnoremap <silent> <c-h> {k$
" nnoremap <silent> ( :call ParagPrev()<cr>
fun! ParagPrev()
  let startLineNum = line('.')
  exec "silent normal! {w"
  if line('.') == startLineNum
    exec "silent normal! {{w"
  endif
endfun


" Movement Naviagation:  ---------------------------------------------------------------------

" Indenting: -------------------------------------
" TODO Learn: test / understand these
" set autoindent
" set smartindent

" How ">>" will indent lines
" set shiftwidth=2
" set shiftround

nnoremap <leader>>> :call IndentToCursorH()<CR>
nnoremap <leader><< :call IndentToCursorH()<CR>
" TODO: maybe make a mapping "dwkwj<leader>>>" to indent haskell binds:
  " jsonValue ∷ Value
  "           ← decode (T.encodeUtf8 jsonTxt) ?? "Not a valid json!"
"
function! IndentToCursorH()
  exec ("left " . (virtcol('.') - 1))
  " exec ("left " . col('.'))
endfun

" Indenting: -------------------------------------




" HOOGLE INCLUDE NEW LIBS:
" "hoogle generate base lense" will download and install only the base and
" lense libs.
" open ":e hoogle-defaults" from the root of the project folder, add/delete
" libs, then <backspace> in first line to have everything in one row, and
" copy-paste into terminal
" https://github.com/ndmitchell/hoogle/blob/master/docs/Install.md
" Todo: get hoogle libs from cabal file

let g:hoogle_search_buf_size = 15
let g:hoogle_search_count = 30



" ALIGNING COLUMS OF HASKELL SIGS:
" run: :browse Data.List.Split in GHCi and copy into a vim buffer
"
" align right to ∷ with padding 1:
" '<,'>Tabularize /::/r1c1l1
" move lines that contain "Splitter" to the bottom of the file!
" g/Splitter/m$
" move lines with two occurences of "Splitter" to the bottom
" g/Splitter.*Splitter/m$
" move lines with "Eq" to line 22!
" '<,'>g/Eq/m22

" format hoogle output from
" Prelude print ∷ Show a ⇒ a → IO ()
" to
" -- Prelude
" print ∷ Show a ⇒ a → IO ()
let @o = 'f Jki-- jk^jj'
" align the type-signature with EasyAlign
let @p = 'gcaap '
" changed this from gaap to gcaap to have 'ga' as fee mapping

" used in hoogle.vim: (!) (TODO: refactor this)
" if a:args != ' --info'
"   normal gg
"   normal 10@o
"   normal gg
"   normal @p
" endif

" Import Haskell Identifiers Using Hoogle And Hsimport:
" 1. Use "gsd" ("go search docs") on a missing identifier
" 2. In the hoogle list of available identifiers, go to the line/version you
" want to import and run <leader>ii to import the identifier (confirm the import
" section of your source file has added the identifier)
" See HoogleImportIdentifier in vimrc and
" /Users/andreas.thoelke/.vim/plugged/vim-hoogle/plugin/hoogle.vim
" also note the "HOOGLE INCLUDE NEW LIBS:" comment in vimrc
fun! HoogleImportIdentifier() "{{{
  let l:prev_line = getline(line('.') -1)
  let l:cur_line  = getline('.')
  let l:split_line_prev = split(l:prev_line)
  let l:split_line      = split(l:cur_line)
  call HoogleCloseSearch()
  normal! <c-w>k
  if &mod
    echo "Please save before importing!"
    return
  endif
  let l:imp1 = l:split_line[0]
  let l:imp2 = l:split_line[1]
  if l:imp2 == "data" || l:imp2 == "type" || l:imp2 == "class"
    let l:imp2 = l:split_line[2]
  endif
  if l:imp2[0] == "("
    let l:imp2 = StripString( l:imp2, "(" )
    let l:imp2 = StripString( l:imp2, ")" )
  endif
  call Hsimp( l:imp1, l:imp2)
  "update format of the import list
  call StylishHaskell()
endfunction "}}}

" call Hsimp("Control.Monad", "replicateM")
fun! Hsimp(module, symbol)
  call hsimport#imp_symbol(a:module, a:symbol)
endfun

command! Run    :call HaskellStackRun()
command! Style  :call StylishHaskell()
command! Indent :call StylishHaskell()

noremap <leader>ci :call StylishHaskell()<cr>

setlocal formatprg=stylish-haskell
" use <motion>gq
" .. but not working properly, e.g. messing up line breaks
" free mapping: <c-g> - currently show the current filename


" EDIT VIM SCRIPT: ---------------------------------------------------------------------

" Sourcing Parts Of Vimscript:
" the current file
nnoremap <silent><leader>su :w<CR>:so %<CR>
" the following paragraph/lines
nnoremap <leader>s} y}:@"<cr>
" TODO have "<leader>sf" to source a function. Note a function might have empty lines, otherwise one could use "..s}"
" the current line
" nnoremap <leader>ss yy:@"<cr>
nnoremap <leader>ss "tyy:@t<cr>
" free mappings? <leader>s..
" TODO these map don't seem ideal. mnemonic not destinct enough?
command! SourceLine :normal yy:@"<cr>:echo 'Line sourced!'<cr>

" Call Func: call the function name in cursor line, without args
nnoremap <leader>cf (Wyw:call <c-r>"()<cr>^
" Todo: Call function with testarg. Example line below of function:
" testarg: 'tell application "Finder" to make new Finder window'
" find next testarg line, "Wy[to some other register])"
" nnoremap <leader>caf (Wyw:call <c-r>"(<c-r>[other reg])<cr>^

function! SourceRange() range
  let tmpsofile = tempname()
  call writefile(getline(a:firstline, a:lastline), l:tmpsofile)
  execute "source " . l:tmpsofile
  call delete(l:tmpsofile)
endfunction
" TIP: Range example function

" Source a range
command! -range Source <line1>,<line2>call SourceRange()
" Run a VimScript function and insert the returned result below the paragraph
nnoremap <leader>sh wwy$}i<c-r>=<c-r>"<cr><esc>{w
" Run a VimScript snippet (til end of the line) and insert the returned result!
nnoremap <leader>sy y$o<c-r>=<c-r>"<cr><esc>
" Run a VimScript snippet (til end of the line) and echo the result in the command line
nnoremap <leader>sx y$:echom <c-r>"<cr>

" EDIT VIM SCRIPT: ---------------------------------------------------------------------

" EDIT VIM SCRIPT: ---------------------------------------------------------------------

" General: -----------------------------------------------------------------------------

nnoremap <leader>cab :e *.cabal<cr>


" nnoremap <leader>zsh :e ~/.zshrc<cr>
command! Zshrc   :e ~/.zshrc
command! ZshOhMy :e ~/.oh-my-zsh/oh-my-zsh.sh
command! Vimrc   :e ~/.vimrc
command! Cabal   :e *.cabal
cabbrev cab Cabal

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



function! GotoDefinition()
    if IsPurs()
      normal m'
    " add position to jumplist
      exec 'Pgoto'
    else
      exec 'InteroGoToDef'
    endif
endfun

" function! TypeInsert( keyword)
function! TypeInsert()
    if IsPurs()
      let l:kw = PSCIDEgetKeyword()
      " call PursType( a:keyword )
      call PursType( l:kw )
    else
      " exec 'InteroInstTypeInsert'
      " :InteroInstTypeInsert
      :InteroGenTypeInsert
    endif
endfun

function! ReplEvalExpr_Insert( exprStr )
  if IsPurs()
    call PursEval( a:exprStr )
  else
    call InsertEvalExpressionRes( a:exprStr )
  endif
endfun

" Get a (repl-) evaluable expression-string from a (line-) string
function! ExtractEvalExpFromLineStr( lineStr )
    let l:lineList = split( a:lineStr )

    if l:lineList[0] == '--'
      " it's a commented line
      " → use the second word onwards
      return join( l:lineList[1:], ' ')

    elseif l:lineList[1] == '='
      " it's a declaration
      " → use the third word onwards
      return join( l:lineList[2:], ' ')
    else
      echoe 'Could not extract an expression!'
    endif
endfun


" TODO: Intero has these custom functions:
" InsertInstType
" InsertGenType
" InsertEvalRes
" InsertEvalExpressionRes
" TODO: make proper API


" Todo: use join( list, ' ' )
function! ListToHsFnCall(stlist)
  let l:fncall = ""

  for nextItem in a:stlist
    let l:fncall = l:fncall . " " . nextItem
  endfor
  return l:fncall
  " echo fncall
endfun

function! GetModuleName()
  for lineNum in [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    " skip empty lines as those seem to confuse the if == 'module'
    if split( getline( lineNum ) ) == []
      continue
    endif
    let firstWord  = get( split( getline( lineNum ) ), 0 )
    let moduleName = get( split( getline( lineNum ) ), 1 )
    if firstWord == "module"
      break
    endif
  endfor
  return moduleName
endfun


function! ReplReload()
    let modulename = GetModuleName()
    " exec ':up'
    if IsPurs()
      " TODO: is this needed? what does it do?
      call purescript#ide#utils#update()
      exec ':Prebuild'
      call PursEval(':r')
      call PursEval('import ' . modulename)
      " call PursEval('import Helpers')
      " exec 'SlimeSend1 :r'
      " exec 'SlimeSend1 import ' . modulename
      " exec 'SlimeSend1 import Helpers'
    else
      if has('nvim')
        exec ':InteroReload'
      else
        exec 'SlimeSend1 :r'
        exec 'SlimeSend1 :l ' . modulename
      endif
    endif
endfun

function! InsertTypeAnnotation()
    " exec ':up'
    if IsPurs()
      " exec ':PSCIDEaddTypeAnnotation'
      call PSCIDEaddTypeAnnotation(matchstr(getline(line(".")), '^\s*\zs\k\+\ze'))
    else
      if has('nvim')
        exec ':InteroTypeInsert'
      else
        exec ':GhcModTypeInsert'
      endif
    endif
    " call PurescriptUnicode()
endfun

function! ImportIdentifier()
    if IsPurs()
      exec ':PSCIDEimportIdentifier'
    else
      " TODO
    endif
endfun

function! PsciReload()
    let modulename = GetModuleName()
    exec ':w'
    exec 'SlimeSend1 :r'
    exec 'SlimeSend1 import ' . modulename
    " import is for purescript / psci
    " exec 'SlimeSend1 :l ' . modulename
    " :l is for haskell / ghci
endfun


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

" UNIMPAIRED: -------------------------------------------------


" SYNTASIC: ---------------------------------------------------
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" airline /statusline config

" Deactivate Syntasic for haskell dev in favour of Ale
let g:syntastic_haskell_checkers = []

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
" turn off initially
let g:syntastic_check_on_wq = 0

let g:psc_ide_syntastic_mode = 1

hi SyntasticErrorSign   ctermfg=white
hi SpellBad term=reverse ctermbg=darkgreen

let g:syntastic_error_symbol = "•"
let g:syntastic_style_error_symbol = "⚠"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_warning_symbol = "⚠"

" Todo Temp:
" nmap <leader>ss :SyntasticToggle<cr>
nnoremap <leader>sc :SyntasticCheck<cr>
nnoremap <leader>sr :SyntasticReset<cr>

" SYNTASIC: ---------------------------------------------------


" Neomake: ----------------------------------------------------
" Neomake does the same as Ale
" While Hlint (and stack-ghc-mod?) uses Ale for signs in the signcolumn,
" Intero uses Neomake to show error and ghc warnings
hi NeomakeErrorSign   ctermfg=white
hi NeomakeWarningSign ctermfg=white
hi NeomakeIntoSign    ctermfg=white
hi NeomakeMessageSign ctermfg=white

" let g:neomake_open_list=2
" let g:neomake_list_height=10


command! SignsClear :sign unplace *
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

" nmap <silent> ]c :call NextHunkAllBuffers()<CR>
" nmap <silent> [c :call PrevHunkAllBuffers()<CR>
nnoremap <expr> ]c &diff ? ']c' : ':call NextHunkAllBuffers()<CR>'
nnoremap <expr> [c &diff ? '[c' : ':call PrevHunkAllBuffers()<CR>'

nnoremap <expr> <C-J> &diff ? ']c' : '<C-W>j'

"
" GitGutter: -------------------------------------------------------

" Intero: -----------------------------------------------------------
" Intero starts automatically. Set this if you'd like to prevent that.
let g:intero_start_immediately = 0
" let g:intero_use_neomake = 0
" This show ghi warnings as opposed to hlint warnings:
" TODO: toggle warnings without restart vim!
let g:intero_ghci_options = '-Wall -Wno-unused-matches -Wno-missing-signatures -Wno-type-defaults -Wno-unused-top-binds'
" let g:intero_ghci_options = '-Wall -Wno-missing-signatures -Wno-type-defaults -Wno-unused-top-binds'
" https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/flags.html#warnings

" TODO: when do I need this?
let g:haskellmode_completion_ghc = 1
" autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
" causes tag error?

" autocmd BufWritePost *.hs GhcModCheckAndLintAsync

" autocmd BufWritePost *.hs call s:check_and_lint()
" function! s:check_and_lint()
"   let l:qflist = ghcmod#make('check')
"   call extend(l:qflist, ghcmod#make('lint'))
"   call setqflist(l:qflist)
"   cwindow
"   if empty(l:qflist)
"     echo "No errors found"
"   endif
" endfunction

" Maps for intero.
" nnoremap <silent> <leader>is :InteroStart<CR>
" nnoremap <silent> <leader>isc :SignsClear<CR>
" Todo: unify this with purs?
nnoremap <silent> <leader>ik :InteroKill<CR>
nnoremap <silent> <leader>io :InteroOpen<CR>
nnoremap <silent> <leader>ih :InteroHide<CR>
nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
" nnoremap <silent>         gd :call GotoDefinition()<CR>
" nnoremap <silent> <leader>gd :sp<CR>:call GotoDefinition()<CR>
" fee mapping
" nnoremap <silent>         ]d :call GotoDefinition()<CR>
" Intero: -----------------------------------------------------------

" New Haskell And Purescript Maps: ------------------------------------------------------

" Type Inserts: ----------------------------------------------------
" nnoremap tt :call TypeInsert( PSCIDEgetKeyword() )<cr>
nnoremap tt :call TypeInsert( )<cr>
" vnoremap tt :call TypeInsert( Get_visual_selection() )<cr>
" TODO: problem: PSCIDEgetKeyword only work when PSCIDE is started/ throws error with Haskell
nnoremap tg :InteroGenTypeInsert<cr>
vnoremap tg :InteroGenTypeInsert<cr>
nnoremap ti :InteroInfoInsert<cr>
vnoremap ti :InteroInfoInsert<cr>

nnoremap <silent> tw :call InsertTypeAnnotation()<cr>
" Type Inserts: ----------------------------------------------------


" Repl Eval Insert: ------------------------------------------------
" Evaluate a string in the Repl (purs or ghci) and insert the result of the evaluation
" gee → expr after -- (comment)
"       expr after =
"       selection
" gel → entire line
" gew → keyword
" (cursor-column is only significant for gew)

" Extract a (repl-) evaluable expression-string from current line
" nnoremap gei :call ReplEvalExpr_Insert( ExtractEvalExpFromLineStr( getline('.') ) )<cr>
" vnoremap gei :call ReplEvalExpr_Insert( Get_visual_selection() )<cr>

" Evaluate the entire line
" nnoremap gel :call ReplEvalExpr_Insert( getline('.') )<cr>

" Eval the current keyword
" nnoremap gew :call ReplEvalExpr_Insert( PSCIDEgetKeyword() )<cr>
" nnoremap gew :call ReplEvalExpr_Insert( expand("<cword>") )<cr>
" Repl Eval Insert: ------------------------------------------------


nnoremap dip :Pimport<cr>
nnoremap dap :Papply<cr>:call PurescriptUnicode()<cr>
" TODO: currently :Papply indents the current line by one char.  same for haskell?


" just for testing - not sure when this might be useful
nnoremap <leader>dhi :echo intero#util#get_haskell_identifier()<cr>
" alternative to PSCIDEgetKeyword()

" New Haskell And Purescript Maps: ------------------------------------------------------

nnoremap dr :call ReplReload()<cr>

" nnoremap tr :call TraceTopLevelValue()<cr>
nnoremap ta :call TraceTopLevelValue()<cr>
" nnoremap tf :call TraceComLine()<cr>


" GHCI:
" use :m -<module name> to unload modules
" use :m to go to only Prelude
" edit ghci.conf to set
" DEFAULT IMPORTS:
" e ~/.ghc/ghci.conf
" ERROR:
" currently with the file it never stops loading..?
" also in .cabal file there is "Exposed modules", which can be multible
" modules that are loaded into ghci on startup.

" let g:ghcmod_open_quickfix_function = 'GhcModQuickFix'
function! GhcModQuickFix()
  " for unite.vim and unite-quickfix
  " :Unite -no-empty quickfix
  " for ctrlp
  :CtrlPQuickfix
  " for FuzzyFinder
  ":FufQuickfix
endfunction


" let g:necoghc_enable_detailed_browse = 0
let g:haskell_tabular = 1

" vmap a= :Tabularize /=<CR>
" vmap a; :Tabularize /::<CR>
" vmap a- :Tabularize /-><CR>

" vmap <leader>ta :Tabularize /∷\|→\|⇒/<cr>
vmap <leader>ta :Tabu /∷\\|→\\|⇒/<cr>
" note: to insert "\" into command line it needs to be escaped like "\\"


" EXTRACT SIGNATURES: ------------------------------------------------------------
" This makes a nice overview of the function signatures of a hakell file
" 1.copy/extract function signatures to the end of the file (run either of these)
nnoremap <leader>exs :g/∷.*→/t$<cr>
vnoremap <leader>exs :g/∷.*→/t$<cr>
nnoremap <leader>exg :g/∷.*⇒/t$<cr>
" 2. visual select the signatures
" 3. move only the generic sign out of the block
vnoremap <leader>exg :g/∷.*⇒/m$<cr>
" 4. visual select blocks and <leader>ta to tabularize the sigs
command! ExtractSigs :g/∷.*→/t$
command! ExtractGenSigs :g/∷.*⇒/t$
" --------------------------------------------------------------------------------

" HASKELL
" --------------------------------------------------------------------------------

" --------------------------------------------------------------------------------
" HASKELL
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`

let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2

" --------------------------------------------------------------------------------

" --------------------------------------------------------------------------------

" free mapping <c-Backspace>

" TODO: find (and break line?) at → and ∷

" ------------------------------------------------------
" Code formatting ------------------------

" Issue: Remap return key. in command history this executes a line!
" Hit enter to add a new line above or below the current line
" nnoremap <c-Enter> i<cr><Esc>
" nnoremap <CR> o<Esc>
nnoremap O o<Esc>


" Break line at cursor position
nnoremap J i<CR><Esc>
" TODO "push text" mapping
" this is now used for Sneak navigation
" nnoremap L i <Esc>

" Join line below with current line
nnoremap <BS> J

nnoremap <leader>L kJi<cr><esc>l


" Insert one space
" nnoremap <leader>L a <esc>
" nnoremap <C-L> i <esc>l

" ---------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vnoremap <Enter> <Plug>(EasyAlign)

" EasyAlign:
" 1. visually selecte the lines
" 2. type ':EasyAlign'
" 3. type '2 ' to align to the second space!!


" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" TODO: find alt mapping
nnoremap <leader>ga <Plug>(EasyAlign)

let g:easy_align_ignore_groups = ['Comment', 'String']

" Align Example:
" you can go from this: ..
" data Drawing
"   = Fill Shape FillStyle
"   | Outline Shape OutlineStyle
"   | Text Font Number Number FillStyle String
"   | Rotate Number Drawing
"   | Clipped Shape Drawing
"   | WithShadow Shadow Drawing

" .. to this:
" data Drawing
"   = Fill       Shape  FillStyle
"   | Outline    Shape  OutlineStyle
"   | Text       Font   Number Number FillStyle String
"   | Rotate     Number Drawing
"   | Clipped    Shape  Drawing
"   | WithShadow Shadow Drawing
" 1. uncomment this block first, then with the cursor on the second line:
" 2. "<leader>ga}2 " aligns the rest of the block to the 2nd <space>, and then
" 3. "<leader>ga}3 " to align to the 3rd <space> as well

" Align Example:
" (using Tabularize or EasyAlign with regex)
" you can go from this: ..
" everywhere f = go
"   where
"   go (Many ds) = f (Many (map go ds))
"   go (Scale s d) = f (Scale s (go d))
"   go (Translate t d) = f (Translate t (go d))
"   go (Rotate r d) = f (Rotate r (go d))
"   go (Clipped s d) = f (Clipped s (go d))
"   go (WithShadow s d) = f (WithShadow s (go d))
"   go other = f other

" .. to this:
" everywhere f = go
"   where
"   go (Many ds)        = f (Many (map      go ds))
"   go (Scale s d)      = f (Scale s (      go d))
"   go (Translate t d)  = f (Translate t (  go d))
"   go (Rotate r d)     = f (Rotate r (     go d))
"   go (Clipped s d)    = f (Clipped s (    go d))
"   go (WithShadow s d) = f (WithShadow s ( go d))
"   go other            = f other
" 1. select all lines starting with "go"
" 2. ":Tabularize /=/" to align to `=`
" 3. ":Tabularize /go/" to align to `go`
" Also EasyAlign can align to words or other chars using regex like this:
" "<,'>EasyAlign */go/"
" "<,'>EasyAlign */(g/"
" "<,'>EasyAlign */(go/"
" "<,'>EasyAlign */(/"


" Insert line comment
nnoremap <leader>mll i----------------------------------------------------------------------------------<esc>^
" Fill line with dashes
nnoremap <leader>mlk $a<space><esc>82a-<esc>d82<bar>^
" TODO: this somehow stops working!?


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
" Some arg: hi!
" stopping here!
             

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
" change terminal cursor colors: highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
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
" TIP: remove trailing whitespace: ":%s/\s\+$//e"
" Show trailing whitespace only after some text (ignores blank lines): /\S\zs\s\+$
" autocmd BufEnter,WinEnter * call matchadd('Error', '\v\s+$', -1)

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
" HASKELL PURESCRIPT TEST FUNCTIONS: ----------------------------------------------------------------
" "unique functions"
nnoremap <leader>uf :call RandFnName()<cr>2w
" produces a (test) haskell function with a random name, e.g.:
" cp0 = undefined
" "unique symbol"
nnoremap <leader>us :call RandSymbol()<cr>

" "expand function": expand a symbol name to a function stub
nnoremap <leader>ef A :: String<esc>^ywo<esc>PA= undefined<esc>b
" nmap <leader>fe A :: String<esc>^ywjPA= undefined<esc>b

" "expand signature": expand a signature to a function stub
nnoremap <leader>es ^ywo<esc>PA= undefined<esc>b

" "expand undefined": expand a signature to a function stub
nnoremap <leader>eu yiwo<esc>PA = undefined<esc>b
" nmap <leader>fe A :: String<esc>^ywjPA= undefined<esc>b


nnoremap <leader>uef <leader>us<leader>ef

" "index symbol" append postfix index to function name
nnoremap <leader>if ea0^jea0^k

nnoremap <leader><c-a> jk^
nnoremap <leader><c-x> <c-x>j<c-x>k^


function! RandFnName()
python << EOF
import string
import random
import vim

vim.current.line += ''.join(random.choice(string.ascii_lowercase) for _ in range(2)) + '0 = undefined'
EOF
endfunction

function! RandSymbol()
python << EOF
import string
import random
import vim

vim.current.line += ''.join(random.choice(string.ascii_lowercase) for _ in range(2)) + '0'
EOF
endfunction


" Reduce a paragraph (purs repl type output) to one line, deleting 2+ space seperations between words
nnoremap <leader>ccu "td}:call TransfTRegAndAppend( function('StripNewlinesAndMultispaces') )<cr>k

" Get the type of do-binds by producing a type error:
nnoremap <leader>cco "tyiwolet (xb0 :: Int) = <esc>"tp^


" Apply 'fn' to the 't'/temp and append the result after the current line
function! TransfTRegAndAppend ( fn )
  call append( line('.') - 1, a:fn( @t ))
endfun
" Testfn: Use of TransfTRegAndAppend with higher order function
nnoremap <leader>cci "tdd:call TransfTRegAndAppend( function('toupper') )<cr>

function! StripNewlinesAndMultispaces( str ) " 1. delete all newlines:
  let l:str1 = substitute(  a:str,  '\n',  '', 'ge' )
 " 2. replace sections/words that have more than one space (regex: ' \+') with one space
 let l:str2 = substitute( l:str1, ' \+', ' ', 'ge' )
 return l:str2
 " the same in one 's' command:
  " exec 's/\n//ge | s/ \+/ /ge'
endfun

function! StripString( original, stripThisString )
 return substitute(  a:original, a:stripThisString, '', 'ge' )
endfun



" " TODO: format haskell/purescript functions signature!!
" fun! FormatSign()
"   exec "normal! /∷\<cr>"
"   let indentPos = col('.')
"   let lineNum = line('.')
"   exec "normal! /→\<cr>"
"   normal cuq
"
"   " exec "insert <cr>"
"   " echo indentPos
"   let ab = append(lineNum, "hii")
" endfun
"
" HASKELL PURESCRIPT TEST FUNCTIONS: ----------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------



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

" Partially expand syntax and expression based folding (of markdown and gitv plugins)
autocmd Syntax git set foldlevel=1
autocmd FileType markdown set foldlevel=1

nnoremap z<space> za
nnoremap z] zo
nnoremap z[ zc

" Use this on top of "zj" and "zk"?
nnoremap ]z :cal GoToOpenFold("next")
nnoremap [z :cal GoToOpenFold("prev")

" set ]z and [z go to find open folds
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
endfunction

set foldtext=MyFoldText()
function! MyFoldText()
  let line = getline(v:foldstart)
  " let sub  = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  return line
endfunction

" Folding: ------------------------------------------------


" Comments: --------------------------
" line or selection
" nmap dc gc
" nmap dco gcc

  " comment form??
  " nmap coaf gcaf

" Comments: --------------------------



" Markers Marks: ----------------------------------------------------------------
" Note: had to copy this to ".vim/after/plugin/zmaps.vim" because unimpaired overwrites these maps

" nnoremap <leader>mm :SignatureListGlobalMarks<cr>
" Navigate loclist using "]l" and "[l" alternaivly "[a / ]a or [' / ']""
nnoremap <leader>om :CtrlPMark<cr>
" ctrlp-mark plugin useful? yes, it shows an overview

  " To Learn: m` marks and `` jumps back to this! "m'" - "''" does the same but for the line only.
  " ma, mb, mc .. to set!
  " 'a, 'b, 'c .. to jump!

" Note Issue: Deleted markers are currcntly recreated after (auto!) session save/load a temp fix is to "ShadaClear".
" To delete all markers (as a last resort, just delete the ~.viminfo file!!
" command! DelMarks :delmarks ABCDEFGHIJKLMN

" Markers Marks: ----------------------------------------------------------------


" Sneak Code Navigation: ------------------------------------------------
" 1-character enhanced 'f'
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
" 1-character enhanced 't'
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T
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


" Easymotion Code Navigation: ------------------------------------------------
" Endhanced word and line motions
map <localleader>w <Plug>(easymotion-w)
map <localleader>b <Plug>(easymotion-b)
map <localleader>j <Plug>(easymotion-j)
map <localleader>k <Plug>(easymotion-k)
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
" map L <Plug>(easymotion-next)
" map H <Plug>(easymotion-prev)

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
" Easymotion Code Navigation: ------------------------------------------------


" ------------------------------------------------------

" Movement mappings
"
" Insight parantheses
" onoremap p i(
" onoremap b /return<cr>
" onoremap in( :<c-u>normal! f(vi(<cr>

" ------------------------------------------------------
" omni complete
" inoremap <C-B> <C-X><C-O>
" Open omni menu and don't select the first entry
" inoremap <C-space><C-space> <C-x><C-o><C-p>
" navigate the list by using j and k
" Free mapping in insert mode
" inoremap <C-j> <C-n>
" inoremap <C-k> <C-p>

" open suggestions
" imap <Tab> <C-P>

" TODO Does this enable netrw?
filetype plugin on
" set omnifunc=syntaxcomplete#Complete
" TODO: above line testen
" insert mode <S-space> schliesst omni preview und fuegt space ein
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode


" Todo: needed for omnicomplete? - this throws error when hitting return in command history!
" augroup cursleave
"   autocmd!
"   autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"   autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" augroup END


" ------------------------------------------------------


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

nnoremap / :set hlsearch<cr>:noh<cr>/\v
vnoremap / /\v
" nnoremap <M-/> /

" Search visually selected text
vnoremap // y/<C-R>"<CR>


                 
" HOW TO SEARCH:


" Silver searcher
" --------------------------------------------------------------------------------
let g:ag_highlight=1


" --------------------------------------------------------------------------------

" Search next:
nnoremap <silent> ga :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap <silent> g- :set nohlsearch<cr>

nnoremap <silent> n n
nnoremap <silent> N N

" Important color/highlighy setting - sometimes gets overwritten
hi Search guibg=#3E3E3E guifg=#DDDDDD
hi Visual guibg=#3E3E3E gui=none


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

" let g:rootmarkers = ['.projectroot', 'package.json', 'bower.json', 'stack.yaml', '*.cabal', 'README.md', '.git']
let g:rootmarkers = ['.projectroot', 'bower.json', 'package.json', 'stack.yaml', '*.cabal', 'README.md', '.git']

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

" TODO limit to nvim?
" Whenever a new tab is created, set the tab-working dir accordingly
if has('nvim')
  autocmd TabNewEntered * call OnTabEnter(expand("<amatch>"))
  func! OnTabEnter(path)
    if isdirectory(a:path)
      let dirname = a:path
    else
      " let dirname = fnamemodify(a:path, ":h")
      let dirname = projectroot#guess( a:path )
    endif
    execute "tcd ". dirname
  endfunc
endif

" Change Working Directory: ---------------
nnoremap <expr>dpr ":tcd " . projectroot#guess() . "\n"
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


" use purescript syntax on haskell buffers.
" Todo: what's the proper way to do this?
autocmd BufEnter *.hs set syntax=purescript
" this would show vim help with wrong syntax?
" autocmd BufReadPost *.txt set syntax=markdown
" autocmd some entry FileType help set syntax=help

" Quickfix List: -------------------------------------------------

" Refesh/force some style on the quickfix list:
autocmd QuickFixCmdPost * :call QuickfixRefeshStyle()

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
" autocmd QuickFixCmdPost * :call WinDo( "set syntax=purescript" )
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
let g:ctrlp_map = '<localleader>a'

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
let g:ctrlp_extensions = ['tag', 'line', 'changes']


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

" close the win below
nnoremap <c-w>d <c-w>j<c-w>c
" close the win right
nnoremap <c-w>D <c-w>l<c-w>c

" make equal size slightly easier to type
" nnoremap <c-w><c-\> <c-w>=

" Split: current buffer left
nnoremap <c-w>S :vs<cr>
" new buffer left
nnoremap <c-w>N :vnew<cr>
" Note: the standard map "<c-w>s" & "<c-w>n" will split below

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

" Workaround to force vim-help to open below
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd J | endif
augroup END

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
nnoremap <localleader>tc :call CloseTabGoToPrevious()<cr>
nnoremap <localleader>x :call CloseTabGoToPrevious()<cr>
function! CloseTabGoToPrevious()
  if tabpagenr("$") > 1 && tabpagenr() > 1 && tabpagenr() < tabpagenr("$")
    tabclose | tabprev
  else
    tabclose
  endif
endfunction


" This has to be disables, otherwisee <leaader>1 .. maps get overwritten.
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

autocmd TabLeave * let g:lasttab = tabpagenr()


" Tabs: -----------------------------------------


" Buffers: -----------------------------------------
" next - prev buffer: use unimpaired "[b" - "]b"
" Old: next - prev buffer
" nnoremap <silent> ƒ :bn<cr>
" nnoremap <silent> ð :bp<cr>
" Next/Prev navigation works via <c-shift-f> <c-shift-d> (Karabiner) <Option/Alt>f / <A-f> / <A-d>
" Tip Option Alt Key Mappings: get these chars by typing <option+key> in insert mode
                                                          
" TODO this map isn't really used/appropriate?
" Prevent closing a window when closing a buffer
" nnoremap \X :bp<bar>sp<bar>bn<bar>bd!<CR>
" some as: ?
" nnoremap \X :bp | :sp | :bn | :bd!<CR>
nnoremap <leader>bd :bd<cr>
nnoremap <leader>bD :bd!<cr>

" Buffers: -----------------------------------------



" General Leader Cmd Shortcut Maps: ---------------------------------

nnoremap <localleader>qa :qa<cr>
nnoremap <localleader>qq :q<cr>

" nnoremap gw :w<cr>
" nnoremap <localleader>w :w<cr>

nnoremap <localleader>t. :t.<cr>


" General Leader Cmd Shortcut Maps: ---------------------------------



" General: ----------------------------------------------------------

" Exit insert mode
" inoremap <c-[> <esc>l

" General: ----------------------------------------------------------


" Scrolling: ------------------------

" Cursor offset from window top and buttom
set scrolloff=8

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

nnoremap zh 7zh
nnoremap zl 7zl
" Scrolling: ------------------------

" make '=' easier to type in haskell
" inoremap <c-\> =
" TODO test this ..
" cnoremap <c-\> =
" onoremap <c-\> =
" lnoremap <c-\> =
" nnoremap <c-\> =

" make '=' easier to type in haskell
" inoremap <c-\> =
" TODO test this ..
" cnoremap <c-\> =
" onoremap <c-\> =
" lnoremap <c-\> =
" nnoremap <c-\> =

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

fun! OpenITerm()
    let path = projectroot#guess()
    exec 'silent !open -a iTerm ' . path
endfun
" this works: :silent !open -a iTerm Documents/purescript

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


" Fugitive Gitv: -----------------------------------------------------------

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

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
autocmd! BufReadPost fugitive://* set bufhidden=delete

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

command! Markdown :call OpenMarkdownPreview()
nnoremap glm :call OpenMarkdownPreview()<cr>

" This seems to work now (silently)
command! OpenInExcel exec "silent !open % -a 'Microsoft Excel'"
" ----------------------------------------------------------------------------------

" open a terminal window
nnoremap <silent> glt :below 20Term<cr>

" Terminal util functions
" and lots of documentations (TODO refactor this)
source /Users/andreas.thoelke/.vim/utils/termin1.vim



" Tagbar: --------------------------------------------------------------------------
" nmap gkl :TagbarOpen j<cr>
nnoremap <leader>to :TagbarOpen j<cr>
nnoremap to :TagbarOpen j<cr>
nnoremap <leader>th :TagbarClose<cr>

" nmap <silent> <c-h> gklk<cr>
" nmap <silent> <c-l> gklj<cr>
" Tagbar: --------------------------------------------------------------------------


" ---- GOYO - LIMELIGHT -----------------------------------------------------------------------
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
autocmd! BufWinEnter quickfix call QuickfixMaps()
func! QuickfixMaps()
  nnoremap <buffer> go :.cc<cr>:wincmd p<cr>      
  nnoremap <buffer> <c-n> :cnext<cr>:wincmd p<cr> 
  nnoremap <buffer> <c-p> :cprev<cr>:wincmd p<cr> 
endfunc

" nmap <leader>ll :lopen<cr>:Wrap<cr>
nnoremap <leader>ll :lopen<cr>
" nmap <leader>qq :copen<cr>
" Todo: this get's overwrittern on quickfix refesh:
" nnoremap <leader>qq :copen<cr>:set syntax=purescript<cr>
nnoremap <leader>qq :copen<cr>

nnoremap <silent> gsg :call GoogleSearch("word")<cr>
vmap <silent> gsg :call GoogleSearch("visSel")<cr>

nnoremap <silent> gsh :call DocsForCursorWord()<cr>
vmap <silent> gsh :call DocsForVisSel()<cr>
nnoremap <silent> gsd :call HoogleForCursorWord()<cr>
vmap <silent> gsd :call HoogleForVisSel()<cr>

nnoremap <silent> gsi :call GithubSearch("word")<cr>
vmap <silent> gsi :call GithubSearch("visSel")<cr>

nnoremap <silent> gsf :call GrepSearch("word", "file")<cr>
vmap <silent> gsf :call GrepSearch("visSel", "file")<cr>
nnoremap <silent> gsb :call GrepSearch("word", "buffers")<cr>
vmap <silent> gsb :call GrepSearch("visSel", "buffers")<cr>

  
" Seach Vim Help and fill the quickfix list with the results
command! -nargs=1 HelpGrep  exec ':helpgrep' <q-args> | exec ':cwindow'
cnoreabbrev hg HelpGrep

fun! OpenFinder()
  exec 'silent !open .'
endfun

fun! OpenCurrentFileInSystemEditor()
  exec 'silent !open %'
endfun


" Search: -----------------------------------

cnoreabbrev vg vimgrep

" Vim Grepper: ------------------------------
" command! -nargs=1 Find  :Grepper -side -query <args>
command! -nargs=1 Find  :tabe % | Grepper -side -query <args>
command! -nargs=1 Findb :tabe % | Grepper -side -buffers -query <args>

" This works pretty well. could reuse for other purposes
command! Todo Grepper -tool git -query -E '(TODO|FIXME|XXX):'

runtime plugin/grepper.vim    " initialize g:grepper with default values
let g:grepper.stop = 20

autocmd! FileType GrepperSide
  \  silent execute 'keeppatterns v#'.b:grepper_side.'#'
  " \| set syntax=purescript
" TODO make this use the syntax of the (first?) buffer filetype
  \| set syntax=vim
  \| silent normal! ggn

" Note: This runs a search/selection that allows to apply the purescript syntax only to the selcted lines!
" search pattern from ".b:grepper_side": \v^%(\>\>\>|\]\]\]) ([[:alnum:][:blank:]\/\-_.~]+):(\d+)

" This does not seem needed? also not working?
" nmap gs  <plug>(GrepperOperator)
" xmap gs  <plug>(GrepperOperator)

highlight GrepperSideFile gui=italic guifg=#C34371 guibg=#000000
highlight Conceal         guifg=#FFFFFF guibg=#000000

fun! GrepSearch(selType, mode)
    if a:selType == "word"
      let keyw = expand("<cword>")
    else
      let keyw = Get_visual_selection()
    endif
    if a:mode == "buffers"
      " exec 'Grepper -side -buffers -query "' . keyw . '"'
      exec 'Findb "' . keyw . '"'
    else
      " exec 'Grepper -side -query "' . keyw . '"'
      exec 'Find "' . keyw . '"'
    endif
endfun
" Vim Grepper: ------------------------------


fun! GoogleSearchStr()
    let keyw = expand("<cword>")
    let url = 'http://www.google.de\#q\=' . keyw
    return url
endfun

fun! Google()
    let keyw = expand("<cword>")
    let url = 'http://www.google.de\#q\=' . keyw
    let comm = 'silent !open ' . url
    exec comm
endfun

fun! GoogleVisSel()
    let keyw = Get_visual_selection()
    let enckw = UrlEncode(keyw)
    let url = 'http://www.google.de\#q\=' . enckw
    let comm = 'silent !open ' . url
    exec comm
endfun

fun! GoogleSearch(selType)
    if a:selType == "word"
      let keyw = expand("<cword>")
    else
      let keyw = Get_visual_selection()
    endif
    let enckw = UrlEncode(keyw)
    let extension = GetExtension()
    if extension == "purs"
      let lang = 'PureScript'
    elseif extension == "hs"
      let lang = 'Haskell'
    else
      let lang = ''
    endif
    let url = 'http://www.google.de\#q\=' . lang . '+' . enckw
    let comm = 'silent !open ' . url
    exec comm
endfun

fun! OpenVisSel()
    let keyw = Get_visual_selection()
    let enckw = UrlEncode(keyw)
    let comm = 'silent !open ' . enckw
    exec comm
endfun

fun! DocsForCursorWord()
    let keyw = expand("<cword>")
    if IsPurs()
      let url = 'https://pursuit.purescript.org\/search\?q\=' . keyw
    else
      " let url = 'https://www.stackage.org\/lts-8\.22\/hoogle\?q\=' . keyw
      let url = 'https://www.stackage.org\/lts-12.6\/hoogle\?q\=' . keyw
      " let url = 'https://www.haskell.org\/hoogle\/\?hoogle\=' . keyw
    endif
    let comm = 'silent !open ' . url
    exec comm
endfun

fun! DocsForVisSel()
    let keyw = Get_visual_selection()
    let enckw = UrlEncode(keyw)
    if IsPurs()
      let url = 'https://pursuit.purescript.org\/search\?q\=' . enckw
    else
      " let url = 'https://www.stackage.org\/lts-8\.22\/hoogle\?q\=' . enckw
      let url = 'https://www.stackage.org\/lts-12.6\/hoogle\?q\=' . enckw
      " let url = 'https://www.haskell.org\/hoogle\/\?hoogle\=' . enckw
    endif
    let comm = 'silent !open ' . url
    exec comm
endfun

fun! HoogleForCursorWord()
    let g:originFile = expand('%')
    " why did I use this? turns out this or 'w!' crashes vim!
    " originFile is needed for hsimport to work!
    if IsPurs()
      call PSCIDEpursuit(PSCIDEgetKeyword())
    else
      let keyw = expand("<cword>")
      let comm = 'Hoogle ' . keyw
      exec comm
      " exec 'w!'
      wincmd j
    endif
endfun

fun! HoogleForVisSel()
    let g:originFile = expand('%')
    exec 'silent! s/\%V→/->'
    exec 'silent! s/\%V∷/::'
    exec 'silent! s/\%V⇒/=>'
    let keyw = Get_visual_selection()
    " exec 'silent! s/\%V->/→'
    " exec 'silent! s/\%V::/∷'
    " exec 'silent! s/\%V=>/⇒'
    " use undo instead to prevent adding this to the undo list!
    " exec 'u'
    " let comm = 'silent Hoogle ' . keyw
    let comm = 'Hoogle ' . keyw
    exec comm
    " exec 'w!'
    wincmd j
endfun


command! -nargs=1 Docs  :call Docs(<args>)

command! -nargs=1 Docsp :call Docsp(<args>)

command! -nargs=1 Docsh :call Docsh(<args>)


fun! Docs(searchSt)
    let enckw = UrlEncode(a:searchSt)
    if IsPurs()
      let url = 'https://pursuit.purescript.org\/search\?q\=' . enckw
    else
      " let url = 'https://www.stackage.org\/lts-8\.22\/hoogle\?q\=' . enckw
      let url = 'https://www.haskell.org\/hoogle\/\?hoogle\=' . enckw
    endif
    let comm = 'silent !open ' . url
    exec comm
endfun

fun! Docsp(searchSt)
    let enckw = UrlEncode(a:searchSt)
    let url = 'https://pursuit.purescript.org\/search\?q\=' . enckw
    let comm = 'silent !open ' . url
    exec comm
endfun

" "stack build && stack exec pragmaticServant-exe"
  " normal! gg"_dG

" nnoremap <leader>cab :e *.cabal<cr>
    " let extension = expand("%:e")


" Extracts the project name, e.g. "pragmaticServant" from the Stack "package.yaml" file
fun! HaskellProjectName()
    let firstLine = readfile('package.yaml')[0:0][0]
    return split(firstLine)[1]
endfun
" These are the first two lines from "package.yaml" at the root of the project folder/working directory:
" name:                pragmaticServant
" version:             0.1.0.0

" Alternative approach: use name of working directory
" expand('%:p:h:t')
fun! HaskellProjectName1()
    return fnamemodify('package.yaml', ':p:h:t')
endfun




" Opens a visible terminal and builds and runs the stack project (using stack build && stack exec ..)
" TODO: two alternative ways to launch long running processes:
" ➜  pragmaticServant git:(master) ✗ stack runghc src/Lib.hs
" 2. Launch a terminal with "glt" + "ghcid -T :main"
fun! HaskellStackRun()
    " let Cbs2 = {
    " \ 'on_stdout': function('OnEv1'),
    " \ 'on_stderr': function('OnEv1'),
    " \ 'on_exit': function('OnEv1')
    " \ }

    " let commandBaseString = "!stack build && stack exec "
    let projectName = HaskellProjectName1()
    " let commString = commandBaseString . projectName . "-exe"
    " let commString = "stack build"
    let commString = "20Term stack build && stack exec " . projectName . "-exe"
    " let StackRunIO = jobstart(commString, Cbs2)
    " exec "20Term stack build"
    
    exec commString
endfun
" example command:
" "stack build && stack exec pragmaticServant-exe"
" glt :20Term<cr>

  " command! PursRepl :let PursReplID = jobstart("pulp repl", Cbs1)
		  " :call jobstart(split(&shell) + split(&shellcmdflag) + ['{cmd}'])
      "
" ➜  pragmaticServant git:(master) ✗ stack runghc src/Lib.hs
" 2. Launch a terminal with "glt" + "ghcid -T :main"


fun! GithubSearch(selType)
    if a:selType == "word"
      let keyw = expand("<cword>")
    else
      let keyw = Get_visual_selection()
    endif

    let extension = GetExtension()

    if extension == "purs"
      let lang = 'PureScript'
    elseif extension == "hs"
      let lang = 'Haskell'
    else
      let lang = ''
    endif
    exec RunGithubSearch(keyw, lang)
endfun

fun! RunGithubSearch(keyw, lang)
    let enckw = UrlEncode(a:keyw)
    let base = 'https://github.com/search\?l\='
    let baseLang = base . a:lang . '\&q\='
    let search = baseLang . enckw . '\&type\=Code'
    let comm = 'silent !open ' . search
    return comm
endfun


fun! IsPurs()
    let extension = expand("%:e")
    " echom expand("%:e")
    if extension == "purs"
      return 1
    else
      return 0
    endif
endfun

fun! GetExtension()
    let extension = expand("%:e")
    return extension
endfun
" vim

fun! EncodeChar(char)
   if a:char == '%'
       return '%%'
   elseif a:char == ' '
       return '+'
   else
       " Taken from eval.txt
       let n = char2nr(a:char)
       let r = ''
       while n
           let r = '0123456789ABCDEF'[n % 16] . r
           let n = n / 16
       endwhile
       return '%'. r
   endif
endf

fun! EncodeURL(url)
   return substitute(a:url, '\([^a-zA-Z0-9_.-]\)', '\=EncodeChar(submatch(1))', 'g')
endf

" URL encode a string. ie. Percent-encode (actually backslash!) characters as necessary.
function! UrlEncode(string)
    let result = ""
    let characters = split(a:string, '.\zs')
    for character in characters
        if character == " "
            let result = result . "+"
        elseif CharacterRequiresUrlEncoding(character)
            let result = result . '\' . character
            " let i = 0
            " while i < strlen(character)
            "     let byte = strpart(character, i, 1)
            "     let decimal = char2nr(byte)
            "     let result = result . "%" . printf("%02x", decimal)
            "     let i += 1
            " endwhile
        else
            let result = result . character
        endif
    endfor
    return result
endfunction

" Returns 1 if the given character should be percent-encoded in a URL encoded
" string.
function! CharacterRequiresUrlEncoding(character)
    let ascii_code = char2nr(a:character)
    if ascii_code >= 48 && ascii_code <= 57
        return 0
    elseif ascii_code >= 65 && ascii_code <= 90
        return 0
    elseif ascii_code >= 97 && ascii_code <= 122
        return 0
    elseif a:character == "-" || a:character == "_" || a:character == "." || a:character == "~"
        return 0
    endif
    return 1
endfunction

function! GetStringTillEndOfLine()
  return strpart( getline('.'), col('.') - 1 )
endfunction

nnoremap <leader>sb i<CR><C-R>=repeat(' ',col([line('.')-1,'$'])-col('.'))<CR><Esc>l
" nnoremap <leader>sn :echo col([line('.'),'$'])<CR>
nnoremap <leader>sn i<CR><C-R>=repeat(' ',col([line('.')-1,'$'])-col('.'))<CR><Esc>l
" Vim will insert a newline (<CR>) followed by a number of spaces (<C-R>=repeat(' ',...)) equal to the difference between the column number of the end of the previous line (col([line('.')-1,'$'])) and the current column number (col('.'))


" TIP: indenting, inserting characters
function! ExampleIndentByNChars()
  let l:str1 = repeat('X', col('.'))

  " this line reads as follows:
  " from the current line (".")
  " to "+2" lines (after the ",")
  " substitute ("s/")
  " from any character ("^")
  " inserting the string using ". l:str1 ."
  " "g" mean global (see: "http://vim.wikia.com/wiki/Search_and_replace")
  exec '.,+2s/^/' . l:str1 . '/g'
  " Example: with cursor (') on column 18 / the "x"
" XXXXXXXXXXXXXXXXXX  " testline 1111x11
" XXXXXXXXXXXXXXXXXX  " testline 2222222
" XXXXXXXXXXXXXXXXXX  " testline 3333333
endfun


function! Get_visual_selection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

function! ExampleFor()
  "" warn: did not work reliably when applied..
  for _ in range(1,22)
    " Search for n in current line. Returns line num or 0
    if search('n', 'p', line(".")) > 0
      echo "inn"
    else
      echo "out"
      break
    endif
  endfor
  echo "off"
endfunction



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

" highlight TagbarHighlight guifg=Green ctermfg=Green
highlight default link TagbarHighlight  Cursor
" how quickly tagbar (and vim in gnyeneral!) refreshes (from file?)
set updatetime=500
let g:tagbar_sort = 0

set tags=tags;/,codex.tags;/
" TODO: run ctags manually? how would tags work for purescript
" ctags -f - --format=2 --excmd=pattern --extra= --fields=nksaSmt myfile

if executable('lushtags')
    let g:tagbar_type_haskell = {
        \ 'ctagsbin' : 'lushtags',
        \ 'ctagsargs' : '--ignore-parse-error --',
        \ 'kinds' : [
            \ 'm:module:0',
            \ 'e:exports:1',
            \ 'i:imports:1',
            \ 't:declarations:0',
            \ 'd:declarations:1',
            \ 'n:declarations:1',
            \ 'f:functions:0',
            \ 'c:constructors:0'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 'd' : 'data',
            \ 'n' : 'newtype',
            \ 'c' : 'constructor',
            \ 't' : 'type'
        \ },
        \ 'scope2kind' : {
            \ 'data' : 'd',
            \ 'newtype' : 'n',
            \ 'constructor' : 'c',
            \ 'type' : 't'
        \ }
    \ }
    " Add support for purescript files in tagbar.
    let g:tagbar_type_purescript = {
        \ 'ctagsbin' : 'lushtags',
        \ 'ctagsargs' : '--ignore-parse-error --',
        \ 'kinds' : [
            \ 'm:module:0',
            \ 'e:exports:1',
            \ 'i:imports:1',
            \ 't:declarations:0',
            \ 'd:declarations:1',
            \ 'n:declarations:1',
            \ 'f:functions:0',
            \ 'c:constructors:0'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 'd' : 'data',
            \ 'n' : 'newtype',
            \ 'c' : 'constructor',
            \ 't' : 'type'
        \ },
        \ 'scope2kind' : {
            \ 'data' : 'd',
            \ 'newtype' : 'n',
            \ 'constructor' : 'c',
            \ 'type' : 't'
        \ }
    \ }
    " Add support for markdown files in tagbar.
    " let g:tagbar_type_markdown = {
    "   \ 'ctagstype' : 'markdown',
    "   \ 'kinds' : [
    "       \ 'h:Heading_L1',
    "       \ 'i:Heading_L2',
    "       \ 'k:Heading_L3'
    "   \ ]
    " \ }
    let g:tagbar_type_markdown = {
        \ 'ctagstype': 'markdown',
        \ 'ctagsbin' : '~/.vim/plugged/markdown2ctags/markdown2ctags.py',
        \ 'ctagsargs' : '-f - --sort=yes',
        \ 'kinds' : [
            \ 's:sections',
            \ 'i:images'
        \ ],
        \ 'sro' : '|',
        \ 'kind2scope' : {
            \ 's' : 'section',
        \ },
        \ 'sort': 0,
    \ }
endif

" copied from purescript - pscide-mac:
fun! s:jsonEncode(thing, ...)
  let nl = a:0 > 0 ? (a:1 ? "\n" : "") : ""
  if type(a:thing) == type("")
    return '"'.escape(a:thing,'"\').'"'
  elseif type(a:thing) == type({}) && !has_key(a:thing, 'json_special_value')
    let pairs = []
    for [Key, Value] in items(a:thing)
      call add(pairs, s:jsonEncode(Key).':'.s:jsonEncode(Value))
      unlet Key | unlet Value
    endfor
    return "{".nl.join(pairs, ",".nl)."}"
  elseif type(a:thing) == type(0)
    return a:thing
  elseif type(a:thing) == type([])
    return '['.join(map(copy(a:thing), "s:jsonEncode(v:val)"),",").']'
    return
  elseif string(a:thing) == string(s:jsonNULL())
    return "null"
  elseif string(a:thing) == string(s:jsonTrue())
    return "true"
  elseif string(a:thing) == string(s:jsonFalse())
    return "false"
  else
    throw "unexpected new thing: ".string(a:thing)
  endif
endf

fun! s:jsonNULL()
  return {'json_special_value': 'null'}
endf
fun! s:jsonTrue()
  return {'json_special_value': 'true'}
endf
fun! s:jsonFalse()
  return {'json_special_value': 'false'}
endf
fun! s:jsonToJSONBool(i)
  return  a:i ? s:jsonTrue() : s:jsonFalse()
endf

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


" ------- Formatting Haskell Imports ----------------------------------
let g:stylish_haskell_command = 'stylish-haskell'
" taken from stylish-haskell plugin
function! s:OverwriteBuffer(output)
  let winview = winsaveview()
  silent! undojoin
  normal! gg"_dG
  call append(0, split(a:output, '\v\n'))
  normal! G"_dd
  call winrestview(winview)
endfunction

function! StylishHaskell()
  write
  " write any changes as otherwise those would be lost - no undo possible!
  let output = system(g:stylish_haskell_command . " " . bufname("%"))
  let errors = matchstr(output, '\(Language\.Haskell\.Stylish\.Parse\.parseModule:[^\x0]*\)')
  if v:shell_error != 0
    echom output
  elseif empty(errors)
    call s:OverwriteBuffer(output)
    write
  else
    echom errors
  endif
endfunction
" ------- Formatting Haskell Imports ----------------------------------



" Utilities: --------------------------------------------------------------------------
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


command! -bar RangerChooser call RangeChooser()
function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    if has("gui_running")
        exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
    else
        exec 'silent !ranger --choosefiles=' . shellescape(temp)
    endif
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
