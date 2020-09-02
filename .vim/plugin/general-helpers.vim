

" Somewhat simplifies running a command on a range of lines
func! ExecRange( cmd, startLine, endLine )
  let rangeStr = a:startLine . ',' . a:endLine
  exec rangeStr . a:cmd
endfunc

func! FlipListList ( listList )
  let flippedList = []
  for [fst, snd] in a:listList
    call add( flippedList, [snd, fst] )
  endfor
  return flippedList
endfunc
" echo FlipListList( [[11, 22], [33, 44]] )

func! TrimListOfStr( listOfStr )
  return map( a:listOfStr, {key, val -> trim(val)} )
endfunc
" echo map( [" eins ", " zwei"], {key, val -> trim(val)} )

" use functional.vim now
func! Reduce_depricated( funcRef, list)
  let acc = ''
  for val in a:list[0:]
    let acc = a:funcRef(acc, val)
  endfor
  return acc
endfun
" echo Reduce( {acc, nextStr -> acc . '(i∷ ' . nextStr . ') '}, ['a → b', 'Maybe a'] )[:-2] . '!'


func! MakeBufferDisposable()
  setl buftype=nofile
  setl bufhidden=hide
  setl noswapfile
  " Buffer is shown with ':ls' but not ctrlP
  setl buflisted
endfunc

func! GetLanguageByCurrentFileExtension()
  let extension = GetExtension()
  if extension == 'purs'
    return 'PureScript'
  elseif extension == 'hs'
    return 'Haskell'
  else
    return extension
  endif
endfunc


" ─   Links Rel                                          ■

nnoremap <leader>cl :call LinkRefToClipBoard()<cr>
command! LinkRefToClipBoard call LinkRefToClipBoard()

func! LinkRefToClipBoard()
  let lineText = getline('.')
  let lineText = substitute( lineText, '"\s', '', 'g' )
  let lineText = substitute( lineText, '─', '', 'g' )
  let lineText = substitute( lineText, '■', '', 'g' )
  let lineText = substitute( lineText, ':', '.', 'g' )
  " These substitutes allow linking to a vimscript function (also see not allowed char in rel.vim)
  let lineText = substitute( lineText, '!', '.', 'g' )
  let lineText = substitute( lineText, '(\|)', '.', 'g' )
  " echo substitute( getline('.'), '─\|"', '', 'g' )
  let [w1;mayW3] = split( lineText )
  let searchStr = '#/'.w1
  if len( mayW3 )
    let searchStr .= '%20'.mayW3[0]
  endif
  if len( mayW3 ) > 1
    let searchStr .= '%20'.mayW3[1]
  endif
  let lineRef = expand('%:p') . searchStr
  let lineRef = substitute( lineRef, '/Users/andreas.thoelke/', '~/', 'g' )
  echo 'Copied this text-link-reference to clipboard:'
  echo lineRef
  let @*= lineRef
endfunc
" Example: ~/.vim/utils/utils-general-helpers.vim#/Create%20or%20just
" ~/.vim/utils/utils-general-helpers.vim#/LinkRefToClipBoard()
" Now works also on code markup lines
" ~/.vim/utils/utils-general-helpers.vim#/Links%20Rel%20■

" Basically I want:
" Here is a concealedlink: ..*notes-todos.md//Release notes v1.1.2*
" where the abs path is hidden and the text is readable without the %20
" ~/.vim/notes/notes-navigation.md#/Create%20hyperlink%20to

" ─^  Links Rel                                          ▲



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

" Returns v:true if a window of <filepath> is open in the current tab
func! WinIsOpen( filepath )
  return len( functional#filter( {path-> path is# a:filepath}, TabWinFilenames() ) )
endfunc
" echo WinIsOpen( '( Markbar )' )
" echo WinIsOpen( bufname( bufnr('%') ) )


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
  " return message
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

nnoremap <leader>sp :set syntax=purescript<cr>



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
nnoremap <leader>fpc :let @* = @%<cr>:let @" = @%<cr>
nnoremap <leader>fpC :let @* = expand("%:p")<cr>:let @" = expand("%:p")<cr>
command! FilepathCopy    let @* = @%            | let @" = @%
command! FilepathCopyAbs let @* = expand("%:p") | let @" = expand("%:p")

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


