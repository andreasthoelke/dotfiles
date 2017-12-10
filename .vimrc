" purescript requires?
" syntax on
" filetype off
filetype plugin indent on

" vim-plug:
call plug#begin('~/.vim/plugged')

" File manager
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'

Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" fullscreen mode
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Plug 'bling/vim-bufferline'

Plug 'Valloric/ListToggle' 
Plug 'kshenoy/vim-signature'
Plug 'mattn/ctrlp-mark'
Plug 'airblade/vim-gitgutter'

Plug 'AndrewRadev/linediff.vim'

" Vim session & shell
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
" Restore folding
Plug 'vim-scripts/restore_view.vim'
" Plug 'Twinside/vim-haskellFold'
Plug 'https://github.com/dbakker/vim-projectroot' 
" Plug 'xolox/vim-shell'
" iTerm2 integration
Plug 'sjl/vitality.vim'

Plug 'tomasr/molokai'

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

Plug 'eagletmt/ghcmod-vim', {'for': 'haskell'}
" Plug 'eagletmt/ghcmod-vim'

Plug 'Shougo/vimproc.vim', {'do': 'make'}

" Plug 'eagletmt/neco-ghc'
" Plug 'bitc/vim-hdevtools'
" crashes vim on :HdevtoolsType command
"
Plug 'dan-t/vim-hsimport' 

Plug 'neovimhaskell/haskell-vim'
" Plug 'alx741/vim-hindent'

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



" ---- Color ----
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


" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t:r'
let g:airline_theme='simple'


" ------- Vim-session settings ---------
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
" let g:session_default_overwrite = 1
set sessionoptions+=folds
set sessionoptions-=help
set sessionoptions-=options
set sessionoptions-=blank
let g:session_persist_font = 0
let g:session_persist_colors = 0

set undofile
" set noundofile
" set undodir="~/vimfiles/undo/" 
set undodir=~/vimtmp/undo,.

" set nobackup
" set nowritebackup

" Restore view settings
set viewoptions=cursor,folds
" set viewdir=$HOME/.vim_view//
set viewdir=~/vimtmp/view//
" au BufWritePost,BufLeave,WinLeave ?* mkview
" au BufWritePost ?* mkview
" au BufWinEnter ?* silent loadview

" Load locked session after a vim crash
command! SessionLoadLocked OpenSession!

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
set shada=",'10,f1,<10,h
" only save marks of 10 files, save global marks and only 10 lines in registers
" see: *21.3*	Remembering information; ShaDa

" set shada="!,'100,<50,s10,h,f0"
" f0 disables global marks
" uncomment this line to ignore marks on load! (Markers, Marks persisting)
" TODO: as there is a bug that causes that marks can't be deleted, one could just
" delete the shada file to delete the marks
" ------- Shared Data persistence ---------


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
set autoindent
set smartindent
set fileencoding=utf-8
set encoding=utf-8
" set backspace=indent,eol,start

set ts=2 sts=2 sw=2 expandtab

set smartcase

set gdefault
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

" Various mappings ----------------------------------------------

" NEOVIM TERMINAL MODE
if has('nvim')
  tnoremap jk <C-\><C-n>

  " jump window up from terminal mode
  tnoremap <c-w>k <C-\><C-n><c-w>k
  tnoremap <c-\>x <C-\><C-n>:bw!<cr>
  tnoremap <c-w>c <C-\><C-n>:bw!<cr>
  " TODO: or just hide the buffer/close the window?
  nnoremap <c-\>x <C-\><C-n>:bw!<cr>
endif

command! Restart call jobsend( b:terminal_job_id, "\<C-c>npm run server\<CR>")


" windows should not be kept at equal size
set noequalalways


let mapleader=" "
" let maplocalleader="\\"

