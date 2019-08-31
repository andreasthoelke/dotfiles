

" Note: This has to contain the (easy-align propriaty?) "/" syntax, so we can e.g. refer to the second column via "2\"
let g:pttnsTypeSigs4 = ['/∷/', '/.*\(∷\zs\s\|\zs⇒\)/', '/\(([^)]*\)\@<!→\([^(]*)\)\@!/', '2/\(([^)]*\)\@<!→\([^(]*)\)\@!/', '/\(([^)]*\)\@<!.*\zs→\([^(]*)\)\@!/']


" Set the contFn to be called with start/end line
" contArgs defines other/preceding (optional) args to be applied to the contFn
nnoremap ,at :let g:contFn='HsTabu'<cr>:let contArgs=[g:pttnsTypeSigs4]<cr>:set opfunc=Gen_opfunc<cr>g@
vnoremap ,at :let g:contFn='HsTabu'<cr>:let contArgs=[g:pttnsTypeSigs4]<cr>:<c-u>call Gen_opfunc('line', 1)<cr>

func! Gen_opfunc( _, ...)
  " First arg is sent via op-fn. presence of second arg indicates visual-sel
  let [l1, l2] = a:0 ? ["'<", "'>"] : [line("'["), line("']")]
  call call( g:opFuncContFn, contArgs + [l1, l2] )
endfunc


" Align/Tabularize a list of column-patters over an (optional) range of lines
func! HsTabu( columnPttns, ...)
  let startLine = a:0 ? a:1 : 1
  let endLine = a:0 ? a:2 : line('$')
  " call ReplaceInRange( startLine, endLine, g:HsReplacemMap_CharsToUnicode )
  call HsUnicode( startLine, endLine )
  " call HsUnicodeAll( startLine, endLine )
  for pttn in a:columnPttns
    call easy_align#easyAlign( startLine, endLine, pttn)
  endfor
  call HsUnUnicode( startLine, endLine )
  " call HsUnUnicodeAll( startLine, endLine )
endfunc
" call HsTabu( g:pttnsTypeSigs4 )











