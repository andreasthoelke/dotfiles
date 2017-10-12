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

" Plug 'xolox/vim-shell'
" iTerm2 integration
Plug 'sjl/vitality.vim'

Plug 'tomasr/molokai'

" General
Plug 'guns/vim-clojure-static'

" Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'

" Code navigation
" Plug 'justinmk/vim-sneak'
Plug 'romgrk/vim-sneak', { 'branch': 'use-matchadd' }

" Code utils
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-easy-align'
Plug 'venantius/vim-cljfmt'
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

" Plug 'Shougo/neocomplete.vim', {'for': 'haskell'}
Plug 'Shougo/neocomplete.vim'

" Plug 'eagletmt/neco-ghc', {'for': 'haskell'}
" Plug 'eagletmt/neco-ghc'

" Plug 'bitc/vim-hdevtools', {'for': 'haskell'}
Plug 'bitc/vim-hdevtools'

" Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}
Plug 'neovimhaskell/haskell-vim'
" Plug 'alx741/vim-hindent'

Plug 'kana/vim-textobj-user'
Plug 'gilligan/vim-textobj-haskell'
" requires python

Plug 'jaspervdj/stylish-haskell'
Plug 'w0rp/ale'

Plug 'neomake/neomake'
Plug 'parsonsmatt/intero-neovim'

" Plug 'Valloric/YouCompleteMe'
" Plug 'garbas/vim-snipmate'
Plug 'ervandew/supertab'
Plug 'mhinz/vim-grepper'

Plug 'majutsushi/tagbar'
" there is a Haskell integration, but it does not work :Tag.. not.. 


call plug#end()


" set omnifunc=syntaxcomplete#Complete


let $PATH .= (":" . $HOME . "/.cabal/bin")
let $PATH .= (":" . "/Users/andreas.thoelke/.local/bin")

" let g:python2_host_prog = '/usr/local/bin/python'
let g:python2_host_prog = '/Users/andreas.thoelke/Library/Python/2.7' 
let g:python3_host_prog = '/usr/local/bin/python3'


" uncomment this to disable Python support
" let g:loaded_python_provider = 1
" let g:loaded_python3_provider = 1

" /Users/andreas.thoelke/.vim/plugged/vim-textobj-haskell/python/haskell-textobj.py
let abj = '~/.vim/plugged/vim-textobj-haskell/python/haskell-textobj.py'



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


" Plugin settings

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t:r'
let g:airline_theme='simple'

" set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %{noscrollbar#statusline()}

" Vim-session settings
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
set sessionoptions+=folds
set sessionoptions-=help
set sessionoptions-=options
set sessionoptions-=blank
let g:session_persist_font = 0
let g:session_persist_colors = 0


" define what is saved/restored from ~/.local/share/nvim/shada/main.shada 
set shada="!,'100,<50,s10,h,f0"

" Restore view settings
" set viewoptions=cursor,folds
" set viewdir=$HOME/.vim_view//
" au BufWritePost,BufLeave,WinLeave ?* mkview
" au BufWinEnter ?* silent loadview

" Vim-shell fullscreen options
" let g:shell_fullscreen_always_on_top = 0
" let g:shell_fullscreen_items = "mT"

" set undodir="C:\Users\Andreas\SkyDrive\Code\5\_undo" --
set undofile
" set noundofile
" set undodir="~/vimfiles/undo/" 
set undodir=~/vimtmp/undo,.

" set nobackup
" set nowritebackup

" this is optional. Folder are in 
" set backupdir=~/vimtmp/tmp,.
" set directory=~/vimtmp/tmp,.


" Restore view settings
set viewoptions=cursor,folds
" set viewdir=$HOME/.vim_view//
set viewdir=~/vimtmp/view//
" au BufWritePost,BufLeave,WinLeave ?* mkview
" au BufWritePost ?* mkview
" au BufWinEnter ?* silent loadview

" Vim-shell fullscreen options
" let g:shell_fullscreen_always_on_top = 0
" let g:shell_fullscreen_items = "mT"


" --------------------------------------------------------------------------------
" Font, color style
" Mac
if has('gui_running')
	" set guifont=InconsolataForPowerline:h15
	set guifont=Inconsolata-g:h12
	" set guifont=Menlo:h12
	" set guifont=Source_Code_Pro:h12