inoremap jk <esc>
vnoremap <leader><leader> <esc>

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
nnoremap cuf :%s/forall/<c-k>FA/e<cr>
nnoremap cuc :%s/::/<c-k>::/e<cr>
nnoremap cua :%s/->/<c-k>->/e<cr>
nnoremap cub :%s/<-/<c-k><-/e<cr>
nnoremap cud :%s/=>/<c-k>=>/e<cr>
vnoremap <leader>bu :s/\%V→/-><cr>:s/\%V∷/::<cr>:s/\%V⇒/=><cr>
vnoremap <leader>bi :s/\%V->/→<cr>:s/\%V::/∷<cr>:s/\%V=>/⇒<cr>

" Alternative for bind? ⤜ or »= or >>= or ≥ 


" nnoremap cue :%s/<=/<c-k><=/e<cr>
" TODO: could do the reverse replacement to revert back to non-unicode
" also: what to do with 'greater-than-or-qual'?

" Replace all purescript unicode characters
noremap <leader>cu :call PurescriptUnicode()<cr>
fun! PurescriptUnicode()
  normal cufcuccuacubcudcue 
endfun


" move in haskell function signature ---------------------------------------------
nnoremap <silent> - :call FindArrow()<cr>w
fun! FindArrow()
  exec "silent normal! /→\\|⇒\\|∷\<cr>"
endfun

nnoremap <silent> _ :call FindArrowB()<cr>w
fun! FindArrowB()
  exec "silent normal! ?→\\|⇒\\|∷\<cr>"
endfun


