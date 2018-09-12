filetype plugin indent on

" vim-plug:
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'

Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" fullscreen mode
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Plug 'bling/vim-bufferline'

" Plug 'Valloric/ListToggle'
Plug 'kshenoy/vim-signature'
Plug 'mattn/ctrlp-mark'
Plug 'airblade/vim-gitgutter'

Plug 'AndrewRadev/linediff.vim'

" VIM SESSION SHELL:
Plug 'xolox/vim-misc'
Plug 'kopischke/vim-stay'
Plug 'xolox/vim-session'
" Restore folding
" Plug 'vim-scripts/restore_view.vim'
" Plug 'Twinside/vim-haskellFold'
Plug 'https://github.com/dbakker/vim-projectroot'
" Plug 'xolox/vim-shell'
" iTerm2 integration
Plug 'sjl/vitality.vim'

Plug 'tomasr/molokai'
Plug 'dim13/smyck.vim'

Plug 'jelera/vim-javascript-syntax'
Plug 'leafgarland/typescript-vim'

" Code navigation
" Plug 'justinmk/vim-sneak'
Plug 'romgrk/vim-sneak', { 'branch': 'use-matchadd' }

" Code utils
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-easy-align'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'kana/vim-textobj-fold'
Plug 'matze/vim-move'

Plug 'chrisbra/Colorizer'
Plug 'KabbAmine/vCoolor.vim'

Plug 'yosiat/oceanic-next-vim'

" Highlight
" Plug 't9md/vim-quickhl'
Plug 'kana/vim-operator-user'

" Plug 'lambdatoast/elm.vim'

Plug 'raichoo/purescript-vim'
Plug 'FrigoEU/psc-ide-vim'
" Plug 'coot/psc-ide-vim', { 'branch': 'vim' }

Plug 'jpalardy/vim-slime'

" lookup ":h vim2hs", e.g. Tabularize haskell_types is useful
Plug 'goolord/vim2hs'
Plug 'eagletmt/ghcmod-vim', {'for': 'haskell'}
" Plug 'eagletmt/ghcmod-vim'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }

Plug 'Shougo/vimproc.vim', {'do': 'make'}

" Plug 'eagletmt/neco-ghc'
" Plug 'bitc/vim-hdevtools'
" crashes vim on :HdevtoolsType command
"
Plug 'dan-t/vim-hsimport'

" Problem: this did not indent Record syntax properly
" Plug 'neovimhaskell/haskell-vim'
Plug 'itchyny/vim-haskell-indent'
" Plug 'alx741/vim-hindent'

" compliant with brittany
Plug 'sbdchd/neoformat'

Plug 'kana/vim-textobj-user'
Plug 'gilligan/vim-textobj-haskell'
" requires python

" Plug 'jaspervdj/stylish-haskell'
Plug 'w0rp/ale'
Plug 'mpickering/hlint-refactor-vim'
Plug 'neomake/neomake'
Plug 'vim-syntastic/syntastic'

Plug 'parsonsmatt/intero-neovim'

Plug 'Twinside/vim-hoogle'

" Plug 'ervandew/supertab'
" did not work with omnicomplete so far
"
Plug 'mhinz/vim-grepper'

Plug 'majutsushi/tagbar'
" there is a Haskell integration, but it does not work :Tag.. not..

Plug 'vimlab/split-term.vim'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'


call plug#end()
" ----------------------------------------------------------------------------------



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



" Other Settings:  ---------------------------------------------------------------
set lazyredraw

" ---- Color ----

set selection=inclusive

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
set t_vb=


" Airline Settings: --------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_inactive_collapse=0
let g:airline#extensions#tabline#fnamemod = ':t:r'
let g:airline_theme='simple'
let g:airline_exclude_preview = 0
" abbriviates vim-mode (e.g. "Normal" to "N")
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
let g:airline_highlighting_cache = 0
let g:airline_detect_modified=0
let g:airline_section_a = '%-0.18{getcwd()}'
" let g:airline_section_b = '%<%f%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
let g:airline_section_b = '%<%f %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
" removed the modified flag 'm' here!
let g:airline_section_c = ''
let g:airline_section_x = ''
let g:airline_section_y = "%{airline#util#wrap(airline#extensions#hunks#get_hunks(),0)}%{airline#util#wrap(airline#extensions#branch#get_head(),0)}"


" Messages: ----------------------------------------------------------------------
set shortmess+="mW"

augroup bufenter
  " NOTE: autocmd! clears all autocmds in this group before defining them again. Otherwise the commands would fire twice and cause vim to slow down!!
  autocmd!
  " surpress the filename/info message that is shown in the shell on
  " buffer-change
  " autocmd BufWinEnter * call feedkeys("\<C-\>\<C-n>:\<CR>", 'n')
  " does this print the ":"??
  autocmd BufWinEnter * call feedkeys("\<C-\>\<C-n>:\<C-c>", 'n')
  " ok, this is really a hack: it exits a (potentially) terminal mode, then
  " goes to the shell and cancels any visible message. TODO: how can one
  " prevent that messages are printed in the first place?
augroup END


" Session: -----------------------------------------------------------------------

" ------- Vim-session settings ---------
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:session_command_aliases = 1

" 'sessionoptions' (default: "blank,buffers,curdir,folds,
" 					       help,tabpages,winsize"

set sessionoptions+=folds
set sessionoptions-=curdir
" set sessionoptions-=tabpages
set sessionoptions-=winsize
set sessionoptions-=help
set sessionoptions-=options
set sessionoptions-=blank

let g:session_persist_font = 0
let g:session_persist_colors = 0