else
endif


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

highlight FoldColumn guibg=gray10 guifg=gray20
hi        LineNr     guibg=gray10 guifg=gray15 
" highlight Folded     guibg=gray6  guifg=grey60
" highlight Folded     guifg=grey30
" hi        Folded     guifg=#465457 guibg=#000000
" hi        Folded     guifg=#4B5B61 guibg=#0B0B0B gui=bold
hi        Folded     guifg=#4B5B61 guibg=#0B0B0B


" Various settings
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
set number
set linebreak
set hidden
set nowrap
set textwidth=0 wrapmargin=0

set noswapfile
" set cursorline

set autochdir

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
set nolist


" Various mappings ----------------------------------------------

" exit neovim terminal mode
if has('nvim')
  tnoremap jk <C-\><C-n>
endif

" windows should not be kept at equal size
set noea


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

" Unicode mappings
" nnoremap cuc :%s/::/<c-k>::/g<cr>:%s/forall/<c-k>FA/g<cr>
nnoremap cuf :%s/forall/<c-k>FA/e<cr>
nnoremap cuc :%s/::/<c-k>::/e<cr>
nnoremap cua :%s/->/<c-k>->/e<cr>
nnoremap cub :%s/<-/<c-k><-/e<cr>
nnoremap cud :%s/=>/<c-k>=>/e<cr>
" nnoremap cue :%s/<=/<c-k><=/e<cr>
" TODO: could do the reverse replacement to revert back to non-unicode
" also: what to do with 'greater-than-or-qual'?

nnoremap cuq i<cr><Esc>

" Replace all purescript unicode characters
noremap <leader>cu :call PurescriptUnicode()<cr>
fun! PurescriptUnicode()
  normal cufcuccuacubcudcue 
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

noremap <leader>ssp :set syntax=purescript<cr>


" could also do this with a macro!
" let @c = 'cufcuccuacub'
" nmap <leader>cc @c

" doesn't work: how to use substitute on the whole file?
" fun! PUC()
"   substitute(%, "forall", "kitten", "g")
" endfun


" inoremap ` -
" cnoremap ` -

" Tests
" nmap <leader>5 <Plug>(sexp_capture_next_element)
" nnoremap <leader>kl :echo 'test8'<cr>
" nnoremap <F4> :echo "test"<cr>

" getfile split vertically file under cursor
" nmap <buffer> sf :vertical wincmd f<CR>

" save!
nnoremap <leader>w :w!<cr>
" nnoremap <silent><leader>w :up<cr>

" edit vim 
nnoremap <leader>vim :e $MYVIMRC<cr>
" source vim 
nnoremap <leader>sv :so $MYVIMRC<cr>

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

let &t_SI = "\<Esc>]50;CursorShape=0\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set termguicolors
" set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" set guicursor=n-v-c:block-iCursor,i-ci-ve:ver25,r-cr:hor20,o:hor50
" 		  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
" 		  \,sm:block-blinkwait175-blinkoff150-blinkon175

set guicursor=n:block-iCursor-blinkwait300-blinkon200-blinkoff150
" set guicursor=n:block-iCursor,i-ci-ve:ver100-blinkon400

" --------------------------------------------------------------------------------
" PURESCRIPT

command! Reset :PSCIDEend

nnoremap <Leader>st :PSCIDEtype<CR>
" nnoremap <Leader>at :PSCIDEaddTypeAnnotation<CR>:call PurescriptUnicode()<cr>
nnoremap <Leader>at :PSCIDEaddTypeAnnotation<CR>:call PurescriptUnicode()<cr>h
" nnoremap tw :PSCIDEaddTypeAnnotation<CR>:call PurescriptUnicode()<cr>h

" nnoremap tw :call InsertTypeAnnotation()<cr>jh
nnoremap tw :call InsertTypeAnnotation()<cr>
nnoremap ti :call ImportIdentifier()<cr>
nnoremap tr :PSCIDEend<cr>

nnoremap tt <Plug>InteroGenericType
vnoremap tt <Plug>InteroGenericType
" nnoremap tt :call SlimeType()<cr>
" vnoremap tt :call SlimeTypeVisSel()<cr>

