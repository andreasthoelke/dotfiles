
" nnoremap ]a :<C-U>call signature#mark#Goto("next", "spot", "global")<CR>
" nnoremap [a :<C-U>call signature#mark#Goto("prev", "spot", "global")<CR>

" nnoremap you :MundoToggle<cr>
" nnoremap yog :Magit<cr>

" There is only one instance/window of Mundo. Whenever a Mundo window is open, Autosave should be off
nnoremap you :MundoToggle<cr>:AutoSaveToggle<cr>
" There may be muliple Magit windows. Only when the focus is on any of there Autosave should be off
nnoremap yog :Magit<cr>:call AttachAutosaveStopEvents()<cr>:let g:auto_save = 0<cr>