" Prevent mkview to save and restore the cwd per file! This uses the command API of the vim-stay plugin.
augroup stay_no_lcd
  autocmd!
  if exists(':tcd') == 2
    autocmd User BufStaySavePre  if haslocaldir() | let w:lcd = getcwd() | exe 'cd '.fnameescape(getcwd(-1, -1)) | endif
  else
    autocmd User BufStaySavePre  if haslocaldir() | let w:lcd = getcwd() | cd - | cd - | endif
  endif
  autocmd User BufStaySavePost if exists('w:lcd') | execute 'lcd' fnameescape(w:lcd) | unlet w:lcd | endif
augroup END

set undofile
" set noundofile
" set undodir="~/vimfiles/undo/"
set undodir=~/vimtmp/undo,.

" set nobackup
" set nowritebackup

" Restore view settings
" set viewoptions=cursor,folds
set viewoptions=cursor,folds,slash,unix

" set viewdir=$HOME/.vim_view//
set viewdir=~/vimtmp/view//
" au BufWritePost,BufLeave,WinLeave ?* mkview
" au BufWritePost ?* mkview
" au BufWinEnter ?* silent loadview

" Load locked session after a vim crash
command! SessionLoadLocked OpenSession!

" Local Plugin Patch: 
" /Users/andreas.thoelke/.vim/plugged/vim-session/autoload/xolox/session.vim
" commented this line:
  " call xolox#session#save_qflist(a:commands)
" to prevent "call setqflist([])" as this sometimes throws errors on session load.
" Troubleshooting: 
" look at: "e ~/.vim/sessions/default.vim"
" delete that file or the "...lock" addition
" Issue: "badd" is commented out and only one buffer is reloaded:
" Solutions: unsolved. it just went away after disabeling autosafe then
" reanableing autosafe.
" ------- Vim-session settings ---------



" ------- Shared Data persistence ---------
command! ShadaClear :call ClearShada()
function! ClearShada()
    exec "!rm" . ' ~/.local/share/nvim/shada/main.shada'
endfunction

command! ShadaLoad :call LoadShada()
function! LoadShada()
    exec       ':e ~/.local/share/nvim/shada/main.shada'
endfunction

" define what is saved/restored from ~/.local/share/nvim/shada/main.shada
if has('nvim')
  set shada=",'10,f1,<10,h
endif
" only save marks of 10 files, save global marks and only 10 lines in registers
" see: *21.3*	Remembering information; ShaDa

" set shada="!,'100,<50,s10,h,f0"
" f0 disables global marks
" uncomment this line to ignore marks on load! (Markers, Marks persisting)
" TODO: as there is a bug that causes that marks can't be deleted, one could just
" delete the shada file to delete the marks
" ------- Shared Data persistence ---------


" Session: ----------------------------------------------------------------------------


" Color:  ------------------------------------------------------------------------
colorscheme molokai

set nocompatible
set background=dark
set laststatus=2

if has("termguicolors")
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    set termguicolors
else
    set t_Co=256
endif

" --------------------------------------------------------------------------------
" Style/ Color
" How to change colors in the colorscheme?
" Open vimfiles/colors/molokai
" hit <leader><f7><f7> to view the colors (optional)
" hit <f7><f7> to edit a color
" save and run colorscheme molokai
" colorscheme molokai
" colorscheme OceanicNext
" let g:rehash256 = 1

" TODO: show some colors e.g. for TODO: in purescript comments
"       show syntax highlight in purescript comments (within `..code..`)
" Left margin aesthetics

set foldcolumn=2
set numberwidth=5
set number


highlight FoldColumn guibg=gray10 guifg=gray20
hi        LineNr     guibg=gray10 guifg=gray15
hi        Folded     guifg=#4B5B61 guibg=#0B0B0B

" Various settings
set cmdheight=2
set ignorecase
" set autoindent
" set smartindent
set fileencoding=utf-8
set encoding=utf-8
" set backspace=indent,eol,start

set ts=2 sts=2 sw=2 expandtab

set smartcase

" Note: this inverts what 'g' does in substitute!! avoid this
" set gdefault
set incsearch
set showmatch
set linebreak
set hidden
set nowrap
set textwidth=0 wrapmargin=0

" activate line wrapping for a window:
command! -nargs=* Wrap set wrap linebreak nolist
" use `gq<motion` or gqq to merely wrap a range/line

set noswapfile
" set cursorline

" set autochdir
" CAREFUL! this sets the current working directory the the current file on
" every buffer change!!

" set wildmode=list:longest
set wildmenu
set wildmode=full

" Window settings
" Cursor offset from window top and buttom
set scrolloff=13

" Window will always have status bar
set laststatus=2

set splitbelow
set splitright

" ---- Window control ----
" nnoremap dc <c-w>c 
" close the win below
nnoremap <c-w>d <c-w>j<c-w>c 
nnoremap <c-w>t :TagbarToggle<cr>
nnoremap <c-w>- 7<c-w>-
nnoremap <c-w>+ 7<c-w>+
nnoremap <c-w>a 7<c-w>+
nnoremap <c-w>> 4<c-w>>
nnoremap <c-w>< 4<c-w><
" ---- Window control ----


" Various mappings ----------------------------------------------


" TIP: ---------------------------------------------------------------------------
" Python: install from git repo: "pip3 install -e ." in repo, "pip3 list" to confirm


" windows should not be kept at equal size
set noequalalways


let mapleader=" "
" let maplocalleader="\\"

inoremap jk <esc>
" vnoremap <leader><leader> <esc>
" vnoremap ,<space> <esc>
vnoremap g- <esc>

" make '=' easier to type in haskell
inoremap <c-\> =

inoremap :: <c-k>::
inoremap -> <c-k>->
inoremap <- <c-k><-
inoremap => <c-k>=>
" inoremap <= <c-k><=
inoremap forall <c-k>FA