nnoremap <Leader>sii :PSCIDEimportIdentifier<CR>
nnoremap <Leader>sai :PSCIDEaddImportQualifications<CR>
nnoremap <Leader>sri :PSCIDEremoveImportQualifications<CR>
nnoremap <Leader>sas :PSCIDEapplySuggestion<CR>

" nnoremap <Leader>sgd :PSCIDEgoToDefinition<CR>
" nnoremap <Leader>gd :PSCIDEgoToDefinition<CR>

" function template
nnoremap <Leader>sac :PSCIDEaddClause<CR>

nnoremap <Leader>sp :PSCIDEpursuit<CR>
nnoremap doo :PSCIDEpursuit<CR>

nnoremap <Leader>scw :PSCIDEcwd<CR>
nnoremap <Leader>sli :PSCIDElist<CR>
nnoremap <Leader>slo :PSCIDEload<CR>

" nnoremap goo :PSCIDEpursuit<CR>

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" Some test-funtions:

" fun! Ac1()
"   let resu = append( line('.') - 1, '" zwei' )
"   return 'result: ' . resu
" endfun
"
" fun! Ac2()
"   let fnames = system('ls')
"   let resu = append( line('.') - 1, fnames )
"   return 'result: ' . resu
" endfun
"
" fun! Ac3()
"   let resu = system('wc -c', "abcdefg")
"   let rv = append( line('.') - 1, resu )
"   return 'result: ' . resu
" endfun
"
" function! PursClientVisSel()
"     let visSel = Get_visual_selection()
"     exec 'SlimeSend1 purs ide client'
"     exec 'SlimeSend1 ' . visSel
" endfun
"
" function! PursClientVisSel2()
"     let visSel = Get_visual_selection()
"     let resu = system('purs ide client', visSel)
"     let rv = append( line('.') - 1, resu )
"     return 'result: ' . resu
" endfun
"
" function! PursClientVisSel3()
"     let resu = s:mysystem('pulp psci', ":q" )
"     let rv = append( line('.') - 1, resu )
"     return 'result: ' . resu
" endfun
"
" function! PursClientVisSel4()
"     let visSel = Get_visual_selection()
"     let enc = s:jsonEncode( visSel )
"     let resu = system('purs ide client', enc)
"     let rv = append( line('.') - 1, resu )
"     return 'result: ' . resu
" endfun
"
"
" nmap dr :echo Ac3()<cr>
" vmap <leader>kh :call PursClientVisSel2()<cr>
"
"
" function! s:mysystem(a, b)
"   return system(a:a, a:b . "\n")
" endfunction

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------


" Vim Slime → Tmux
let g:slime_target = "tmux"


nnoremap <Leader>kk :call ReplTopFnRL()<cr>

" run selection
vnoremap <Leader>kk :call ReplVisSel()<cr>

" run (commented) function call with many args
nnoremap <Leader>kl :call ReplComLine()<cr>

" reload module
nnoremap <Leader>kr :call ReplReload()<cr>

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
    let fnCallString = ListToHsFnCall(lineList) 
    if has('nvim')
      exec 'InteroSend ' . fnCallString
    else
      exec 'SlimeSend1 ' . fnCallString 
    endif
endfun

function! TraceComLine()
    let lineList = split( getline( line(".") ) )
    let fnCallString = ListToHsFnCall(lineList) 

    let functionName = get( split( getline( line(".") - 1 ) ), 0 )

    exec 'SlimeSend1 trace $ ' . functionName . '' . fnCallString 
endfun

function! ListToHsFnCall(stlist)
  let fncall = ""
  let stListCropped = a:stlist[1:]

  for nextItem in stListCropped
    let fncall = fncall . " " . nextItem
  endfor
  return fncall
  " echo fncall
endfun

function! ReplVisSel()
    let visSel = Get_visual_selection()
    " exec 'SlimeSend1 ' . visSel
    exec 'InteroSend ' . visSel
endfun

function! Tester1()
    let visSel = getline
    exec 'SlimeSend1 ' . visSel
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


function! ReplTopFnRL()
    call ReplReload()
    let functionName = get( split( getline( line(".") ) ), 0 )
    " exec 'SlimeSend1 ' . functionName
    " exec 'InteroSend ' . functionName
    if has('nvim')
      exec 'InteroSend ' . functionName
    else
      exec 'SlimeSend1 ' . functionName 
    endif
