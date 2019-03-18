

" call search('\v^("|--)\s─(\^|\s)\s{2}\zs\u.*\S\ze\s*──$')

nnoremap <leader>bb :echo searchpair('(', 'e', ')', 'W', 'IsE()')<cr>

nnoremap <leader>bb :echo searchpair('(', 'e', ')', 'W', 'CursorIsInString()')<cr>
  " a E b e a (f E a e d) d E "a e" f E

nnoremap <leader>bn :echo GetSyntaxIDAtCursor()<cr>




let g:infixOps = ['<$>', '<\*>', '\*>', '>>', '>>=', '++', '<>']
let g:typeArgs = ['::', '∷', '=>', '⇒', '->', '→']
let g:syntax   = ['<-', '←', '=', '\$', '`\w*`', '->', '→']
let g:numOps   = ['+', '-', '\*', '&&']
let g:newLine  = ['\n']
let g:space    = ['\s']


func! MakeOrPttn( listOfPatterns )
  return '\(' . join( a:listOfPatterns, '\|' ) . '\)'
endfunc
" echo MakeOrPttn( g:infixOps + g:typeArgs )

func! AppendSpace( listOfPatterns )
  let res = []
  for pttn in a:listOfPatterns
    call add( res, pttn . '\s\+' )
  endfor
  return res
endfunc

nnoremap W :call ExprOuterStart('')<cr>
nnoremap B :call ExprOuterStart('b')<cr>
func! ExprOuterStart(flags)
  if a:flags !~ 'b'
    " Jump to end bracket when moving forward
    call GoOtherPairIfOnPair(a:flags)
  endif
  let patList = AppendSpace(g:infixOps + g:typeArgs + g:syntax + g:numOps)
  let pttn = MakeOrPttn(patList + g:newLine) . '\zs\S'
  call searchpair( '\[\zs.\|(\zs.', pttn, '\]\|)', a:flags, 'CursorIsInsideString()' )
  " [\zs. excludes the bracket from the match and so allows to land on opening bracket when searching back
  normal! lh
endfunc


nnoremap w :call ExprInnerStart('')<cr>
nnoremap b :call ExprInnerStart('b')<cr>
func! ExprInnerStart(flags)
  if a:flags !~ 'b'
    " Jump to end bracket when moving forward
    call GoOtherPairIfOnPair(a:flags)
  endif
  let pttn = '\s\zs\S\|\n\zs.'
  " call searchpair( '\[\|(', pttn, '\]\|)', a:flags, 'CursorIsInsideString()' )
  call searchpair( '\[\zs.\|(\zs.', pttn, '\]\|)', a:flags, 'CursorIsInsideString()' )
  " [\zs. excludes the bracket from the match and so allows to land on opening bracket when searching back
  " normal! j
endfunc

" func! ExprInnerStart(flags)
"   call GoOtherPairIfOnPair(a:flags)
"   let pttn = MakeOrPttn( g:space + g:newLine ) . '\s*\zs.'
"   call searchpair( '\[\|(', pttn, '\]\|)', a:flags, 'CursorIsInsideString()' )
"   normal! lh
" endfunc

" Move to closing backet only if on opening bracket
func! GoOtherPairIfOnPair(flags)
  let cursCode = GetCharAtCursorAscii()
  " "(" = 40 "[" = 91 '"' = 34
  if cursCode == 40 || cursCode == 91
    normal! %
  " elseif cursCode == 34
  "   call search('"', a:flags)
  endif
endfunc




" let s:paren_hl_on = 0
" function s:Highlight_Matching_Paren() " ■
"   if s:paren_hl_on
"     match none
"     let s:paren_hl_on = 0
"   endif
"
"   let c_lnum = line('.')
"   let c_col = col('.')
"
"   let c = getline(c_lnum)[c_col - 1]
"   let plist = split(&matchpairs, ':\|,')
"   let i = index(plist, c)
"   if i < 0
"     return
"   endif
"   if i % 2 == 0
"     let s_flags = 'nW'
"     let c2 = plist[i + 1]
"   else
"     let s_flags = 'nbW'
"     let c2 = c
"     let c = plist[i - 1]
"   endif
"   if c == '['
"     let c = '\['
"     let c2 = '\]'
"   endif
"   let s_skip ='synIDattr(synID(line("."), col("."), 0), "name") ' .
"         \ '=~?	"string\\|comment"'
"   execute 'if' s_skip '| let s_skip = 0 | endif'
"
"   let [m_lnum, m_col] = searchpairpos(c, '', c2, s_flags, s_skip)
"
"   if m_lnum > 0 && m_lnum >= line('w0') && m_lnum <= line('w$')
"     exe 'match Search /\(\%' . c_lnum . 'l\%' . c_col .
"           \ 'c\)\|\(\%' . m_lnum . 'l\%' . m_col . 'c\)/'
"     let s:paren_hl_on = 1
"   endif
" endfunction " ▲
"
" autocmd CursorMoved,CursorMovedI * call s:Highlight_Matching_Paren()
" autocmd InsertEnter * match none
"
"
" " Is the current cursor position inside a string?
" function! s:InsideString( ... )
"     let l = a:0 ? a:1 : line('.')
"     let c = a:0 ? a:2 : col('.')
"     if &syntax == ''
"         " No help from syntax engine,
"         " count quote characters up to the cursor position
"         let line = strpart( getline(l), 0, c - 1 )
"         let line = substitute( line, '\\"', '', 'g' )
"         let quotes = substitute( line, '[^"]', '', 'g' )
"         return len(quotes) % 2
"     endif
"     " VimClojure and vim-clojure-static define special syntax for regexps
"     return s:SynIDMatch( '[Ss]tring\|clojureRegexp\|clojurePattern', l, c, 0 )
" endfunction
"
" " Find opening matched character
" function! PareditFindOpening( open, close, select )
"   let open  = escape( a:open , '[]' )
"   let close = escape( a:close, '[]' )
"   call searchpair( open, '', close, 'bW', s:skip_sc )
"   if a:select
"     call searchpair( open, '', close, 'W', s:skip_sc )
"     let save_ve = &ve
"     set ve=all 
"     normal! lvh
"     let &ve = save_ve
"     call searchpair( open, '', close, 'bW', s:skip_sc )
"     if &selection == 'inclusive'
"       " Trim last character from the selection, it will be included anyway
"       normal! oho
"     endif
"   endif
" endfunction
"
" echo searchpair('\<start\>', '', '\%(\.\_s*\)\@<!\<end\>', 'W', 'getline(".") =~ "#.*"')
"
