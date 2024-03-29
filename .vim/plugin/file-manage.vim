
" Shortcuts to popular folders:
nnoremap <leader>ou :tabe ~/.vim/utils/<cr>
nnoremap <leader>or :vnew ~/.vim/plugin/<cr>
nnoremap <leader>oR :tabe ~/.vim/plugin/<cr>
nnoremap <leader>on :vnew ~/.vim/notes/<cr>
nnoremap <leader>oN :tabe ~/.vim/notes/<cr>
nnoremap <leader>ov :vnew ~/.vim/<cr>
nnoremap <leader>oV :tabe ~/.vim/<cr>
nnoremap <leader>od :vnew ~/Documents/<cr>
nnoremap <leader>oD :tabe ~/Documents/<cr>
nnoremap <leader>oh :vnew ~/Documents/Haskell/6/<cr>
nnoremap <leader>oH :tabe ~/Documents/Haskell/6/<cr>
nnoremap <leader>op :vnew ~/Documents/PS/A/<cr>
nnoremap <leader>oP :tabe ~/Documents/PS/A/<cr>
nnoremap <leader>ok :vnew ~/Documents/MobileDev/JPCompose/<cr>
nnoremap <leader>oK :tabe ~/Documents/MobileDev/JPCompose/<cr>

nnoremap \v :exec "vnew " . expand('%:p:h')<cr>
nnoremap \T :exec "tabe " . expand('%:p:h')<cr>

nnoremap <leader>ol :call FloatingBuffer( "/Users/andreas.thoelke/.vim/notes/links" )<cr>


nnoremap <leader>P :call PreviewFileInFloatWin( getline('.') )<cr>
nnoremap <leader>of :call FloatingBuffer( GetFilePathAtCursor() )<cr>

func! PreviewFileInFloatWin( filePath )
  call FloatWin_ShowLines( readfile( a:filePath, "\n" ) )
endfunc
" call PreviewFileInFloatWin( "/Users/andreas.thoelke/.vim/notes/links" )



" ─   CtrlP                                              ■

" Notes:
" ctrlP custom menu: seems quite involved ~/.vim/autoload/ctrlpArgs.vim#/call%20add.g.ctrlp_ext_vars

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

" ─^  CtrlP                                              ▲



" ─   Dirvish                                            ■

" Example of how to set up custom maps
" autocmd FileType dirvish nnoremap <buffer><silent> <c-p> :CtrlP<cr>

" Sort folders at the top
let g:dirvish_mode = ':sort ,^.*[\/],'

" let g:dirvish_relative_paths = 1


augroup dirvish_config
  autocmd!
  " Map `t` to open in new tab.
  " Example: buffer local maps
  autocmd FileType dirvish
        \  nnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
        \ |xnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
  " Map `gr` to reload.
  " autocmd FileType dirvish nnoremap <silent><buffer> gr :<C-U>Dirvish %<CR>
  autocmd FileType dirvish nnoremap <silent><buffer> X :argadd getline('.')<cr>
  autocmd FileType dirvish nnoremap <silent><buffer> P :call PreviewFileInFloatWin( getline('.') )<cr>
  " Map `gh` to hide dot-prefixed files.  Press `R` to "toggle" (reload).
  autocmd FileType dirvish nnoremap <silent><buffer> gh :silent keeppatterns g@\v/\.[^\/]+/?$@d _<cr>:setl cole=3<cr>
  " autocmd FileType dirvish nmap <silent><buffer> / 
  " Todo: set a meaningful buffername to be seen in tabline
  " autocmd FileType dirvish exe "keepalt file" fnamemodify(bufname(), ':.')
augroup END

" TODO: i tried to overwrite dirvishes custom search mapping here. Instead i've now just commented
" this out in the source here  ~/.vim/plugged/vim-dirvish/ftplugin/dirvish.vim#/if%20s.sep%20==

" This can only show one char, no column space. the git plugin shows more styling
" call dirvish#add_icon_fn({p -> p[-3:]=='.hs' ? "λ " : ''})

let g:dirvish_git_show_ignored = 1
let g:dirvish_git_indicators = {
      \ 'Modified'  : '✹',
      \ 'Staged'    : '✚',
      \ 'Untracked' : '✭',
      \ 'Renamed'   : '➜',
      \ 'Unmerged'  : '═',
      \ 'Ignored'   : '☒',
      \ 'Unknown'   : '?'
      \ }

" ─^  Dirvish                                            ▲


" ─   Arglist                                            ■


" CtrlP support: Arglist can be shown in CtrlP. Files can be opened and items deleted with <c-s>
command! CtrlPArgs call ctrlp#init( ctrlpArgs#id() )
nnoremap <leader>oa :CtrlPArgs<cr>
nnoremap <leader>gi :CtrlPArgs<cr>

" Reset the global arg list:
nnoremap <leader>X :%argdelete<cr>:call ReloadKeepView()<cr>
" Use "argg and argl" to switch to global and local arg list. Generally prefer the global arg list.

func! ReloadKeepView()
  let l:winview = winsaveview()
  exec 'e'
  exec 'normal!' "\<C-o>"
  call winrestview(l:winview)
endfunc

" Toggle arglist items: Single, vis-sel and line motion
nnoremap ,xx :call Arglist_toggleItems( [getline('.')] )<cr>:Dirvish %<cr>
vnoremap ,x :<c-u>call Arglist_toggleItems( getline("'<", "'>") )<cr>
nnoremap ,x :set opfunc=ArglistToggle_op<cr>g@
" Tip: can add popular folders as well, then CtrlP-v/t to open the dirvish pane
" Issue: Dotfolders e.g. ".git" can not be toggled in dirvish, only with CtrlP-s

