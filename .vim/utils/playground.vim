let g:cmd1 = 'find $VIMRUNTIME -type f -name \*.vim'
call append( 15, split( system( g:cmd1 ), '\n' ) )
exec "10,$normal! d8f/"
exec "normal! /run\<cr>"
exec "normal! d/run\<cr>"
/local
nnoremap <leader>abb /shar<cr>
call append( 10, split( &runtimepath , ',' ) )
nnoremap <leader>ab i<c-r>=&runtimepath<cr>
exec "normal! i<c-r>=&runtimepath"
put =&runtimepath
put ='hi there'
hi there
" printf cycles through the args to the fill in args
printf 'Start: %s\n' 'here it is!' 'and more'
echo 'a\nb\nc\nb\n' | vim - -es --not-a-term +'g/b/norm gUUixx' +2 +'norm yy2p' '+%p' '+qa!' | tr x z