endfun

" nmap <leader>ih :SlimeSend1 import Helpers<cr>
" nmap <leader>ip :SlimeSend1 import Prelude<cr>

function! ReplReload()
    let modulename = GetModuleName() 
    exec ':up'
    if IsPurs()
      exec 'SlimeSend1 :r'
      exec 'SlimeSend1 import ' . modulename
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
      exec ':PSCIDEaddTypeAnnotation'
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

setlocal formatprg=stylish-haskell


" --- ALE --- 
" let g:hindent_on_save = 0
let g:ale_linters = {'haskell': ['stack-ghc-mod', 'hlint']}
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_enabled = 0
" let g:ale_set_quickfix = 1
let g:ale_emit_conflict_warnings = 0
nmap <leader>aa :ALEToggle<cr>
" --- ALE --- 


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


" TODO: automatic Intero+Tagbar setup
" launch Intero on the right, go the it's window, resize it to width x, then
"  let g:tagbar_vertical = 35
" and the TagbarOpen, with should open it above intero

" hi NeomakeErrorSign   ctermfg=white
" hi NeomakeWarningSign ctermfg=white
" hi NeomakeIntoSign    ctermfg=white
" hi NeomakeMessageSign ctermfg=white

augroup interoMaps
  au!
  " Maps for intero. 

  " Background process and window management
  au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
  au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

  " Open intero/GHCi split horizontally
  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
  " au FileType haskell nnoremap <silent> <leader>ioo :TagbarOpen fj<cr>:InteroOpen<CR><C-W>H50<C-W>
  " Open intero/GHCi split vertically
  " au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
  " au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H25<C-W>
  au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>

  " Reloading (pick one)
  " Automatically reload on save
  " au BufWritePost *.hs InteroReload
  " Manually save and reload
  " au FileType haskell nnoremap <silent> <leader>wr :w \| :InteroReload<CR>

  " Load individual modules
  au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
  au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

  " Type-related information
  " Heads up! These next two differ from the rest.
  " au FileType haskell map <silent> <leader>t <Plug>InteroGenericType
  " au FileType haskell map <silent> <leader>T <Plug>InteroType
  " au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>

  " Navigation
  " au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>
  au FileType haskell nnoremap <silent> <leader>gd :InteroGoToDef<CR>
  au FileType haskell nnoremap <silent> gd :InteroGoToDef<CR>

augroup END

" Intero starts automatically. Set this if you'd like to prevent that.
let g:intero_start_immediately = 0


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

map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :w<CR>:GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

map <silent> ty :w<CR>:GhcModCheck<CR>
map <silent> tu :w<CR>:GhcModLint<CR>


" Reload
" map <silent> tu :call GHC_BrowseAll()<CR>
" " Type Lookup
" map <silent> ty :call GHC_ShowType(1)<CR>


let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

" let g:necoghc_enable_detailed_browse = 0
let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

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

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
" --------------------------------------------------------------------------------




" ------------------------------------------------------
" Code formatting ------------------------

" Hit enter to add a new line above or below the current line
nnoremap <c-Enter> i<cr><Esc>
" nnoremap <CR> o<Esc>

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
nmap <leader>s- i--------------------------------------------------------------------------------<esc>^
nmap <leader>ml i--------------------------------------------------------------------------------<esc>^
nmap gc-- i--------------------------------------------------------------------------------<esc>^


" quickfix window and loclist window
nmap <silent> [w :lprev<cr>
nmap <silent> ]w :lnext<cr>
nmap <silent> [e :cprev<cr>
nmap <silent> ]e :cnext<cr>


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
nmap 9 ^
omap 9 ^
vmap 9 ^
nmap y9 y^
nmap d9 d^
nmap c9 c^

nmap 0 g_
omap 0 g_
vmap 0 g_

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
nmap <leader>dcg i<c-r>=system('ls')<cr><esc>

fun! SomeTest1( ar1 )
  return "Some arg: " . a:ar1
endfun


nnoremap <leader>dcf :cd %:p:h<cr>

" :py import vim, random; vim.current.line += str(random.randint(0, 99))
"
" ui0

function! RandFnName()
python << EOF
import string
import random
import vim