func! ArglistToggle_op( _ )
  call Arglist_toggleItems( getline( "'[", "']" ) )
endfunc

" Remove a string from the arglist if already present, add it otherwise.
func! Arglist_toggleItems( listOfStr )
  argglobal
  for argItem in a:listOfStr
    let currentIndex = index( ArgvFilenameTailOnly(), fnamemodify( argItem, ":t" ) )
    if currentIndex == -1
      exec '$argadd ' . argItem
    else
      exec (currentIndex+1) . "argd"
    endif
  endfor
  if &filetype == 'dirvish'
    Dirvish %
  endif
endfunc

func! ArgvAbsPath()
  return MakeFilenamesAbsolute( argv() )
endfunc

func! ArgvFilenameTailOnly()
  return map ( argv(), {_, str -> fnamemodify( str, ":t" )} )
endfunc

func! MakeFilenamesAbsolute ( listOfFilesnames )
  return map( a:listOfFilesnames, {_, str -> fnamemodify( str, ":p")} )
endfunc

" ─^  Arglist                                            ▲

" ─   fzf                                                ■

" Use: BLines, Lines(?), GFiles?, BCommits, Maps, Helptags
" ~/.vim/plugged/fzf.vim/doc/fzf-vim.txt#/Command%20|%20List

let g:fzf_layout = { 'up': '~40%' }

command! -bang Args call fzf#run(fzf#wrap('args', {'source': argv()}, <bang>0))




" ─^  fzf                                                ▲



" ─   Move Files                                         ■
" Process:
" - put two Dirvish folders side by side (source -> target)
" - use ,x(l/j/vis-sel) in the left window to add to the arglist
"   - leader oa to show current arglist
"   - leader X to reset/clear arglist
"   - do this regularly (also R to refesh Dirvish)
" - leader mv will run the 'move' command.
"   - <c-w>l to see the moved file in the other folder in 'red' (auto added to the arg list)
"   - with the cursor still in the right win (related folder path is filtered as the tarket folder)
"     run leader mv again to undo/redo to operation in reverse direction
" - leader mV will show e.g.
  " Shdo! mv %{} /Users/andreas.thoelke/Documents/PS/A/TestsA/webpack-reload/src/App/{}
  " in command edit mode. placeholder "{}" will insert the arglist! and I can now change "mv" to "cp" or "rm", etc
  " - <c-c><c-c> cancels the process
  " - <c-c><cr> runs the Shdo! command to will show a buffer with the full command
  " - leader leader z will run the shell script in that buffer
  " - leader bd to delete that temp buffer
  " - see the effect in the dirvish buffers. R? for leader X?
  " - <c-w>L/H to reverse the command?


nnoremap <leader>mv :call MoveFilesFromLeftWinToRightWin( 0 )<cr>
nnoremap <leader>mV :call MoveFilesFromLeftWinToRightWin( 1 )<cr>q:<leader>"tP^W

" The list of filenames in the current tab
func! TabWinFilenames()
  return map( tabpagebuflist( tabpagenr() ), {_, bufnum -> bufname( bufnum ) } )
endfunc


func! MoveFilesFromLeftWinToRightWin( prompt )
  let folderPathSource = bufname( bufnr('%') )
  " Of the other windows choose the leftmost as the target of the file move
  let [folderPathTarget;_] = functional#filter( {path-> path isnot# folderPathSource}, TabWinFilenames() )
  " if len(TabWinFilenames()) > 1
  " else
  "   let folderPathTarget = '%'
  " endif
  if !( IsFolderPath( folderPathSource ) && IsFolderPath( folderPathTarget ))
    echoe "You need to have source and target folders side by side"
    return
  endif

  " let cmdStr = 'Shdo! mv ' . folderPathSource.'{} ' . folderPathTarget.'{}'
  let cmdStr = 'Shdo! mv ' . '%{} ' . folderPathTarget.'{}'
  if a:prompt
    " TODO go directly into the command editing window - automate <c-f>k^w
    " normal! q:
    let @t = cmdStr
    " call feedkeys( ':' . cmdStr )
    " Stop at the pre-filled command prompt, don't auto-run and close the Shdo buffer
    return
  else
    " this opens a buffer with the full shell script!
    exec cmdStr
    " this runs the shell script
    call RunBufferAsShellScript()
    wincmd c
    call SetArglistfilesFolder( folderPathTarget )
  endif
  " wincmd p
  " if &filetype == 'dirvish'
  "   Dirvish %
  " else
  "   wincmd w
  "   Dirvish %
  " endif
  " wincmd w
endfunc


func! IsFolderPath ( path )
  return (a:path[-1:] == '/')
endfunc


func! SetArglistfilesFolder( newFolder )
  let argvTail = ArgvFilenameTailOnly()
  %argdelete
  for argItem in argvTail
    exec '$argadd ' . a:newFolder . argItem
  endfor
endfunc

" nnoremap <buffer><silent> Z! :silent write<Bar>exe '!'.(has('win32')?fnameescape(escape(expand('%:p:gs?\\?/?'), '&\')):shellescape(&shell).' %')<Bar>if !v:shell_error<Bar>close<Bar>endif<CR>

nnoremap <leader><leader>z :call RunBufferAsShellScript()<cr>

func! RunBufferAsShellScript()
  exec '!'. shellescape( &shell ) .' %'
  if !v:shell_error
    close
  endif
endfunc


" ─^  Move Files                                         ▲