" move to next paragraph/fn ------------------------------------------------------
nnoremap <silent> <c-l> :call ParagNext()<cr>
vnoremap <silent> <c-l> }
nnoremap <silent> ) :call ParagNext()<cr>
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
nnoremap <silent> ( :call ParagPrev()<cr>
fun! ParagPrev()
  let startLineNum = line('.')
  exec "silent normal! {w"
  if line('.') == startLineNum
    exec "silent normal! {{w"
  endif
endfun
" --------------------------------------------------------------------------------


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
let @o = 'f Jki-- jk9jj'
" align the type-signature with EasyAlign
let @p = 'gaap '


fun! Hsimp(module, symbol)
  call hsimport#imp_symbol(a:module, a:symbol)
endfun

noremap <leader>ci :call StylishHaskell()<cr>

setlocal formatprg=stylish-haskell
" use <motion>gq
" .. but not working properly, e.g. messing up line breaks

" free mapping: <c-g> - currently show the current filename


" ------- General --------------------------------------------------------------
" save!
nnoremap <leader>w :w!<cr>
nnoremap gw :w!<cr>
" nnoremap <silent><leader>w :up<cr>


" EDIT VIM SCRIPT ---------------------------------------------------------------------
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


" EDIT VIM SCRIPT ---------------------------------------------------------------------


" paste the current file path
nnoremap <leader>sf i<c-r>=expand("%:p")<cr><esc>^
" free mapping?

nnoremap <leader>cab :e *.cabal<cr>

" nnoremap <leader>zsh :e ~/.zshrc<cr>
command! Zshrc   :e ~/.zshrc
command! ZshOhMy :e ~/.oh-my-zsh/oh-my-zsh.sh
command! Vimrc   :e ~/.vimrc
command! Cabal   :e *.cabal

" Insert the $PATH shell variable
command! Path :normal i<c-r>=system("echo $PATH | tr ':' '\n'")<esc>


let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

let &t_SI = "\<Esc>]50;CursorShape=0\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set termguicolors
set guicursor=n:block-iCursor-blinkwait300-blinkon200-blinkoff150

" ------- General --------------------------------------------------------------

" let g:psc_ide_log_level = 3



" --------------------------------------------------------------------------------
" PURESCRIPT

" nmap <leader>xn :<C-U>call PSCIDEtype(PSCIDEgetKeyword(), v:true)<CR>
" nmap <leader>xn :<C-U>call PSCIDEaddTypeAnnotation(matchstr(getline(line(".")), '^\s*\zs\k\+\ze'))<CR>
" nm <buffer> <silent> <leader>s :<C-U>call PSCIDEapplySuggestion()<CR>
" nm <buffer> <silent> <leader>a :<C-U>call PSCIDEaddTypeAnnotation()<CR>
" nm <buffer> <silent> <leader>i :<C-U>call PSCIDEimportIdentifier(PSCIDEgetKeyword())<CR>
" nm <buffer> <silent> <leader>r :<C-U>call PSCIDEload()<CR>
" -- nm <buffer> <silent> <leader>gsd :<C-U>call PSCIDEpursuit(PSCIDEgetKeyword())<CR>
" nm <buffer> <silent> <leader>C :<C-U>call PSCIDEcaseSplit("!")<CR>
" nm <buffer> <silent> <leader>f :<C-U>call PSCIDEaddClause("")<CR>
" nm <buffer> <silent> <leader>qa :<C-U>call PSCIDEaddImportQualifications()<CR>
" nm <buffer> <silent> ]d :<C-U>call PSCIDEgoToDefinition("", PSCIDEgetKeyword())<CR>


" command! Reset :PSCIDEend
" nnoremap <Leader>st :PSCIDEtype<CR>
" " nnoremap <Leader>at :PSCIDEaddTypeAnnotation<CR>:call PurescriptUnicode()<cr>
" nnoremap <Leader>at :PSCIDEaddTypeAnnotation<CR>:call PurescriptUnicode()<cr>h
" " nnoremap tw :PSCIDEaddTypeAnnotation<CR>:call PurescriptUnicode()<cr>h
" nnoremap tr :PSCIDEend<cr>
" nnoremap <Leader>sii :PSCIDEimportIdentifier<CR>
" nnoremap <Leader>sai :PSCIDEaddImportQualifications<CR>
" nnoremap <Leader>sri :PSCIDEremoveImportQualifications<CR>
" nnoremap <Leader>sas :PSCIDEapplySuggestion<CR>
" " nnoremap <Leader>sgd :PSCIDEgoToDefinition<CR>
" " nnoremap <Leader>gd :PSCIDEgoToDefinition<CR>
" " function template
" nnoremap <Leader>sac :PSCIDEaddClause<CR>
" nnoremap <Leader>sp :PSCIDEpursuit<CR>
" nnoremap doo :PSCIDEpursuit<CR>
" nnoremap <Leader>scw :PSCIDEcwd<CR>
" nnoremap <Leader>sli :PSCIDElist<CR>
" nnoremap <Leader>slo :PSCIDEload<CR>

" --------------------------------------------------------------------------------

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


" Vim Slime → Tmux
let g:slime_target = "tmux"


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



function! SlimeType()
    let keyw = expand("<cword>")
    let callString = ':t ' . keyw 
    exec 'SlimeSend1 ' . callString 
endfun

function! SlimeTypeVisSel()
    let keyw = Get_visual_selection() 
    " let enckw = UrlEncode(keyw)
    let callString = ':t ' . keyw 
    exec 'SlimeSend1 ' . callString 
endfun

function! ReplComLine()
    let lineList = split( getline( line(".") ) )
    let fnCallString = ListToHsFnCall(lineList[1:]) 
    if IsPurs()
      exec 'SlimeSend1 ' . fnCallString 
    else
      exec 'InteroSend ' . fnCallString
    endif
endfun

function! ReplComLineInsert()
    let l:lineList = split( getline( line(".") ) )

    if or(l:lineList[1] == '=', l:lineList[1] == '∷')
    " JUST A PLAIN SYMBOL UNDER THE CURSOR ---------------------------------------
      if IsPurs()
        call PursEval( expand('<cword>') )
      else
        call InsertEvalRes()
      endif
      return
      " stops here. TODO: refactor

    elseif l:lineList[0] == '--'
      " A COMMENTED LINE ---------------------------------------------------------
      let l:fnCallString = ListToHsFnCall(l:lineList[1:]) 
      if has('nvim')
        if IsPurs()
          call PursEval( l:fnCallString )
        else
          call InsertEvalExpressionRes(l:fnCallString)
        endif
      else
        exec 'SlimeSend1 ' . l:fnCallString 
      endif

    else
    " USE THE WHOLE/PLAIN EXPRESSION! --------------------------------------------
      if IsPurs()
        call PursEval( ListToHsFnCall(l:lineList) )
      else
        " TODO
      endif
      return
    endif
endfun

" TODO: Intero has these custom functions:
" InsertInstType
" InsertGenType
" InsertEvalRes
" InsertEvalExpressionRes
" TODO: make proper API

function! TraceComLine()
    let lineList = split( getline( line(".") ) )
    let fnCallString = ListToHsFnCall(lineList[1:]) 

    let functionName = get( split( getline( line(".") - 1 ) ), 0 )

    exec 'SlimeSend1 trace $ ' . functionName . '' . fnCallString 
endfun

function! ListToHsFnCall(stlist)
  let l:fncall = ""

  for nextItem in a:stlist
    let l:fncall = l:fncall . " " . nextItem
  endfor
  return l:fncall
  " echo fncall
endfun

function! ReplVisSel()
    let l:visSel = Get_visual_selection()
    " exec 'SlimeSend1 ' . visSel
    exec 'InteroSend ' . l:visSel
endfun

function! Tester1()
    let l:visSel = getline
    exec 'SlimeSend1 ' . l:visSel
    " echo visSel
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


function! TraceTopLevelValue()
    let functionName = get( split( getline( line(".") ) ), 0 )
    if functionName == "--"
      call TraceComLine()
    else
      exec 'SlimeSend1 trace ' . functionName
    endif
endfun

function! ReplTopFnRLInsert()
    " ?? TODO: drop this
    call InsertEvalRes()
endfun


function! ReplTopFnRL()
    call ReplReload()
    let functionName = get( split( getline( line(".") ) ), 0 )
    " exec 'SlimeSend1 ' . functionName
    " exec 'InteroSend ' . functionName
    " if has('nvim')
    if IsPurs()
      exec 'SlimeSend1 ' . functionName 
      " call Prebuild()
    else
      exec 'InteroSend ' . functionName
    endif
endfun

" nmap <leader>ih :SlimeSend1 import Helpers<cr>
" nmap <leader>ip :SlimeSend1 import Prelude<cr>

function! ReplReload()
    let modulename = GetModuleName() 
    exec ':up'
    if IsPurs()
      exec ':Prebuild'
      call PursEval(':r')
      call PursEval('import ' . modulename)
      call PursEval('import Helpers')
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
    call PurescriptUnicode()
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

function! PsciEval()
    let functionName = get( split( getline( line(".") ) ), 0 )
    let modulename = GetModuleName() 
    " exec ':w'
    " writing the buffer here will crash vim 
    exec 'SlimeSend1 :r'

    if IsPurs()
      exec 'SlimeSend1 import ' . modulename
    else
      exec 'SlimeSend1 :l ' . modulename
    endif

    exec 'SlimeSend1 ' . functionName
endfun
" --------------------------------------------------------------------------------
" HASKELL


" ------- ALE ------- 
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

let g:airline#extensions#ale#enabled = 0
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


" ------- ALE ------- 

" ------- SYNTASIC ------- 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
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

" turn off initially
" ------- SYNTASIC ------- 

" ------- Neomake ------- 
" Neomake does the same as Ale
" While Hlint (and stack-ghc-mod?) uses Ale for signs in the signcolumn, 
" Intero uses Neomake to show error and ghc warnings
hi NeomakeErrorSign   ctermfg=white
hi NeomakeWarningSign ctermfg=white
hi NeomakeIntoSign    ctermfg=white
hi NeomakeMessageSign ctermfg=white

command! SignsClear :sign unplace *
" Neomake defaults
" let g:neomake_error_sign = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
" let g:neomake_warning_sign = {
"    \   'text': '⚠',
"    \   'texthl': 'NeomakeWarningSign',
"    \ }
" let g:neomake_message_sign = {
"     \   'text': '➤',
"     \   'texthl': 'NeomakeMessageSign',
"     \ }
" let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}
" ------- Neomake ------- 


" Hdevtools is not yet needed, using Intero instead
" currently it crashes vim on :HdevtoolsType command
" set shell=bash\ -i
" let g:hdevtools_options = '-g-fdefer-type-errors -g-isrc -g-Wall'
" let g:syntastic_haskell_hdevtools_args = g:hdevtools_options

" --- GitGutter --- 
nmap <leader>gg :GitGutterToggle<cr>

nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
" default! 'hunk' vs. 'change'
nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk

" stage the hunk with <Leader>hs or
" undo it with <Leader>hu.
"
" nmap <Leader>ha <Plug>GitGutterStageHunk
" nmap <Leader>hr <Plug>GitGutterUndoHunk
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_enabled = 0
nmap <silent> ]c :call NextHunkAllBuffers()<CR>
nmap <silent> [c :call PrevHunkAllBuffers()<CR>
" --- GitGutter --- 



" Maps for intero. 
" nnoremap <silent> <leader>is :InteroStart<CR>
" nnoremap <silent> <leader>isc :SignsClear<CR>
nnoremap <silent> <leader>ik :InteroKill<CR>
nnoremap <silent> <leader>io :InteroOpen<CR>
nnoremap <silent> <leader>ih :InteroHide<CR>
nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
nnoremap <silent>         gd :InteroGoToDef<CR>

" Type inserts
nnoremap tt :InteroInstTypeInsert<cr>
vnoremap tt :InteroInstTypeInsert<cr>
nnoremap tg :InteroGenTypeInsert<cr>
vnoremap tg :InteroGenTypeInsert<cr>
nnoremap ti :InteroInfoInsert<cr>
vnoremap ti :InteroInfoInsert<cr>

nnoremap gel :call InsertEvalRes()<cr>
nnoremap gei :call ReplComLineInsert()<cr>

" TODO: this doesn't work with ranges/vis-selection
" vnoremap tat :call InsertInstType()<cr>
" vnoremap tag :call InsertGenType()<cr>
" should work like in GHCi:
" Prelude Control.Monad.Except> :t ExceptT . fmap Right
" ExceptT . fmap Right :: Functor m => m a -> ExceptT e m a

" nnoremap tw :call InsertTypeAnnotation()<cr>jh
nnoremap <silent> tw :call InsertTypeAnnotation()<cr>
" nnoremap ti :call ImportIdentifier()<cr>

" nnoremap tt :call SlimeType()<cr>
" vnoremap tt :call SlimeTypeVisSel()<cr>

" just for testing - not sure when this might be useful
nmap <leader>dhi :echo intero#util#get_haskell_identifier()<cr>


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


" ghc-mod
" map <silent> tw :w<CR>:GhcModTypeInsert<CR>:call PurescriptUnicode()<cr>h
" TODO: activate this together with purescript!

" map <silent> ts :GhcModSplitFunCase<CR>
" map <silent> tq :w<CR>:GhcModType<CR>
" map <silent> te :GhcModTypeClear<CR>
"
" map <silent> ty :w<CR>:GhcModCheck<CR>
" map <silent> tu :w<CR>:GhcModLint<CR>


" Reload
" map <silent> tu :call GHC_BrowseAll()<CR>
" " Type Lookup
" map <silent> ty :call GHC_ShowType(1)<CR>


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

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:easy_align_ignore_groups = ['Comment', 'String'] 


" Insert line comment
nmap <leader>mll i----------------------------------------------------------------------------------<esc>^
" Fill line with dashes 
nnoremap <leader>mlk $a<space><esc>82a-<esc>d82<bar>^



" ---- Window control ----
" nnoremap dc <c-w>c 
" close the win below
nnoremap <c-w>d <c-w>j<c-w>c 
nnoremap <c-w>- 7<c-w>-
nnoremap <c-w>+ 7<c-w>+
nnoremap <c-w>a 7<c-w>+
nnoremap <c-w>> 4<c-w>>
nnoremap <c-w>< 4<c-w><
" ---- Window control ----


" LINE-NAVIGATION SUMMARY:
"
" insert: alt - k: delete line up
" inoremap <m-k> <esc>kJi

" Move to beginning and end of line + related operations
" nmap 9 ^
" omap 9 ^
" vmap 9 ^
" nmap y9 y^
" nmap d9 d^
" nmap c9 c^

" nmap 0 g_
" omap 0 g_
" vmap 0 g_

" ------------------------------------------------------
" Paste and delete -------------------------------------

" Paste from the yank register
nmap <leader>p "0p
nnoremap <leader>P "0P

" Paste and copy System clipboard
nmap <leader><c-p> "+P

" nnoremap <leader>vv "+P
nnoremap <leader>vv "+P:call PurescriptUnicode()<cr>h

" copy fomr clipboard
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

fun! SomeTest1( ar1 )
  return "Some arg: " . a:ar1
endfun

" echo &ft
" TIP: return filetype as literal string, e.g. 'haskell', instead of 'hs'
" TIP: create a directory: `:! mkdir src/modules`
" TIP: get the string/spaces of how much a line is indented: let indent = matchstr(getline(lnr), '^\s*\ze')
" past last command: ":p
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
"
" SHELL, E-MACS MAPPINGS
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
" forward-word (M-f)
" Move forward to the end of the next word. Words are composed of letters and digits.
"
" backward-word (M-b)
" Move back to the start of the current or previous word. Words are composed of letters and digits.
"
" shell-forward-word ()
" Move forward to the end of the next word. Words are delimited by non-quoted shell metacharacters.
"
" shell-backward-word ()
" Move back to the start of the current or previous word. Words are delimited by non-quoted shell metacharacters.
"
" clear-screen (C-l)
" Clear the screen and redraw the current line, leaving the current line at the top of the screen.
"
" redraw-current-line ()
" Refresh the current line. By default, this is unbound.
"
" TEST FUNCTIONS: ----------------------------------------------------------------
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
nmap <leader>if ea09jea0^k

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

" -------------------------------------------------------------------------------- 



" Replace ---------------------------------------------
" nmap <leader>re "_die"0P`[
" nmap <leader>re ve"0pb
" nmap <leader>re "_die"0Pb
" nmap <leader>rf "_daf"0PB

" Replace inner word
nmap <leader>rw "_diw"0Pb
nmap yrw "_diw"0Pb
" Register, black hole, delete, inner word, paste from yank register, go to beginning

" Replace words
" nmap <leader>rw "_diw"0Pb
" nmap <leader>rW "_diW"0PB
" beginning of pasted text.

" Replace rest of the line
nmap <leader>r0 "_d$"0p`[

" Make deleting to black hole register easier!
nnoremap D "_d




" ------- Folding --------
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
" ------- Folding --------

" Comment line or selection
" nmap <leader>gf gcc
nmap <leader>ge gcc
nmap dc gc
vmap ac gc

" comment form
nmap coaf gcaf
nmap coo :call CommentToggle()<CR>
vmap <leader>ge gc




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

nmap <leader>f <Plug>Sneak_s
nmap <leader>F <Plug>Sneak_S
" visual-mode
xmap <leader>f <Plug>Sneak_s
xmap <leader>F <Plug>Sneak_S
" operator-pending-mode
omap <leader>f <Plug>Sneak_s
omap <leader>F <Plug>Sneak_S

nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
" visual-mode
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
" operator-pending-mode
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

" 1-character enhanced 't'
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
" visual-mode
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
" operator-pending-mode
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T


autocmd ColorScheme * hi! link SneakScope Normal
" autocmd ColorScheme * hi! Sneak guifg=green guibg=orange
autocmd ColorScheme * hi! link Sneak Cursor

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
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

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
nnoremap <silent> <leader><leader> :set nohlsearch<cr>

nnoremap <silent> n n
nnoremap <silent> N N

" Search next: 
nnoremap <silent> <leader>n :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

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



" Color features ----------------------------------

" Hex Color editor vCooler.vim
let g:vcoolor_map = '<F7><F7>'
" nnoremap <F7><F7> :VCoolor<cr>

" Hex Color highlight - Colorizer Plugin
nnoremap <leader><F7><F7> :ColorToggle<cr>
nnoremap <leader><F7><F8> :ColorContrast<cr>
nnoremap <leader><F7><F9> :ColorSwapFgBg<cr>


" Files and buffer  --------------------------------------------

"  ----------------------------------------------------------
" NERDTree  --------------------------------------------------
let NERDTreeShowBookmarks = 1
" let g:NERDTreeMapMenu = 'Mm'".. not working!?

nnoremap <leader>oo :NERDTreeFind<cr>
nnoremap go :NERDTreeFind<cr>

nnoremap <leader>q :NERDTreeClose<cr>
nnoremap <leader>oe :NERDTree-m<cr>
let NERDTreeQuitOnOpen=1

" Tips:
" use CC to reset tree to current dir
" use :vnew to create a new buffer in a vertical window-split
" use <c-w>< to resize the window


"  --- Project Root --------------------------------------------
"
" open file relative to project-root
nnoremap <expr> <leader>ep ':e '.projectroot#guess().'/'

" remove/delete a file relative to project-root
nnoremap <expr> <leader>df ':!rm '.projectroot#guess().'/'

command! DelFile :call delete(expand('%')) | bdelete! 

" Change current working directory~
" Manually using |ProjectRootCD|: >
    " :ProjectRootCD

" With a mapping: >
nnoremap <silent><leader>dp :ProjectRootCD<cr>

" set to current file path
nnoremap <leader>dcf :cd %:p:h<cr>:pwd<cr>
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
nnoremap <silent><leader>tt <c-^>

" next prev buffer
nnoremap <silent> <leader>h :bp<cr>
nnoremap <silent> <leader>j :bn<cr>
nnoremap <silent> <c-d> :bp<cr>
nnoremap <silent> <c-f> :bn<cr>
" This is also in after/plugin folder!

" Close buffer!
" nnoremap <M-c> :bd<cr>
" nnoremap <M-C> :bd!<cr>
" nnoremap <leader>x :bd<cr>
nnoremap <leader>x :b#\|bd #<cr>
nnoremap <leader>lj :bd<cr>
nnoremap <leader>X :bd!<cr>
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



" nmap <leader>op :call OpenUrlUnderCursor()<CR>
" vmap <leader>op :call OpenSelectedUrl()<CR>

vnoremap <leader>op "gy:call OpenSelectedUrl()<CR>


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
" ----------------------------------------------------------------------------------

nmap <silent> glt :20Term<cr>

" Terminal util functions
source /Users/andreas.thoelke/.vim/utils/termin1.vim



" --- Tagbar ----
nmap gkl :TagbarOpen j<cr>
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
let g:limelight_paragraph_span = 1
let g:limelight_default_coefficient = 0.8

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" ---- GOYO - LIMELIGHT -----------------------------------------------------------------------


" --- quickfix & loclist ----
" let g:lt_location_list_toggle_map = 'gll'
let g:lt_location_list_toggle_map = '<leader>ll'
" let g:lt_quickfix_list_toggle_map = 'gqq'
let g:lt_quickfix_list_toggle_map = '<leader>qq'
" let g:lt_quickfix_list_toggle_map = '<leader>gq'

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
      let url = 'https://www.haskell.org\/hoogle\/\?hoogle\=' . keyw 
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
      let url = 'https://www.haskell.org\/hoogle\/\?hoogle\=' . enckw 
    endif
    let comm = 'silent !open ' . url
    exec comm
endfun

fun! HoogleForCursorWord()
    let g:originFile = expand('%')
    if IsPurs()
      call PSCIDEpursuit(PSCIDEgetKeyword())
    else
      let keyw = expand("<cword>")
      let comm = 'silent Hoogle ' . keyw
      exec comm
      exec 'w!'
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
    exec 'w!'
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

fun! Docsh(searchSt)
    let enckw = UrlEncode(a:searchSt)
    " let url = 'https://www.stackage.org\/lts-8\.22\/hoogle\?q\=' . enckw
    let url = 'https://www.haskell.org\/hoogle\/\?hoogle\=' . enckw 
    let comm = 'silent !open ' . url
    exec comm
endfun


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
set updatetime=500
let g:tagbar_sort = 0

" set tags=tags;/,codex.tags;/

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