vim.current.line += ''.join(random.choice(string.ascii_lowercase) for _ in range(2)) + '0 = undefined'
EOF
endfunction

nmap <leader>uf :call RandFnName()<cr>2w
" produces a (test) haskell function with a random name, e.g.:
" cp0 = undefined


" Replace ---------------------------------------------
" Replace clojure elements and forms
" nmap <leader>re "_die"0P`[
" nmap <leader>re ve"0pb
nmap <leader>re "_die"0Pb
nmap <leader>rf "_daf"0PB

" Replace words
nmap <leader>rw "_diw"0Pb
nmap <leader>rW "_diW"0PB
" Register, black hole, delete, inner Big Word, paste from yank register, go to
" beginning of pasted text.

" Replace rest of the line
nmap <leader>r0 "_d$"0p`[

" Make deleting to black hole register easier. Todo: do I need this?
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
" comment form
nmap coaf gcaf
nmap coo :call CommentToggle()<CR>
vmap <leader>ge gc


" Fill line with dashes 
nnoremap <leader>_ $a<space><esc>82a-<esc>d82<bar>^


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


autocmd ColorScheme * hi! link SneakScope Normal
" autocmd ColorScheme * hi! Sneak guifg=green guibg=orange
autocmd ColorScheme * hi! link Sneak Cursor


" ---- Color ----

colorscheme molokai

set nocompatible
set background=dark
set laststatus=2
set number

if has("termguicolors")
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    set termguicolors
else
    set t_Co=256
endif

hi NeomakeErrorSign   ctermfg=white
hi NeomakeWarningSign ctermfg=white
hi NeomakeIntoSign    ctermfg=white
hi NeomakeMessageSign ctermfg=white


set lazyredraw

" ---- Color ----



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

" let g:SuperTabClosePreviewOnPopupClose = 1
" YouCompleteMe plugin has a g:ycm_autoclose_preview_window_after_insertion 
" let g:ycm_semantic_triggers = {'haskell' : ['.']}
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
vnoremap <leader>d/ "gy :Ag "<C-R>g" .
nnoremap <leader>d/ "gyw :Ag "<C-R>g" .
vnoremap <leader>db/ "gy :AgBuffer "<C-R>g"
nnoremap <leader>db/ "gyw :AgBuffer "<C-R>g"
" :Ab "\b<C-R><C-W>\b" . 

let g:ag_highlight=1


" --------------------------------------------------------------------------------
nnoremap <silent> <leader>df :set nohlsearch<cr>
nnoremap <silent> <leader><leader> :set nohlsearch<cr>

"Find clojure functions 
" vnoremap <leader>/ :set hlsearch<cr>:noh<cr>/\vdefn 
" nnoremap <leader>/ :set hlsearch<cr>:noh<cr>/\vdefn 

"Find clojure lib usage 
" vnoremap <leader>dl/ :set hlsearch<cr>:noh<cr>/\v"<C-R>g"\/
" nnoremap <leader>l/ "gyiw :set hlsearch<cr>:noh<cr>/\v<C-R>g\/<cr>

nnoremap <silent> n n
nnoremap <silent> N N

" Search next: 
nnoremap <silent> <leader>n :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

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

nnoremap <leader>q :NERDTreeClose<cr>
nnoremap <leader>oe :NERDTree-m<cr>
let NERDTreeQuitOnOpen=1

" Tips:
" use CC to reset tree to current dir




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

nmap <leader>spy \wspy<esc>(



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



nmap <leader>op :call OpenUrlUnderCursor()<CR>
" vmap <leader>op :call OpenSelectedUrl()<CR>

vnoremap <leader>op "gy:call OpenSelectedUrl()<CR>


fun! OpenITerm()
    let _ = Setcwd()
    let path = getcwd()
    exec 'silent !open -a iTerm ' . path
endfun
" this works: :silent !open -a iTerm Documents/purescript 


fun! GoogleSearchStr()
    let keyw = expand("<cword>")
    let url = 'http://www.google.de\#q\=' . keyw
    return url
endfun

nmap glt :call OpenITerm()<cr>
nmap glf :call OpenFinder()<cr>
nmap gle :call OpenCurrentFileInSystemEditor()<cr>


" --- Tagbar ----
nmap gkl :TagbarOpen j<cr>
nmap <leader>to :TagbarOpen j<cr>
nmap to :TagbarOpen j<cr>
nmap <leader>th :TagbarClose<cr>

nmap <silent> <c-h> gklk<cr>
nmap <silent> <c-l> gklj<cr>
" --- Tagbar ----



" --- quickfix & loclist ----
" let g:lt_location_list_toggle_map = 'gll'
let g:lt_location_list_toggle_map = '<leader>ll'
" let g:lt_quickfix_list_toggle_map = 'gqq'
let g:lt_quickfix_list_toggle_map = '<leader>qq'
" let g:lt_quickfix_list_toggle_map = '<leader>gq'

nmap <leader>oq :CtrlPQuickfix<cr>
" --- quickfix & loclist ----

nmap <leader>go :Gstatus<cr>
nmap <leader>gs :Gstatus<cr>


nmap gsg :call GoogleSearch("word")<cr>
vmap gsg :call GoogleSearch("visSel")<cr>
nmap gsd :call DocsForCursorWord()<cr>
vmap gsd :call DocsForVisSel()<cr>
nmap gsh :call GithubSearch("word")<cr>
vmap gsh :call GithubSearch("visSel")<cr>

nmap gsf :call GrepSearch("word", "file")<cr>
vmap gsf :call GrepSearch("visSel", "file")<cr>
nmap gsb :call GrepSearch("word", "buffers")<cr>
vmap gsb :call GrepSearch("visSel", "buffers")<cr>

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
      let url = 'https://www.stackage.org\/lts-8\.22\/hoogle\?q\=' . enckw
      " let url = 'https://www.haskell.org\/hoogle\/\?hoogle\=' . enckw 
    endif
    let comm = 'silent !open ' . url
    exec comm
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


fun! ClojureDocsForCursorWord()
    let keyw = expand("<cword>")
    let url = "https://clojuredocs.org/clojure.core/" . keyw
    let path = "C:/Program Files (x86)/Google/Chrome/Application/"
    exec 'silent !"' . path . 'chrome.exe" ' . url
endfun


fun! ClojureDocsForVisSel()
    let keyw = EncodeURL(@g)
    let url = "https://clojuredocs.org/clojure.core/" . keyw
    let path = "C:/Program Files (x86)/Google/Chrome/Application/"
    exec 'silent !"' . path . 'chrome.exe" ' . url
endfun


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

nmap <leader>7 :call Setcwd()<cr>

command! Setcwd :call Setcwd()
command! Setd :call Setcwd()

function! Setcwd()
   let cph = expand('%:p:h', 1)
   if cph =~ '^.\+://' | retu | en
   for mkr in ['.git/', '.hg/', '.svn/', '.bzr/', '_darcs/', '.vimprojects', 'project.clj']
     let wd = call('find'.(mkr =~ '/$' ? 'dir' : 'file'), [mkr, cph.';'])
     if wd != '' | let &acd = 0 | brea | en
   endfo
   echo fnameescape(wd == '' ? cph : substitute(wd, mkr.'$', '.', '')) 
   exe 'lc!' fnameescape(wd == '' ? cph : substitute(wd, mkr.'$', '.', ''))
endfunction

function! GetProjectRoot()
   let cph = expand('%:p:h', 1)
   if cph =~ '^.\+://' | retu | en
   for mkr in ['.git/', '.hg/', '.svn/', '.bzr/', '_darcs/', '.vimprojects', 'project.clj']
     let wd = call('find'.(mkr =~ '/$' ? 'dir' : 'file'), [mkr, cph.';'])
     if wd != '' | let &acd = 0 | brea | en
   endfo
   return fnameescape(wd == '' ? cph : substitute(wd, mkr.'$', '.', '')) 
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


" To narrow down the issue, run Vim with a minimal configuration: >
"     vim -u NORC -N +"let g:sneak#label=1" +":set runtimepath+=~/.vim/bundle/vim-sneak/" +":runtime plugin/sneak.vim"
"
" or Nvim: >
"     nvim -u NORC +"let g:sneak#label=1" +":set runtimepath+=~/.local/share/nvim/bundle/vim-sneak/" +":runtime plugin/sneak.vim"

