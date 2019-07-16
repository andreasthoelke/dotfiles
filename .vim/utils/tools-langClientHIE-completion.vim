
" ─   Language Client HIE                                ■

let g:LanguageClient_serverCommands = { 'haskell': ['hie-wrapper'] }
let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']

let g:LanguageClient_autoStart = 1
" let g:lsp_async_completion = 1
" delay updates? not sure if this works
" let g:LanguageClient_changeThrottle = 0.5

let g:LanguageClient_diagnosticsEnable = 1
let g:LanguageClient_diagnosticsList = 'Location'
" default is Quickfix - but Intero uses quickfix (nicely formatted) via neomake

let g:LanguageClient_windowLogMessageLevel = 'Info'
" let g:LanguageClient_settingsPath = '~/.vim/HIE/settings.json'
" default: $projectdir/.vim/settings.json

" let g:LanguageClient_loggingFile = expand('~/.vim/LanguageClient.log')
let g:LanguageClient_useFloatingHover = 1
" In HsFormat
" set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
" Try: - "gqaf"


" `leader lm` to open LanguageClient menu - e.g. to trigger a HIE codeAction
nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
" Documentation
map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
map <Leader>lb :call LanguageClient#textDocument_references()<CR>
map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>

map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>
" This still shows an error - 'no handler for ..'
map <Leader>lS :call LanguageClient_workspace_symbol()<CR>

map <Leader>ga :call LanguageClient_textDocument_documentHighlight()<CR>



" Diagnostics highlighing:
let g:LanguageClient_diagnosticsDisplay = {
      \ 1: {
      \ 'name': 'Error',
      \ 'texthl': 'WarningSign',
      \ 'signTexthl': 'WarningSign',
      \ 'virtualTexthl': 'purescriptLineComment',
      \ 'signText': g:sign_error,
      \ },
      \ 2: {
      \ 'name': 'Warning',
      \ 'texthl': 'WarningSign',
      \ 'signTexthl': 'WarningSign',
      \ 'virtualTexthl': 'purescriptLineComment',
      \ 'signText': g:sign_warning,
      \ },
      \ 3: {
      \ 'name': 'Information',
      \ 'texthl': 'WarningSign',
      \ 'signTexthl': 'WarningSign',
      \ 'virtualTexthl': 'purescriptLineComment',
      \ 'signText': g:sign_warning,
      \ },
      \ 4: {
      \ 'name': 'Hint',
      \ 'texthl': 'WarningSign',
      \ 'signTexthl': 'WarningSign',
      \ 'virtualTexthl': 'purescriptLineComment',
      \ 'signText': g:sign_warning,
      \ },
      \ }

" ─^  Language Client HIE                                ▲



nnoremap ged :call ShowLC_Diagnostics()<cr>

func! s:showLC_Diagnostics( stateJSON )
  if !has_key(a:stateJSON, 'result')
    return
  endif
  let message = ''
  let state = json_decode( a:stateJSON.result )
  let diagnostics = get( state.diagnostics, expand('%:p'), [] )
  " echoe string( diagnostics )
  for diag in diagnostics
    if diag.range.start.line +1 == line('.')
      let message = diag.message
    endif
  endfor
  let messageLines = split( message, '\%x00' )
  call FloatWin_ShowLines( messageLines )
endfunc

" func! s:showLC_Diagnostics( stateJSON ) ■
"   if has_key(a:stateJSON, 'result')
"     let res = json_decode( a:stateJSON.result )
"     call FloatWin_ShowLines( [ string( res.diagnostics ) ] )
"   endif
" endfunc ▲


func! ShowLC_Diagnostics()
  call LanguageClient#getState(function( 's:showLC_Diagnostics' ))
endfunc



" ─   Completion                                         ■

" call deoplete#enable()
let g:deoplete#enable_at_startup = 1
" let g:deoplete#num_processes = 1

inoremap <expr> <c-i> deoplete#manual_complete()

call deoplete#custom#option({
      \ 'auto_complete_delay': 1000,
      \ 'smart_case': v:true,
      \ 'auto_complete': v:false,
      \ })





" autocmd BufEnter * call ncm2#enable_for_buffer()
" let g:float_preview#docked = 0
" function! DisableExtras()
"   call nvim_win_set_option(g:float_preview#win, 'number', v:false)
"   call nvim_win_set_option(g:float_preview#win, 'relativenumber', v:false)
"   call nvim_win_set_option(g:float_preview#win, 'cursorline', v:false)
" endfunction
" autocmd User FloatPreviewWinOpen call DisableExtras()


" set completeopt=menuone,preview
set completeopt=noinsert,menuone,noselect
" set completeopt+=noselect
" set completeopt+=noinsert

" TODO Not sure what effect this has
set completefunc=LanguageClient#complete
set omnifunc=LanguageClient#complete
" set omnifunc=syntaxcomplete#Complete
" set omnifunc=lsp#complete

" let g:haskellmode_completion_ghc = 0
" autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

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


" ─^  Completion                                         ▲
