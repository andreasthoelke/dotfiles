

" ─   Windows                                            ■


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

nnoremap <c-w>n :vsplit<cr>:call SymbolNext_SplitTop()<cr>
nnoremap <c-w>N :split<cr>:call SymbolNext_SplitTop()<cr>

fun! SymbolNext_SplitTop()
  call HiSearchCursorWord()
  keepjumps normal! ggn
endfunc


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
nmap <leader>wp <Plug>(Visual-Split-SplitAbove)
xmap <leader>wp <Plug>(Visual-Split-VSSplitAbove)

" Workaround to force vim-help to open below
" augroup vimrc_help
"   autocmd!
"   autocmd BufEnter *.txt if &buftype == 'help' | wincmd J | endif
" augroup END

" nnoremap <leader> wip :call PinImports()<cr>

func! PinImports()
  wincmd s
  wincmd k
  normal gg

endfunc

" ─^  Windows                                            ▲


" ─   Tabs                                               ■

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


" ─^  Tabs                                               ▲


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
inoremap <c-[> <esc>l


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
" call ScrollOff( 20 )

func! ScrollUp( lines )
  call feedkeys( a:lines . "\<c-e>", 'nx')
endfunc
" call ScrollOffFix( 20 )


func! ScrollUpFromMiddle( lines )
  normal! zz
  call ScrollUp( a:lines )
endfunc
" call ScrollUpFromMiddle( 20 )

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