" UNICODE:
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
vnoremap <leader>bu :s/\%V→/->/ge<cr>:s/\%V∷/::/ge<cr>:s/\%V⇒/=>/ge<cr>
vnoremap <leader>bi :s/\%V->/→/ge<cr>:s/\%V::/∷/ge<cr>:s/\%V=> /⇒ /ge<cr>

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

nnoremap $ g_
onoremap $ g_
vnoremap $ g_

nnoremap 0 g_
onoremap 0 g_
vnoremap 0 g_

nnoremap ( ^
onoremap ( ^
vnoremap ( ^

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

" nnoremap <silent> - ?[\(\$\∷\.\⇒\>\→\[\{]<cr>
" nnoremap <silent> ) /[\(\$\∷\.\⇒\<\→\[\{\#]<cr>

nnoremap <silent> - ?[\(\∷\.\⇒\→\[\{]<cr>
nnoremap <silent> ) /[\(\∷\.\⇒\→\[\{\#]<cr>

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



" Tip: Free mapping and use of partial command maps
nnoremap ,b :ls<CR>:buffer<Space>
" Tip: insert mode map: Go to normal-mode for just one command:
" :inoremap <F5> <C-O>:call MyVimFunc()<CR>






" HOOGLE INCLUDE NEW LIBS:
" "hoogle generate base lense" will download and install only the base and
" lense libs.
" open ":e hoogle-defaults" from the root of the project folder, add/delete
" libs, then <backspace> in first line to have everything in one row, and
" copy-paste into terminal
" https://github.com/ndmitchell/hoogle/blob/master/docs/Install.md

let g:hoogle_search_buf_size = 21

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


" General: --------------------------------------------------------------
" nnoremap <leader>w :w!<cr>
nnoremap gw :w<cr>
" nnoremap <silent><leader>w :up<cr>


" EDIT VIM SCRIPT: ---------------------------------------------------------------------
nnoremap <leader>vim :e $MYVIMRC<cr>
" source vim
nnoremap <leader>sv :source $MYVIMRC<cr>

" source the current file
nmap <silent><leader>su :w<CR>:so %<CR>

" source the following paragraph/lines
nnoremap <leader>sf y}:@"<cr>

" TIP: Range example function
function! SourceRange() range
  let tmpsofile = tempname()
  call writefile(getline(a:firstline, a:lastline), l:tmpsofile)
  execute "source " . l:tmpsofile
  call delete(l:tmpsofile)
endfunction

" Source a range
command! -range Source <line1>,<line2>call SourceRange()

" Run a VimScript function and insert the returned result below the paragraph
nnoremap <leader>sh wwy$}i<c-r>=<c-r>"<cr><esc>{w

" Run a VimScript snippet (til end of the line) and insert the returned result!
nnoremap <leader>sy y$o<c-r>=<c-r>"<cr><esc>

" Run a VimScript snippet (til end of the line) and echo the result in the
" command line
nnoremap <leader>sx y$:echom <c-r>"<cr>
" EDIT VIM SCRIPT: ---------------------------------------------------------------------



" paste the current file path
nnoremap <leader>sf i<c-r>=expand("%:p")<cr><esc>^
" nnoremap <leader>sf i<c-r>=fnamemodify('package.yaml',':h:t')<cr><esc>^
" free mapping?

nnoremap <leader>cab :e *.cabal<cr>


" nnoremap <leader>zsh :e ~/.zshrc<cr>
command! Zshrc   :e ~/.zshrc
command! ZshOhMy :e ~/.oh-my-zsh/oh-my-zsh.sh
command! Vimrc   :e ~/.vimrc
command! Cabal   :e *.cabal

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

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

let &t_SI = "\<Esc>]50;CursorShape=0\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set termguicolors
set guicursor=n:block-iCursor-blinkwait300-blinkon200-blinkoff150

" ------- General --------------------------------------------------------------



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
nmap <leader>aa :ALEToggle<cr>

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

" quickfix window and loclist window
nmap <silent> [w :lprev<cr>
nmap <silent> ]w :lnext<cr>
nmap <silent> [e :cprev<cr>
nmap <silent> ]e :cnext<cr>


" Mappings in the style of unimpaired-next
" nmap <silent> [W <Plug>(ale_first)
" nmap <silent> [w <Plug>(ale_previous)
" nmap <silent> ]w <Plug>(ale_next)
" nmap <silent> ]W <Plug>(ale_last)
" ALE: --------------------------------------------------------


" SYNTASIC: ---------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
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

nmap <leader>ss :SyntasticToggle<cr>
nmap <leader>sc :SyntasticCheck<cr>
nmap <leader>sr :SyntasticReset<cr>

" SYNTASIC: ---------------------------------------------------


" Neomake: ----------------------------------------------------
" Neomake does the same as Ale
" While Hlint (and stack-ghc-mod?) uses Ale for signs in the signcolumn,
" Intero uses Neomake to show error and ghc warnings
hi NeomakeErrorSign   ctermfg=white
hi NeomakeWarningSign ctermfg=white
hi NeomakeIntoSign    ctermfg=white
hi NeomakeMessageSign ctermfg=white

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

" GitGutter: -------------------------------------------------------
nmap <leader>gg :GitGutterToggle<cr>
" Note: Gutter updates on save!

nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk
" Issue Note: does not work after buffer change? temp-fix: make a change and safe!
" alt: disable gutter, close file, open file, enable gutter → ]c should work again

" TIP: use: GitGutterUndoHunk, ..PreviewHunk
" TODO: might enable these:
" stage the hunk with <Leader>hs or
" undo it with <Leader>hu.
" TIP: this actually undos the section (hunk). this is specifically useful at
" the yellow "~", to see what was changed!
nmap <Leader>hr <Plug>GitGutterUndoHunk
" Todo: not sure how staging a hunk works..
nmap <Leader>ha <Plug>GitGutterStageHunk

let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_enabled = 0
nmap <silent> ]c :call NextHunkAllBuffers()<CR>
nmap <silent> [c :call PrevHunkAllBuffers()<CR>

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
nnoremap <silent>         gd :call GotoDefinition()<CR>
nnoremap <silent> <leader>gd :sp<CR>:call GotoDefinition()<CR>
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
nnoremap gei :call ReplEvalExpr_Insert( ExtractEvalExpFromLineStr( getline('.') ) )<cr>
vnoremap gei :call ReplEvalExpr_Insert( Get_visual_selection() )<cr>
nmap gee gei
vmap gee gei

" Evaluate the entire line 
nnoremap gel :call ReplEvalExpr_Insert( getline('.') )<cr>

" Eval the current keyword
" nnoremap gew :call ReplEvalExpr_Insert( PSCIDEgetKeyword() )<cr>
nnoremap gew :call ReplEvalExpr_Insert( expand("<cword>") )<cr>
" Repl Eval Insert: ------------------------------------------------


nnoremap dip :Pimport<cr>
nnoremap dap :Papply<cr>:call PurescriptUnicode()<cr>
" TODO: currently :Papply indents the current line by one char.  same for haskell?


" just for testing - not sure when this might be useful
nmap <leader>dhi :echo intero#util#get_haskell_identifier()<cr>
" alternative to PSCIDEgetKeyword()

" New Haskell And Purescript Maps: ------------------------------------------------------

" Old Intero Maps: ------------------------------------------------------------------
nnoremap <Leader>kk :call ReplTopFnRL()<cr>
nnoremap geri :call ReplTopFnRLInsert()<cr>

" run selection
vnoremap <Leader>kk :call ReplVisSel()<cr>

" run (commented) function call with many args
nnoremap <Leader>kl :call ReplComLine()<cr>
nnoremap gec        :call ReplComLine()<cr>

" reload module
nnoremap <Leader>kr :call ReplReload()<cr>
nnoremap dr :call ReplReload()<cr>

" nnoremap tr :call TraceTopLevelValue()<cr>
nnoremap ta :call TraceTopLevelValue()<cr>
" nnoremap tf :call TraceComLine()<cr>
" Old Intero Maps: ------------------------------------------------------------------


"
" VIM COMMANDHISTORY:
" 'q:'

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
" 1.copy/extract function signatures to the end of the file
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

" Hit enter to add a new line above or below the current line
" nnoremap <c-Enter> i<cr><Esc>
nnoremap <CR> o<Esc>

" Break line at cursor position
nnoremap J i<CR><Esc>
nnoremap L i <Esc>
" free mapping 'H'!

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
nmap <leader>ga <Plug>(EasyAlign)

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
nmap <leader>mll i----------------------------------------------------------------------------------<esc>^
" Fill line with dashes
nnoremap <leader>mlk $a<space><esc>82a-<esc>d82<bar>^
" TODO: this somehow stops working!?


" ------------------------------------------------------
" Paste and delete -------------------------------------

" Paste from the yank register
nmap <leader>p "0p
nnoremap <leader>P "0P

" Paste and copy System clipboard
nmap <leader><c-p> "+P

" nnoremap <leader>vv "+P
nnoremap <leader>vv "+P:call PurescriptUnicode()<cr>h

" copy from clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Paste to Command line
nmap <leader><m-p> :<c-r>"
" <c-r>"


" SOME TOOLS FUNTIONS, TIPS
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
" TIP: insert the file path of the current file!
nnoremap <leader>fp i<c-r>=expand('%')<cr><esc>

fun! SomeTest1( ar1 )
  echo "out: " . a:ar1
  return "Some arg: " . a:ar1
endfun

" TIP: print the file type: ":echo &ft"
" TIP: copy a past ex-command/vim-shell command: hit "q:" !
" TIP: print last messages/errors: ":messages"
" TIP: return filetype as literal string, e.g. 'haskell', instead of 'hs'
" TIP: create a directory: `:! mkdir src/modules`
" TIP: use :substitute command: "%s/exports./var /" replaces "exports.jsvar1 = function" with "var jsvar1 = function" in the whole file!
" TIP: get the string/spaces of how much a line is indented: let indent = matchstr(getline(lnr), '^\s*\ze')
" paste last command: ":p
" redirect command echo text to register: :redir @t, then pt, later :redir end
" run any command with ':!{cmd}' or use <C-z> to suspend nvim, then run 'fg'
" to bring nvim back to the foreground
" change terminal cursor colors: highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
" TIP: :new creates a new buffer, ":read !cat /etc/shells" → append output of
" the command to the current buffer at cursor positon.
" run a date/time loop in the shell: "terminal while true; do date; sleep 1; done
" TIP: The expression register reads-in an arbitary expression into the p-register or insert-mode:
" "<c-r>=v:version<cr>" will insert the vim-version in insert-mode, "=v:version<cr> will allow to 'p'/'P' in normal mode
" :let, :let g:, :let b:<cr> lists global-, or buffer-variables
" example: ":let test12=123<cr>" and then in insert mode: <c-r>=test12<cr> will paste "123"
" TIP: look through OS-environment variables: ":echo $" and then TAB
"      example: paste environment variable: "i<c-r>=$SHELL" → /bin/zsh
" TIP: write an environment variable: ":let $TEST12"
" TIP: git config --global core.editor "nvim"
"      lookup: "cat ~/.gitconfig"
" TIP: ad-hock environment variable: in terminal: "export test44=$PATH:~/Documents" this appends another dir to the PATH
" TIP: use (%) current file name in shell: ":!cat %"
" TIP: use 'find' to get full path and then 'gf': terminal: "find $PWD" and then "gf" on the the absolute path
" if expressions: echo (v:true ? 'yes' : 'no') -- echo (v:false ? 'yes' : 'no')
" TIP: set the cursor pos: let cursor = getcurpos(), call cursor(cursor[1], startColumn - 1)
"      also: line('.') and col('.') get row and column num
" TIP: "<C-z>" to suspend nvim and get back to the terminal. then run "fg" to
" get back to nvim.
" TODO: delete long space between words: "elldw" example: ^ord            next
" TIP: remove trailing whitespace: ":%s/\s\+$//e"
" TIP: use ":earlier" and ":later" to jump the ":undolist" back and forth in
" *time* (disregarding branches of the undotree). use ":earlier 10m" or ".. 5h" to go
" back 10 minutes/ 5 hours
" TIP: use "set spell" and "set nospell" to activate spell checking. also use
" "set spelllang=de" to set the language.
" TIP: vim variables state can be shown via "set spelllang?"
" TIP: Vim-anywhere replacement: use: "alfred vim(mac vim)", edit text, then
" do "<leader>ccl" to copy to clipboard and ":q!" vim.
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
nmap <leader>uf :call RandFnName()<cr>2w
" produces a (test) haskell function with a random name, e.g.:
" cp0 = undefined
" "unique symbol"
nmap <leader>us :call RandSymbol()<cr>

" "expand function": expand a symbol name to a function stub
nmap <leader>ef A :: String<esc>^ywo<esc>PA= undefined<esc>b
" nmap <leader>fe A :: String<esc>^ywjPA= undefined<esc>b

" "expand signature": expand a signature to a function stub
nmap <leader>es ^ywo<esc>PA= undefined<esc>b

" "expand undefined": expand a signature to a function stub
nmap <leader>eu yiwo<esc>PA = undefined<esc>b
" nmap <leader>fe A :: String<esc>^ywjPA= undefined<esc>b


nmap <leader>uef <leader>us<leader>ef

" "index symbol" append postfix index to function name
nmap <leader>if ea0^jea0^k

nmap <leader><c-a> jk^
nmap <leader><c-x> <c-x>j<c-x>k^


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
nmap <leader>ccu "td}:call TransfTRegAndAppend( function('StripNewlinesAndMultispaces') )<cr>k

" Get the type of do-binds by producing a type error:
nnoremap <leader>cco "tyiwolet (xb0 :: Int) = <esc>"tp^


" Apply 'fn' to the 't'/temp and append the result after the current line
function! TransfTRegAndAppend ( fn )
  call append( line('.') - 1, a:fn( @t ))
endfun
" Testfn: Use of TransfTRegAndAppend with higher order function
nmap <leader>cci "tdd:call TransfTRegAndAppend( function('toupper') )<cr>

function! StripNewlinesAndMultispaces( str ) " 1. delete all newlines:
  let l:str1 = substitute(  a:str,  '\n',  '', 'ge' )
 " 2. replace sections/words that have more than one space (regex: ' \+') with one space
 let l:str2 = substitute( l:str1, ' \+', ' ', 'ge' )
 return l:str2
 " the same in one 's' command:
  " exec 's/\n//ge | s/ \+/ /ge'
endfun

" noremap <leader>ci /<c-k>-><cr>
" noremap <leader>ci /<c-k>::<cr>
" noremap <leader>ci :call FormatSign()<cr>
"
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
" nmap <leader>re "_die"0P`[
" nmap <leader>re ve"0pb
" nmap <leader>re "_die"0Pb
" nmap <leader>rf "_daf"0PB

" Replace inner word
nmap <leader>rw "_diw"0Pb
" nmap yrw "_diw"0Pb
nmap yriw "_diw"0Pb
nmap yrw Pl"_dwb
" Register, black hole, delete, inner word, paste from yank register, go to beginning

" Replace words
" nmap <leader>rw "_diw"0Pb
" nmap <leader>rW "_diW"0PB
" beginning of pasted text.

" Replace rest of the line
nmap <leader>r0 "_d$"0p`[

" Make deleting to black hole register easier?
nnoremap D "_d
" Replacing: ---------------------------------------------



" Folding: ------------------------------------------------
" Toggle folding
nnoremap z<space> za
" zfaf => fold clojure form

" What actions automatically open folds?
set foldopen="undo"
" set foldopen="block,hor,mark,percent,quickfix,search,tag,undo"
set foldtext=MyFoldText()
function! MyFoldText()
  let line = getline(v:foldstart)
  " let sub  = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  return line
endfunction

" Folding: ------------------------------------------------


" Comment line or selection
nmap dc gc
nmap dco gcc

" comment form??
nmap coaf gcaf



"  --------------------------------------------------------
"
" Using marks
" Jump across buffers
nnoremap ma mA
nnoremap mb mB
nnoremap mc mC
nnoremap ms mS
nnoremap md mD
nnoremap mf mF
nnoremap mg mG
nnoremap mq mQ
nnoremap mw mW
nnoremap me mE
nnoremap mr mR
nnoremap mt mT

nnoremap 'a 'A
nnoremap 'b 'B
nnoremap 'c 'C
nnoremap 's 'S
nnoremap 'd 'D
nnoremap 'f 'F
nnoremap 'g 'G
nnoremap 'q 'Q
nnoremap 'w 'W
nnoremap 'e 'E
nnoremap 'r 'R
nnoremap 't 'T

" nmap <C-space><C-j> ']
" nmap <C-space><C-h> '[

" Markers/Marks
" nnoremap <c-space><c-j> :<C-U>call signature#mark#Goto("next", "spot", "global")<CR>
" nnoremap <c-space><c-h> :<C-U>call signature#mark#Goto("prev", "spot", "global")<CR>
" Free mapping!
nnoremap ]a :<C-U>call signature#mark#Goto("next", "spot", "global")<CR>
nnoremap [a :<C-U>call signature#mark#Goto("prev", "spot", "global")<CR>

" Navigate this using ]w and [w to naviaget loclist /("warnings")
" can alternaivly also navigate with [a ]a
nmap <leader>mm :SignatureListGlobalMarks<cr><c-w>k
nmap <leader>om :CtrlPMark<cr>
" ctrlp-mark plugin useful?

" to learn: m` marks and `` jumps back to this!!
" ma, mb, mc .. to set!
" 'a, 'b, 'c .. to jump!

let g:signaturemap = {
      \ 'leader'             :  "m",
      \ 'PlaceNextMark'      :  "m,",
      \ 'ToggleMarkAtLine'   :  "m.",
      \ 'PurgeMarksAtLine'   :  "m-",
      \ 'DeleteMark'         :  "dm",
      \ 'PurgeMarks'         :  "m<Space>",
      \ 'PurgeMarkers'       :  "m<BS>",
      \ 'GotoNextLineAlpha'  :  "']",
      \ 'GotoPrevLineAlpha'  :  "'[",
      \ 'GotoNextSpotAlpha'  :  "<s-space>]",
      \ 'GotoPrevSpotAlpha'  :  "<s-space>[",
      \ 'GotoNextLineByPos'  :  "]'",
      \ 'GotoPrevLineByPos'  :  "['",
      \ 'GotoNextSpotByPos'  :  "<space>]",
      \ 'GotoPrevSpotByPos'  :  "<space>[",
      \ 'GotoNextMarker'     :  "[+",
      \ 'GotoPrevMarker'     :  "[-",
      \ 'GotoNextMarkerAny'  :  "]=",
      \ 'GotoPrevMarkerAny'  :  "[=",
      \ 'ListLocalMarks'     :  "m/",
      \ 'ListLocalMarkers'   :  "m?"
      \ }

let g:SignatureIncludeMarks = 'ABCDEFGHI'


" To delete all markers (as a last resort, just delete the ~.viminfo file!!

let g:sneak#label = 1
" let g:sneak#clear_syntax = 1

" nmap <leader>f <Plug>Sneak_s
" nmap <leader>F <Plug>Sneak_S
" " visual-mode
" xmap <leader>f <Plug>Sneak_s
" xmap <leader>F <Plug>Sneak_S
" " operator-pending-mode
" omap <leader>f <Plug>Sneak_s
" omap <leader>F <Plug>Sneak_S
"
" nmap f <Plug>Sneak_f
" nmap F <Plug>Sneak_F
" " visual-mode
" xmap f <Plug>Sneak_f
" xmap F <Plug>Sneak_F
" " operator-pending-mode
" omap f <Plug>Sneak_f
" omap F <Plug>Sneak_F

nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S
" visual-mode
xmap f <Plug>Sneak_s
xmap F <Plug>Sneak_S
" operator-pending-mode
omap f <Plug>Sneak_s
omap F <Plug>Sneak_S

" 1-character enhanced 't'
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
" visual-mode
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
" operator-pending-mode
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

augroup colsneak
  autocmd!
  autocmd ColorScheme * hi! link SneakScope Normal
  " autocmd ColorScheme * hi! Sneak guifg=green guibg=orange
  autocmd ColorScheme * hi! link Sneak Cursor
augroup END

hi! link Sneak Cursor



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
inoremap <C-j> <C-n>
" inoremap <C-k> <C-p>

" open suggestions
" imap <Tab> <C-P>

" filetype plugin on
" set omnifunc=syntaxcomplete#Complete
" TODO: above line testen
" insert mode <S-space> schliesst omni preview und fuegt space ein
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode


augroup cursleave
  autocmd!
  autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
  autocmd InsertLeave * if pumvisible() == 0|pclose|endif
augroup END


" ------------------------------------------------------


" Search and highlighting ---------------------------------
nnoremap / :set hlsearch<cr>:noh<cr>/\v
vnoremap / /\v
nnoremap <M-/> /

" Search visually selected text
vnoremap // y/<C-R>"<CR>

" Todo: aboth yanks the sel and pasts the register!
" nnoremap <leader>/ :Ab "\b<C-R><C-W>\b" .
" vnoremap <leader>/ "gy :Ag "<C-R>g" .
" nnoremap <leader>/ "gyw :Ag "<C-R>g" .


" HOW TO SEARCH summary:
" ve to select a word, then
" leader db/ to search in open buffers
" leader d/ to search in folder
" just // to search for that exact text! in the current buffer
"   then go to other buffer and hit leader n again to continue search!
" leader n to select the element uder the cursor - and then leader(shift) n

" Silver searcher
" --------------------------------------------------------------------------------
" vnoremap <leader>d/ "gy :Ag "<C-R>g" .
" nnoremap <leader>d/ "gyw :Ag "<C-R>g" .
" vnoremap <leader>db/ "gy :AgBuffer "<C-R>g"
" nnoremap <leader>db/ "gyw :AgBuffer "<C-R>g"
" :Ab "\b<C-R><C-W>\b" .

let g:ag_highlight=1


" --------------------------------------------------------------------------------
" nnoremap <silent> <leader>df :set nohlsearch<cr>
" nnoremap <silent> <leader><leader> :set nohlsearch<cr>
" nnoremap <silent> ,<space> :set nohlsearch<cr>
" other mapping?


" Search next:
" nnoremap <silent> <leader>n :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap <silent> ga :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap <silent> g- :set nohlsearch<cr>

nnoremap <silent> n n
nnoremap <silent> N N

" Important color/highlighy setting - sometimes gets overwritten
hi Search guibg=#3E3E3E guifg=#DDDDDD
hi Visual guibg=#3E3E3E gui=none


" The Silver Searcher
" nnoremap <leader>ab :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " let g:ctrlp_use_caching = 0
endif


nnoremap <leader>ccl :%y+<cr>:q!<cr>

" Color: ----------------------------------

" Hex Color editor vCooler.vim
let g:vcoolor_map = '<F7><F7>'
" nnoremap <F7><F7> :VCoolor<cr>

" Hex Color highlight - Colorizer Plugin
" nnoremap <leader><F7><F7> :ColorToggle<cr>
" nnoremap <leader><F7><F8> :ColorContrast<cr>
" nnoremap <leader><F7><F9> :ColorSwapFgBg<cr>


" Files Buffer:  --------------------------------------------

"  ----------------------------------------------------------
" NERDTree  --------------------------------------------------
let NERDTreeShowBookmarks = 0
" let g:NERDTreeMapMenu = 'Mm'".. not working!?

" nnoremap <leader>oo :NERDTreeFind<cr>
nnoremap go :NERDTreeFind<cr>

nnoremap <leader>q :NERDTreeClose<cr>
nnoremap <leader>oe :NERDTree-m<cr>
let NERDTreeQuitOnOpen=1

" Tips:
" use CC to reset tree to current dir
" use :vnew to create a new buffer in a vertical window-split
" use <c-w>< to resize the window


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
command! Spell   :set spell
command! SpellDE :set spelllang=de
command! SpellEN :set spelllang=en

" Change current working directory~
" Manually using |ProjectRootCD|: >
    " :ProjectRootCD


"
" With a mapping: >
" nnoremap <silent><leader>dpr  :ProjectRootCD<cr>
" nnoremap <expr><leader>dpr ":lcd " . projectroot#guess() . "\n"
nnoremap <expr>dpr ":lcd " . projectroot#guess() . "\n"

" expression mapping example:
" nnoremap <expr> GG ":echom ".screencol()."\n"
" nnoremap <silent> GG :echom screencol()<CR>

" set to current file path
nnoremap <leader>dcf :cd %:p:h<cr>:pwd<cr>
nnoremap <leader>dclf :lcd %:p:h<cr>:pwd<cr>
" nnoremap <c-g> :echo
" Automatically whenever you open a buffer: >

function! <SID>AutoProjectRootCD()
  try
    if &ft != 'help'
      ProjectRootCD
    endif
  catch
    " Silently ignore invalid buffers
  endtry
endfunction

" hmm, defaults to ~/ if no project is found .. TODO?
" autocmd BufEnter * call <SID>AutoProjectRootCD()

" controversion, but trying this out
" set path +=/**

autocmd BufEnter *.hs set syntax=purescript
" ----------------------------------------------------------------------------------

" if exists(":CompilerSet") != 2
"   command -nargs=* CompilerSet setlocal <args>
" endif
"
" let current_compiler = "typescript"
" CompilerSet makeprg=tsc\ $*\ --outDir\ build\ %
" CompilerSet errorformat=%+A\ %#%f\ %#(%l\\\,%c):\ %m,%C%m



"  ----------------------------------------------------------


"  ----------------------------------------------------------
" CTRLP  --------------------------------------------------
"
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:40,results:20'

let g:ctrlp_root_markers = ['src/', 'project.clj']

" Use the nearest .git directory as the cwd
let g:ctrlp_working_path_mode = 'r'


" let g:ctrlp_extensions = ['dir', 'undo', 'line', 'changes']
" let g:ctrlp_extensions = ['dir', 'line']

" nmap <leader>o :CtrlP<cr>

nmap <leader>oi :CtrlP<cr>
nmap <leader>ou :CtrlPBuffer<cr>
nmap du :CtrlPBuffer<cr>
nmap <leader>oj :CtrlPMRU<cr>
nmap <leader>oh :CtrlPMixed<cr>

" CTRLP  --------------------------------------------------
"  ----------------------------------------------------------


" Buffers -----------------------------------------

" Toggle last buffers
nnoremap <leader>6 <c-^>

" next prev buffer
nnoremap <silent> <leader>h :bp<cr>
nnoremap <silent> <leader>j :bn<cr>
nnoremap <silent> <c-d> :bp<cr>
nnoremap <silent> <c-f> :bn<cr>
" This is also in after/plugin folder!

" Close buffer!
" nnoremap <M-c> :bd<cr>
" nnoremap <M-C> :bd!<cr>
" free mapping
" <c-u> !
" nnoremap <leader>x :bd<cr>
" nnoremap <leader>x :b#\|bd #<cr>
" nnoremap <leader>lj :bd<cr>
" nnoremap <silent><leader>x :bd!<cr>
" nnoremap gx :bd!<cr>
" " Note: this overwites NetrwBrowseX

" Prevent closing a window when closing a buffer
nnoremap gx :bp<bar>sp<bar>bn<bar>bd!<CR>

" Mac needs these characters ç Ç for option key mappings
" nnoremap ç :bd<cr>
" nnoremap Ç :bd!<cr>


" Scrolling ------------------------
nnoremap <c-y> <c-y><c-y>
nnoremap <c-e> <c-e><c-e>

nnoremap <C-j> jjj
nnoremap <C-k> kkk
vnoremap <C-j> jjj
vnoremap <C-k> kkk

" nnoremap <C-H> {{j
" nnoremap <C-L> }}{j

nnoremap zh 7zh
nnoremap zl 7zl


" Show syntax highlighting groups for word under cursor
nmap <F4> :call <SID>SynStack()<CR>
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
nmap de die"_dl



" Diffing --------------------------------------------------------
nnoremap <silent> <F5><F5> :call DiffToggle()<CR>
function! DiffToggle()
    if &diff
        diffoff
    else
        diffthis
    endif
:endfunction

vmap <leader>di :Linediff<cr>
nmap <leader>dr :LinediffReset<cr>



fun! OpenITerm()
    let path = projectroot#guess()
    exec 'silent !open -a iTerm ' . path
endfun
" this works: :silent !open -a iTerm Documents/purescript


fun! GoogleSearchStr()
    let keyw = expand("<cword>")
    let url = 'http://www.google.de\#q\=' . keyw
    return url
endfun


" ----------------------------------------------------------------------------------
"  Launching external apps
command! ITerm :call OpenITerm()
nmap gli :call OpenITerm()<cr>

command! Finder :call OpenFinder()
nmap glf :call OpenFinder()<cr>

command! Browser :call OpenCurrentFileInSystemEditor()
nmap gle :call OpenCurrentFileInSystemEditor()<cr>
" Tip: alternatively just ":!open $"!
" ----------------------------------------------------------------------------------

nmap <silent> glt :20Term<cr>

" Terminal util functions
source /Users/andreas.thoelke/.vim/utils/termin1.vim



" --- Tagbar ----
" nmap gkl :TagbarOpen j<cr>
nmap <leader>to :TagbarOpen j<cr>
nmap to :TagbarOpen j<cr>
nmap <leader>th :TagbarClose<cr>

" nmap <silent> <c-h> gklk<cr>
" nmap <silent> <c-l> gklj<cr>
" --- Tagbar ----


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


" --- quickfix & loclist ----
" let g:lt_location_list_toggle_map = 'gll'
" let g:lt_location_list_toggle_map = '<leader>ll'
" let g:lt_quickfix_list_toggle_map = 'gqq'
" let g:lt_quickfix_list_toggle_map = '<leader>qq'
" let g:lt_quickfix_list_toggle_map = '<leader>gq'

nmap <leader>ll :lopen<cr>:Wrap<cr>
nmap <leader>qq :copen<cr>:Wrap<cr>

nmap <leader>oq :CtrlPQuickfix<cr>
" --- quickfix & loclist ----

nmap <leader>go :Goyo<cr>
nmap <leader>gs :Gstatus<cr>


nmap <silent> gsg :call GoogleSearch("word")<cr>
vmap <silent> gsg :call GoogleSearch("visSel")<cr>

nmap <silent> gsh :call DocsForCursorWord()<cr>
vmap <silent> gsh :call DocsForVisSel()<cr>
nmap <silent> gsd :call HoogleForCursorWord()<cr>
vmap <silent> gsd :call HoogleForVisSel()<cr>

nmap <silent> gsi :call GithubSearch("word")<cr>
vmap <silent> gsi :call GithubSearch("visSel")<cr>

nmap <silent> gsf :call GrepSearch("word", "file")<cr>
vmap <silent> gsf :call GrepSearch("visSel", "file")<cr>
nmap <silent> gsb :call GrepSearch("word", "buffers")<cr>
vmap <silent> gsb :call GrepSearch("visSel", "buffers")<cr>

command! -nargs=1 Find  :Grepper -side -query <args>
command! -nargs=1 Findb :Grepper -side -buffers -query <args>

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

fun! OpenFinder()
  exec 'silent !open .'
endfun

fun! OpenCurrentFileInSystemEditor()
  exec 'silent !open %'
endfun


runtime plugin/grepper.vim    " initialize g:grepper with default values
let g:grepper.stop = 20


fun! GrepSearch(selType, mode)
    if a:selType == "word"
      let keyw = expand("<cword>")
    else
      let keyw = Get_visual_selection()
    endif

    if a:mode == "buffers"
      exec 'Grepper -side -buffers -query "' . keyw . '"'
    else
      exec 'Grepper -side -query "' . keyw . '"'
    endif
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
    exec 'silent! s/\%V→/->'
    exec 'silent! s/\%V∷/::'
    exec 'silent! s/\%V⇒/=>'
    let keyw = Get_visual_selection()
    " exec 'silent! s/\%V->/→'
    " exec 'silent! s/\%V::/∷'
    " exec 'silent! s/\%V=>/⇒'
    " use undo instead to prevent adding this to the undo list!
    exec 'u'
    let comm = 'silent Hoogle ' . keyw
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

nnoremap <leader>>> :call IndentToCursorH()<CR>
" TODO: maybe make a mapping "dwkwj<leader>>>" to indent haskell binds:
  " jsonValue ∷ Value
  "           ← decode (T.encodeUtf8 jsonTxt) ?? "Not a valid json!"
"
function! IndentToCursorH()
  exec ("left " . (virtcol('.') - 1)) 
  " exec ("left " . col('.')) 
endfun

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
" how quickly tagbar (and vim in general!) refreshes (from file?)
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


" ------- Formatting Imports ----------------------------------
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
" ------- Formatting Imports ----------------------------------


" To narrow down the issue, run Vim with a minimal configuration: >
"     vim -u NORC -N +"let g:sneak#label=1" +":set runtimepath+=~/.vim/bundle/vim-sneak/" +":runtime plugin/sneak.vim"
"
" or Nvim: >
"     nvim -u NORC +"let g:sneak#label=1" +":set runtimepath+=~/.local/share/nvim/bundle/vim-sneak/" +":runtime plugin/sneak.vim"


