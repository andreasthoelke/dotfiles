
nnoremap <silent> gsg :call GoogleSearch("word")<cr>
vmap <silent> gsg :call GoogleSearch("visSel")<cr>

nnoremap <silent> gsh :call DocsForCursorWord()<cr>
vmap <silent> gsh :call DocsForVisSel()<cr>
nnoremap <silent> gsd :call HoogleForCursorWord()<cr>
vmap <silent> gsd :call HoogleForVisSel()<cr>

nnoremap <silent> gsi :call GithubSearch("word")<cr>
vmap <silent> gsi :call GithubSearch("visSel")<cr>

nnoremap <silent> gsr :call GrepSearch("word", "repo")<cr>
vmap <silent> gsr :call GrepSearch("visSel", "repo")<cr>
nnoremap <silent> gsb :call GrepSearch("word", "buffers")<cr>
vmap <silent> gsb :call GrepSearch("visSel", "buffers")<cr>


" Seach Vim Help and fill the quickfix list with the results
command! -nargs=1 HelpGrep  exec ':helpgrep' <q-args> | exec ':cwindow'
cnoreabbrev hg HelpGrep

nnoremap <leader>K K

fun! OpenFinder()
  exec 'silent !open .'
endfun

fun! OpenCurrentFileInSystemEditor()
  exec 'silent !open %'
endfun


" Search Config: -----------------------------------

" Can just use 'vim' instead of 'vimgrep'


" Vim Grepper: ------------------------------

" Repo files:
command! -nargs=1 Frepo     :tabe % | Grepper -tool git -side          -query <args>
" Open buffers:
command! -nargs=1 Fbuffers  :tabe % | Grepper           -side -buffers -query <args>

" Notes:
command! -nargs=1 Fnotes    :tabe % | Grepper -tool git -side          -query <args> /Users/andreas.thoelke/.vim/notes
command! -nargs=1 FnotesAll :tabe % | Grepper           -side          -query <args> /Users/andreas.thoelke/.vim/notes
" Haskell code:
" command! -nargs=1 Fhask     :tabe % | Grepper           -side          -query <args> /Users/andreas.thoelke/Documents/Haskell/4/hello44/** /Users/andreas.thoelke/Documents/Haskell/4/abc4/test1/**
command! -nargs=1 Fhask     :tabe % | Grepper           -side          -query <args> /Users/andreas.thoelke/Documents/Haskell/6/HsTraining1/** /Users/andreas.thoelke/Documents/Haskell/6/HsTrainingBook2/**

" Vim code:
command! -nargs=1 Fvim      :tabe % | Grepper           -side          -query <args> /Users/andreas.thoelke/.vim/utils/ /Users/andreas.thoelke/.vimrc
" Plugin code:
command! -nargs=1 Fplug     :tabe % | Grepper           -side          -query <args> /Users/andreas.thoelke/.vim/plugged/**

" command! -nargs=1 FrepoDel  :tabe | Grepper           -side          -query <args> /Users/andreas.thoelke/.vim/plugged/**

command! -nargs=1 Fdeleted call FindInDeletedCode( <q-args> )
" TODO How can I do this in uncommitted deleted code → undotree or unstaged changes?

command! -nargs=1 Help call HelpOpen( <q-args> )

func! FindInDeletedCode( pattern )
  let l:cmd = "git log -c -S'" . a:pattern . "'"
  let l:resultLines = split( system( l:cmd ), '\n' )
  exec 'tabe'
  call append( line('.'), l:resultLines )
endfunc

func! HelpOpen( appName )
  let l:cmd = a:appName . ' --help'
  let l:resultLines = split( system( l:cmd ), '\n' )
  exec 'tabe'
  call append( line('.'), l:resultLines )
  exec 'Man!'
endfunc

command! -nargs=1 AppOut call StdoutToBuffer( <q-args> )
nnoremap <leader>sab :call StdoutToBuffer( getline('.') )<cr>
" Tests:
" ls -o -t -a
" hasktags --help
func! StdoutToBuffer ( cmd )
  let l:resultLines = split( system( a:cmd ), '\n' )
  exec 'vnew'
  call append( line('.'), l:resultLines )
  normal! dd
endfunc

" This works pretty well. could reuse for other purposes
command! Todo Grepper -tool git -query -E '(TODO|FIXME|XXX):'

runtime plugin/grepper.vim    " initialize g:grepper with default values
let g:grepper.stop = 20

au ag FileType GrepperSide
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
" highlight Conceal         guifg=#FFFFFF guibg=#000000

fun! GrepSearch(selType, mode)
  if a:selType == "word"
    let keyw = expand("<cword>")
  else
    let keyw = Get_visual_selection()
  endif
  if a:mode == "buffers"
    exec 'Fbuffers "' . keyw . '"'
  else
    exec 'Frepo "' . keyw . '"'
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
    let l:keyw = expand("<cword>")
    call HoogleLookup( l:keyw, '' )
    " let comm = 'Hoogle ' . keyw
    " exec comm
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

