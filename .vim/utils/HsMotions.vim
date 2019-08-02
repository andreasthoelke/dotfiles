

func! AppendSpace( listOfPatterns )
  let res = []
  for pttn in a:listOfPatterns
    call add( res, pttn . '\_s' )
  endfor
  return res
endfunc

func! AppendExtSpace( listOfPatterns )
  let res = []
  for pttn in a:listOfPatterns
    call add( res, pttn . '\ze\_s' )
  endfor
  return res
endfunc

func! PrependSpace( listOfPatterns )
  let res = []
  for pttn in a:listOfPatterns
    call add( res, '\s\zs' . pttn )
  endfor
  return res
endfunc

func! PrependSepWord( listOfPatterns )
  let res = []
  for pttn in a:listOfPatterns
    call add( res, '\<' . pttn )
  endfor
  return res
endfunc

func! AsSeparateWord( listOfPatterns )
  let res = []
  for pttn in a:listOfPatterns
    call add( res, '\<' . pttn . '\>' )
  endfor
  return res
endfunc


func! NotInCommentLine( listOfPatterns )
  let res = []
  for pttn in a:listOfPatterns
    " call add( res, '^[^-].*\zs' . pttn )
    call add( res, '^\%(.*--\)\@!.*\zs' . pttn )
  endfor
  return res
endfunc

func! MakeOrPttn( listOfPatterns )
  return '\(' . join( a:listOfPatterns, '\|' ) . '\)'
endfunc
" echo MakeOrPttn( g:infixOps + g:typeArgs )

" TODO migrate to very-magic would require appending the '\v' via a function..!?
" func! MakeOrPttnMagic( listOfPatterns )
"   return '(' . join( a:listOfPatterns, '|' ) . ')'
" endfunc
" call append( line('.'), MakeOrPttnMagic( [g:hsBinding, '\v^func!'] ) )
" (\v^\i+\s([(),={}_a-zA-Z0-9]+\s)*\=\_s|\v^func!)

" Haskell Patterns:
" Line starts in col 1 and is not a comment (non consuming lookaround)
let g:topLevPttn = '^[^ -]'
let g:anyCharsNotBracketOrEqu = '[^=(]+'

" Top level Haskell type signature. May the colon in a new line. Exclues colons after = and inside (). '\_s' => whitespace or blank lines
" let g:topLevTypeSig = g:topLevPttn . g:anyCharsNotBracketOrEqu . '\_s' . g:anyCharsNotBracketOrEqu . MakeOrPttn( ['∷', '::'] )

let g:topLevTypeSig = '^\i\+\s\:\:'
" let g:topLevBind = '^\(\i\+\s\)\+=\s'
let g:topLevBind = '\v^\i[^:]*\='
" let g:hsBinding = '\(\i\+\s\)\+=\s'
" let g:hsBinding = '\v\i+\s([(),={}a-zA-Z0-9]+\s\=\s)'
" Issue: there are some missing chars '|:"
" let g:hsBinding = '\v^\i+\s([(),={}_a-zA-Z0-9]+\s)*\=\_s'

let g:topLevOtherPttn = '^' . MakeOrPttn( ['instance', 'data ', 'class', 'type ', 'newtype', 'func!', 'function', 'au ', 'command'] )
let g:topLevCombined = MakeOrPttn( [ g:topLevTypeSig, g:topLevOtherPttn ] )
" let g:topLevCombined = MakeOrPttn( [ g:topLevBind, g:topLevOtherPttn ] )

" ^[^ -][^=(]+\_s[^=(]+\(∷\|::\)

let g:multilineTilAfterEqual = '\_.\{-}\s=\_s\+\zs\S'

" all haskell type sig on bindings (where and let)
let g:typeSigBind = '^[^=(]*\zs' . MakeOrPttn( ['∷', '::'] )


let g:nextWordPttn = '\_s\+\zs\S'
let g:infixOps = ['<$>', '<\*>', '\*>', '>>', '>>=', '++', '<>', ':']
let g:typeArgs = ['::', '∷', '=>', '⇒', '->', '→']
let g:columnSeps = ['::', '=', '->', '→', '<-', '←', '>', '$', '\<then', '\<else', 'deriving']
let g:syntaxSym = ['<-', '←', '=', '\$', '`\w*`', '->', '→', '|', ',', '=' ]
let g:syntaxWords = PrependSepWord( ['let', 'in', 'do', 'where', 'if', 'then', 'else', 'case', 'instance'] )
let g:numOps   = ['+', '-', '\*', '&&']
" let g:fnWirePttn = MakeOrPttn( AppendSpace( ['^[^ -][^=(]*\zs∷', '^[^ -][^=(]*\zs::', 'where', 'do', ' \zsin', '^[^-].*\zsof', 'then', 'let'] ) )
let g:fnWire1Pttns = NotInCommentLine( PrependSpace( AppendSpace( ['where', 'do', 'in', 'of', 'let', 'deriving'] )) )
let g:fnWirePttn = MakeOrPttn( [g:topLevTypeSig . g:multilineTilAfterEqual] + g:fnWire1Pttns )
" let g:rhsPttn = MakeOrPttn( ['→', '->', '←', '<-', '='] )
let g:exprDelimPttn = MakeOrPttn( AppendSpace(g:infixOps + g:typeArgs + g:syntaxSym + g:syntaxWords + g:numOps) )
" let g:exprDelimPttn = MakeOrPttn( AsSeparateWord(g:infixOps + g:typeArgs + g:syntax + g:numOps) )

let g:columnSepsPttn = MakeOrPttn( AppendSpace( g:columnSeps ) )



" Buffer local maps
func! HaskellMaps()
  onoremap <silent><buffer> af :call HsBlockVisSel()<cr>
  xnoremap <silent><buffer> af :<c-u>call HsBlockVisSel()<cr>
endfunc

" ─   TopLevel                                           ■

" TODO make a local map for vim?
nnoremap <silent> <c-n> :call TopLevBindingForw()<cr>:call ScrollOff(16)<cr>
func! TopLevBindingForw()
  normal! }
  call search( g:topLevBind, 'W' )
endfunc

nnoremap <silent> <c-p> :call TopLevBindingBackw()<cr>:call ScrollOff(10)<cr>
func! TopLevBindingBackw()
  call search( g:topLevBind, 'bW' )
  normal! {
  call search( g:topLevBind, 'W' )
endfunc

" TODO still in use?
" nnoremap <silent> <c-n> :call TopLevForw()<cr>:call ScrollOff(16)<cr>
func! TopLevForw()
  call search( g:topLevCombined, 'W' )
endfunc

" nnoremap <silent> <c-p> :call TopLevBackw()<cr>:call ScrollOff(10)<cr>
func! TopLevBackw()
  call search( g:topLevCombined, 'bW' )
endfunc

func! TopLevBackwLine()
  return searchpos( g:topLevCombined, 'cnb')[0]
endfunc
" echo TopLevBackwLine()

func! TypeSigBindBackwLine()
  return searchpos( g:typeSigBind, 'cnb')[0]
endfunc

func! PrevBlockLastLine()
  " Seach back to a line that does not start with a comment
  call search('\v^(\s*--.*)@!\s*.', 'bW')
endfunc

func! TypeSigBackwLineNum()
  call searchpos( g:topLevBind, 'cnb' )[0]
endfunc



nnoremap <silent> ,<c-n> :call HsBlockLastLine()<cr>:call ScrollOff(10)<cr>
func! HsBlockLastLine()
  call TopLevForw()
  call PrevBlockLastLine()
  call IfOnSpaceGoWord()
endfunc

" now run by "af" buffer local maps
" onoremap ih :call HsBlockVisSel()<cr>
" xnoremap ih :<c-u>call HsBlockVisSel()<cr>
func! HsBlockVisSel()
  normal! l
  call TopLevBackw()
  normal! V
  call HsBlockLastLine()
  normal! o
endfunc

" ─^  TopLevel                                           ▲


" ─   Bindings, including where/let                     ──
" * `]b`, `[b` for next/prev binding
" * `cib` to change the binding name in consequtive lines
" * `<leader>rb` to rename a binding and its occurences

" Next/Prev Binding:
nnoremap <silent> ]b :call BindingForw()<cr>:call ScrollOff(16)<cr>
func! BindingForw()
  normal! W
  call search( g:typeSigBind, 'W' )
  normal! B
endfunc

nnoremap <silent> [b :call BindingBackw()<cr>:call ScrollOff(10)<cr>
func! BindingBackw()
  call search( g:typeSigBind, 'bW' )
  normal! B
endfunc

" Textobj for type-sig binding name:
" Method 1: Only useful to yank the top level name? Note that change/substitute of two lines will need one of the other approaches.
onoremap <silent> ib :<c-u>call Binding_VisSel_Name()<cr>
vnoremap <silent> ib :<c-u>call Binding_VisSel_Name()<cr>o
" Tests:
" pv0 ∷ IO Text
" pv0 = pack <$> getLine
func! Binding_VisSel_Name()
  normal! m'll
  call BindingBackw()
  normal! ve
endfunc

" Method 2: Change the name in multiple consecutive lines in place
nnoremap <leader>hcn :call BindgingChangeName()<cr>
" This overwrites "cib" textobj above! because this approach allows to change multiple lines
nnoremap cib :call BindingChangeName()<cr>
func! BindingChangeName()
  normal! m'll
  call BindingBackw()
  call VisualBlockMode()
  if MatchesInLine( line('.'), 'let' ) " let is the only word that can preced the local binding?
    normal! je
  else " can span multiple lines based on indent
    normal ,je
  endif
  call feedkeys("c")
endfunc

" Method 3: Rename binding. Replace all occurrences of the next binding name in the Hs-Block
nnoremap <leader>rb :call BindingRename()<cr>
func! BindingRename()
  normal! m'll
  call BindingBackw()
  let cw = expand('<cword>')
  normal Vaf
  let linesRangeStr = "'<,'>"
  normal! V
  call ReplacePattern( linesRangeStr, cw )
endfunc



" ─   Paragraph Movement                                ──

" Next Paragraph:
nnoremap <silent> <c-l> :call ParagNext()<cr>
vnoremap <silent> <c-l> }
func! ParagNext()
  exec "silent keepjumps normal! }"
  call JumpNextNonEmptyLine()
endfunc
func! JumpNextNonEmptyLine()
  call search('^.\+')
  call IfOnSpaceGoWord()
endfunc
func! IfOnSpaceGoWord()
  " Jump to next word if cursor is on space
  if getline('.')[col('.')-1] == ' '
    normal! w
  endif
endfunc

" Previous Paragraph:
nnoremap <silent> <c-h> :call ParagPrev()<cr>
vnoremap <silent> <c-h> {k$
func! ParagPrev()
  let startLineNum = line('.')
  exec "silent keepjumps normal! {w"
  if line('.') == startLineNum
    exec "silent keepjumps normal! {{w"
  endif
endfunc

" End Of Paragraph Motions And OpPending:
" The motion jumps to the *beginning* of the last line
nnoremap <silent> ,<c-l> :<C-u>exec "keepjumps norm! " . v:count1 . "}-"<CR>
" The OpPending map spans to the *end* of the last line
onoremap <silent> ,<c-l> :<C-u>exec "keepjumps norm! " . v:count1 . "}$"<CR>
" The VisSel map spans to the *end* of the last line
vnoremap <silent> ,<c-l> }-g_
" Jump to the beginning of the last line of the previous paragraph
nnoremap <silent> ,<c-h> :<C-u>exec "keepjumps norm! " . v:count1 . "{{}-"<CR>

" Keep jumps with native paragraph motions
nnoremap } :<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>
nnoremap { :<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>


" ─   Indention                                          ■

" TIP: get the string/spaces of how much a line is indented: let indent = matchstr(getline(lnr), '^\s*\ze')

nnoremap ,j  :call IndentBlockEnd()<cr>
onoremap ,j V:call IndentBlockEnd()<cr>
nnoremap ,k  :call IndentBlockStart()<cr>
onoremap ,k V:call IndentBlockStart()<cr>
vnoremap <silent> ,j <esc>:call ChangeVisSel(function('IndentBlockEnd'))<cr>
vnoremap <silent> ,k <esc>:call ChangeVisSel(function('IndentBlockStart'))<cr>

func! IndentBlockEnd()
  normal! m'^
  call setpos('.', IndentBlockEndPos( line('.'), col('.'), 1 ) )
endfunc

func! IndentBlockStart()
  normal! m'^
  call setpos('.', IndentBlockEndPos( line('.'), col('.'), -1 ) )
endfunc

func! IndentBlockEndPos( lineNum, indentLevel, dir )
  let lineOffset = 0
  while IndentLevel( a:lineNum + lineOffset ) == a:indentLevel
    let lineOffset = lineOffset + a:dir
  endwhile
  return [0, a:lineNum + (lineOffset - a:dir), a:indentLevel, 0]
endfunc

" Textobject for Indent Block
onoremap ii :<c-u>call IndentBlock_VisSel_Inside()<cr>
vnoremap ii :<c-u>call IndentBlock_VisSel_Inside()<cr>
func! IndentBlock_VisSel_Inside()
  normal! m'
  call IndentBlockStart()
  normal! V
  call IndentBlockEnd()
  normal! o
endfunc

" From Stackoverflow: move to line of same indent!
nnoremap ,J ^:call IndentBlockEnd()<cr>:call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>
nnoremap ,K ^:call IndentBlockStart()<cr>:call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
" TODO where is this useful in typical hasekell layout?

" ─^  Indention                                          ▲


" Argument Movement: Note the is Vim-targets related
" Move to current-next argument - the B before the next ','
nnoremap <localleader>a f,B
" Move to the next argument - the B before the next ',' after the next ','
nnoremap ,a f,;B
" Move to the previous argument - the B before the previous ','
nnoremap ,A F,B



" ⎼⎼⎼⎼ Haskell Movement Textobjects ⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼



" Vimscript Movement: -------------

" Not needed any more as this is included in haskell toplevel?
" func! VimScriptMaps()
"   nnoremap <silent><buffer> <c-p> :call VimPrevCommentTitle()<cr>:call ScrollOff(10)<cr>
"   nnoremap <silent><buffer> <c-n> :call VimNextCommentTitle()<cr>:call ScrollOff(16)<cr>
" endfunc

" Vim Patterns:
let g:Ptn_VimCommentTitle = '^"\s\u\a*(\s+\u\a*)*:'

func! VimPrevCommentTitle()
  call search('\v' . g:Ptn_VimCommentTitle, 'bW')
endfunc

func! VimPrevCommentTitle()
  call search('\v' . g:Ptn_VimCommentTitle, 'W')
endfunc



" Textobjects: -----------------------------------
" ie = inner entire buffer
onoremap iB :<c-u>exec "normal! ggVG"<cr>
vmap iB :<c-u>exec "normal! ggVGo"<cr>
" iv = current viewable text in the buffer
onoremap iv :<c-u>exec "normal! HVL"<cr>
vmap iv ,Ho,L

" Needed for textobj-markdown because of conflict with textobj-function?
" omap <buffer> af <plug>(textobj-markdown-chunk-a)
" omap <buffer> if <plug>(textobj-markdown-chunk-i)
" omap <buffer> aF <plug>(textobj-markdown-Bchunk-a)
" omap <buffer> iF <plug>(textobj-markdown-Bchunk-i)

" Movement Naviagation:  ---------------------------------------------------------------------

" --------------


" TODO add long moves to jumplist as reverting moves would be challenging to perform?

" Tab is the 'ballpark' motion - it gets you into constituting areas in a function
nnoremap <silent> <c-m> :call FnAreaForw()<cr>
nnoremap <silent> <c-i> :call FnAreaBackw()<cr>
func! FnAreaForw()
  " Step back is needed to find keywords that are being skipped to from a prev keyword, e.g. a 'do' after '='
  normal! h
  let [oLine, oCol] = getpos('.')[1:2]
  " Find the next hotspot keyword
  call SearchSkipSC( g:fnWirePttn, 'W' )
  if CursorIsInsideComment() || CursorIsInsideString()
    normal! w
    call FnAreaForw()
  else
    " Now on the hotspot keyword make specific next/second steps
    call SkipBinding()
  endif
  call ScrollOff(16)
  " Undo initial step back in case no match was found
  let [nLine, nCol] = getpos('.')[1:2]
  if oLine==nLine && oCol==nCol
    normal! l
  endif
endfunc

func! FnAreaBackw()
  let [oLine, oCol] = getpos('.')[1:2]
  " Find the prev hotspot keyword
  call SearchSkipSC( g:fnWirePttn, 'bW' )
  " Now on the hotspot keyword make specific next/second steps
  call SkipBinding()
  let [nLine, nCol] = getpos('.')[1:2]
  if oLine==nLine && oCol==nCol
    call SearchSkipSC( g:fnWirePttn, 'bW' )
    call SearchSkipSC( g:fnWirePttn, 'bW' )
    call SkipBinding()
    " It still has not moved? then do 3 steps back ■
    let [nLine, nCol] = getpos('.')[1:2]
    if oLine==nLine && oCol==nCol
      echoe 'ok this code is still needed!'
      call SearchSkipSC( g:fnWirePttn, 'bW' )
      call SearchSkipSC( g:fnWirePttn, 'bW' )
      call SearchSkipSC( g:fnWirePttn, 'bW' )
      call SkipBinding()
    endif " ▲
  endif
  if CursorIsInsideComment() || CursorIsInsideString()
    call FnAreaBackw()
  endif
  call ScrollOff(10)
endfunc

" Optional highlighting of fnAreakeywords:
" doesn't work with multiple files, also slow - obsolete?
func! HighlightFnArea( on )
  if a:on && !g:hlAreaID
    let g:hlAreaID = matchadd('BlackBG', '\(\s\zswhere\ze\_s\|\s\zsdo\ze\_s\|\s\zsin\ze\_s\|\s\zscase\ze\_s\|\s\zsthen\ze\_s\|\s\zslet\ze\_s\)')
  elseif !a:on && g:hlAreaID
    call matchdelete( g:hlAreaID )
    let g:hlAreaID = 0
  else
    echo 'already set!'
  endif
endfunc
let g:hlAreaID = 0
" call HighlightFnArea(1)
" call HighlightFnArea(0)
" let g:fnWire2Pttns = PrependSpace( AppendExtSpace( ['where', 'do', 'in', 'case', 'then', 'let'] ))
" call append( line('.'), MakeOrPttn( g:fnWire2Pttns ) )
" call matchdelete( abc )
" call clearmatches()

" RHS movement:
nnoremap J j^
nnoremap K k^

" Column movement:
nnoremap <silent> I :call ColumnMotionForw()<cr>
nnoremap <silent> Y :call ColumnMotionBackw()<cr>
func! ColumnMotionForw() " ■
  if !search('\S', 'nW') " cancel recursive call at end of file
    return
  endif

  normal! j0
  let [oLine, oCol] = getpos('.')[1:2]

  " Approach: Find column delimiter on the same bracket level, skip matches in Strings
  let [sLine, sColumn] = searchpos( g:columnSepsPttn, 'nW' )
  " echo 'Delim found at: ' . sLine . ' - ' . sColumn

  if sLine == oLine
    call setpos('.', [0, sLine, sColumn, 0] )
    " echo 'Delim motion to: ' . sLine . ' - ' . sColumn
    normal! W
  else
    " There is no column delimiter in the next/previous line → try again on the next line
    call ColumnMotionForw()
    return
  endif

  " Now that a column was found, test a few excape conditions:
  " if IsEmptyLine( line('.') ) || IsTypeSignLine(line('.')) || CursorIsInsideComment() || IsInsideSyntaxStackId( line('.'), col('.'), 'functionDecl' )
  if IsEmptyLine( line('.') )
    call ColumnMotionForw()
  endif

  " Skip to next column if on let/do and if there is another delim in the same line jump to after that delimiter
  let cw = expand('<cword>')
  if cw == 'do' || cw == 'let'
    let [nLine, nColumn] = searchpairpos( '{\|\[\|(', g:columnSepsPttn, '}\|\]\|)', 'nW', 'CursorIsInsideStringOrComment()' )
    if nLine == sLine
      call setpos('.', [0, nLine, nColumn, 0] )
      normal! W
    endif
  endif
  if cw == 'deriving'
    normal! W
  endif
endfunc " ▲


func! ColumnMotionBackw() " ■
  let origPos = getpos('.')
  normal! k0
  let [oLine, oCol] = getpos('.')[1:2]

  " Approach: Find column delimiter on the same bracket level, skip matches in Strings
  let [sLine, sColumn] = searchpos( g:columnSepsPttn, 'nW' )
  " echo 'Delim found at: ' . sLine . ' - ' . sColumn

  if sLine == oLine
    call setpos('.', [0, sLine, sColumn, 0] )
    " echo 'Delim motion to: ' . sLine . ' - ' . sColumn
    normal! W
  else
    " call setpos('.', [0, sLine, sColumn, 0] )
    " There is no column delimiter in the next/previous line → try again on the next line
    call ColumnMotionBackw()
    return
  endif

  " Now that a column was found, test a few excape conditions:
  " if IsEmptyLine( line('.') ) || IsTypeSignLine(line('.')) || CursorIsInsideComment() || IsInsideSyntaxStackId( line('.'), col('.'), 'functionDecl' )
  if IsEmptyLine( line('.') )
    normal! k
    call ColumnMotionBackw()
  endif

  " Skip to next column if on let/do and if there is another delim in the same line jump to after that delimiter
  let cw = expand('<cword>')
  if cw == 'do' || cw == 'let'
    let [nLine, nColumn] = searchpairpos( '{\|\[\|(', g:columnSepsPttn, '}\|\]\|)', 'nW', 'CursorIsInsideStringOrComment()' )
    if nLine == sLine
      call setpos('.', [0, nLine, nColumn, 0] )
      normal! W
    endif
  endif
  if cw == 'deriving'
    normal! W
  endif

  if getpos('.') == origPos
    normal! k
    call ColumnMotionBackw()
  endif
endfunc " ▲



" Search skip matches in comments and strings. E.g. search again when match is in string or comment
" Note: LimitLine may prevent that an early match in a string/comment gets skipped. Basically limitLine and skipping do not work in case both is needed in one search
func! SearchSkipSC( pttn, flags, ...)
  if a:0 " Optional: stopline
    let mtch = search( a:pttn, a:flags, a:1 )
  else
    let mtch = search( a:pttn, a:flags )
  endif
  if GetSyntaxIDAtCursor() =~ '\(string\|comment\)' && mtch
    let curCar = GetCharAtCursor()
    if curCar == '"'
      " Cursor is on quote/ start/end of the string
      return
    elseif a:0 " Optional: stopline
      call SearchSkipSC( a:pttn, a:flags, a:1 )
    else
      call SearchSkipSC( a:pttn, a:flags )
    endif
  endif
endfunc
" call SearchSkipSC( 'abc', 'W', line('.')+2 )
" call SearchSkipSC( 'abc', 'W' )
" aa bb abc aa
" aa bb 'abc ' aa
" aa bb abc aa

func! SkipBinding()
  let cw = expand('<cword>')
  let cc = GetCharAtCursorAscii()
  if cw == 'do'
    call ExprInnerStartForw()
    " Only move to rhs if there is one in the same line. Cursor is on the type of the do block not a bound var call search( '\s\(←\|<-\)' . g:nextWordPttn, '', line('.') )
    call SearchSkipSC( '\s\(←\|<-\)' . g:nextWordPttn, '', line('.') )
  elseif cw == 'where' || cw == 'let'
    call ExprInnerStartForw()
    " Move to rhs and skip over line type signatures
    call SearchSkipSC( '\s=' . g:nextWordPttn, '', line('.') +3 )
  elseif cw == 'of'
    " Only move to rhs if there is one in the same line
    call SearchSkipSC( '\s\(→\|->\)' . g:nextWordPttn, '', line('.') +3 )
  elseif cw == 'then' || cw == 'in'
    normal! w
  elseif cc == 8759 || cc == 58
    normal! w
    call SearchSkipSC( '\s=' . g:nextWordPttn, '' )
  endif
endfunc



" Outer Expression:
" Textobject to select inside an OuterExpression
onoremap iW :call ExprOuter_VisSel_Inside()<cr>
xnoremap iW :<c-u>call ExprOuter_VisSel_Inside()<cr>
" Test: viWo,W               v    |             v        ← cursor on "|", result sel on "v"
                 " hello >>= Just 123  >> Just 43 <*> (map eins) >> Abc
func! ExprOuter_VisSel_Inside()
  normal! m'
  " Make sure the cursor is not at the start of the expression, as this would select the previous expression
  normal! l
  call ExprOuterStartBackw()
  normal! v
  call ExprOuterEndForw()
  " rolling back the 'l' in the ExprOuterEndForw()
  normal! ho
endfunc

" Textobject to select around an OuterExpression
onoremap aW :call ExprOuter_VisSel_Around()<cr>
xnoremap aW :<c-u>call ExprOuter_VisSel_Around()<cr>
func! ExprOuter_VisSel_Around()
  normal! m'
  " Make sure the cursor is not at the start of the expression, as this would select the previous expression
  normal! l
  call ExprOuterStartBackw()
  normal! v
  call ExprOuterStartForw()
  normal! ho
endfunc
" Test: viW, vaW, yiW, yaW
" hello >>= Just 123  >> Just 43 <*> map eins

nnoremap <silent> W :call ExprOuterStartForw()<cr>
onoremap <silent> W :call ExprOuterStartForw()<cr>
vnoremap <silent> W <esc>:call ChangeVisSel(function('ExprOuterStartForw'))<cr>
" Test: vB,WoW     v     |           v        ← cursor on "|", result sel on "v"
" hello >>= Just 123  >> Just 43 <*> (map eins) >> Abc
func! ExprOuterStartForw() " ■
  if !search('\S', 'nW') " cancel recursive call at end of file
    return
  endif

  let [oLine, oCol] = getpos('.')[1:2]
  " When on bracket, jump to the end of the bracket
  call FlipToPairChar('')

  " Approach: Find expression delimiter on the same bracket level, skip matches in Strings
  let [sLine, sColumn] = searchpairpos( '{\|\[\|(', g:exprDelimPttn, '}\|\]\|)', 'nW', 'CursorIsInsideString()' )
  " echo 'Delim found at: ' . sLine . ' - ' . sColumn

  " Set Cursor:
  if sLine == oLine
    " Forward and backward matches on the same line
    call setpos('.', [0, sLine, sColumn, 0] )
    " echo 'Delim motion to: ' . sLine . ' - ' . sColumn
    normal! W
    " Match found in a later line - move to the start of next line instead!
  else
    " Edge Case: When a () or [] occurs after the last delimiter, 'searchpair' below matches it
    if EmptyBracketAhead()
      " echo 'empty bracket skip to next line: ' . line('.')
      call search('\n', 'c')
      normal! w
    else
      " echo 'moved to next line - skipping brackets'
      call searchpair( '\[\|{\|(', '\n', '.\ze\]\|.\ze)\|.ze}', 'cW', 'CursorIsInsideString()' )
      " .\ze allows a newline match right after a parentheses by requiring ) but excluding it from the match
      " Issue: This alays matches [] and () - see Edge Case note above
      " Jumps to the first char of the next line. But ..
      normal! W
    endif
    " The first char of a new line is not always a good landing place
    if CursorOnSkipNextWordCharOrWord()
      " Just jump to the next word, which might be another undesirable word ..
      normal! W
    endif
  endif

  " Escape Again: Additional escapes from unwanted spots
  if CursorOnSkipNextWordCharOrWord()
    normal! W
  endif
  if IsEmptyLine( line('.') )
    call ExprOuterStartForw()
  endif
endfunc " ▲

" Move to the end of an expression
nnoremap <silent> ,W :call ExprOuterEndForw()<cr>h
" Select till the end of an expression
onoremap <silent> ,W :call ExprOuterEndForw()<cr>
" Test: W,W   y,W   c,W  ,W,W  vW,W,W
" hello >>= Just 123  >> Just 43 <*> (map eins) >> Abc
" Visual select does not work easyly, would require separate function
" vnoremap <silent> ,W m':<c-u>call ExprOuterEndForw()<cr>v<c-o>
vnoremap <silent> ,W <esc>:call ChangeVisSel(function('ExprOuterEndForw'))<cr>h
" Test: v,W,W
func! ExprOuterEndForw() " ■
  let [oLine, oCol] = getpos('.')[1:2]
  " When on bracket, jump to the end of the bracket
  call FlipToPairChar('')
  normal! e

  " Approach: Find expression delimiter on the same bracket level, skip matches in Strings
  let [sLine, sColumn] = searchpairpos( '{\|\[\|(', g:exprDelimPttn, '}\|\]\|)', 'nW', 'CursorIsInsideString()' )
  " echo 'Delim found at: ' . sLine . ' - ' . sColumn

  " Set Cursor:
  if sLine == oLine
    " Forward and backward matches on the same line
    call setpos('.', [0, sLine, sColumn, 0] )
    " echo 'Delim motion to: ' . sLine . ' - ' . sColumn
    normal! ge

    " Match found in a later line - move to the start of next line instead!
  else
    " Edge Case: When a () or [] occurs after the last delimiter, 'searchpair' below matches it
    if EmptyBracketAhead()
      " echo 'empty bracket skip to next line: ' . line('.')
      call search('\n', 'c')
      normal! ge
    else
      " echo 'moved to next line - skipping brackets'
      call searchpair( '\[\|{\|(', '\n', '.\ze\]\|.\ze)\|.ze}', 'cW', 'CursorIsInsideString()' )
      " .\ze allows a newline match right after a parentheses by requiring ) but excluding it from the match
      " Issue: This alays matches [] and () - see Edge Case note above
      " Jumps to the first char of the next line. But ..
      normal! ge
    endif
    " The first char of a new line is not always a good landing place
    if CursorOnSkipNextWordCharOrWord()
      " Just jump to the next word which another undesirable word ..
      normal! ge
    endif
  endif
  " Needed for the onoremap. needs to be undone for the inner textobject
  normal! l
endfunc " ▲

nnoremap <silent> B :call ExprOuterStartBackw()<cr>
vnoremap <silent> B <esc>:call ChangeVisSel(function('ExprOuterStartBackw'))<cr>
func! ExprOuterStartBackw() " ■
  let [oLine, oCol] = getpos('.')[1:2]
  " Move backward to (presumably) the prev delim match, so it doesn't match again in this back motion
  normal! B
  if line('.') < oLine " if the jump back was to the prev line - undo that jump!
    normal! W
  endif

  " Find expression delimiter on the same bracket level, skip matches in Strings
  let [sLine, sCol] = searchpairpos( '{\|\[\|(', g:exprDelimPttn, '}\|\]\|)', 'bnW', 'CursorIsInsideString()' )
  " echo 'Delim found at: ' . sLine . ' - ' . sCol

  if sLine == oLine
    " Match on the same line
    call setpos('.', [0, sLine, sCol, 0] )
    " echo 'Delim motion to: ' . sLine . ' - ' . sCol
    normal! W

  else
    " Match found in preceding line, but move/test to move to the start of this line first
    normal! ^
    if col('.') == oCol || CursorOnSkipNextWordCharOrWord()
      " Cursor already was at first char or moved to a → ⇒ < >
      if sLine < oLine -1 " Don't skip a line - go to start of prev line instead
        normal! k^
        if CursorIsOnClosingBracket() " Want to land at the start of the bracket
          normal! %
        elseif IsEmptyLine( line('.') )
          call ExprOuterStartBackw()
        endif
      else
        " Go to the demimiter match - the 'normal' jump back
        call setpos('.', [0, sLine, sCol, 0] )
        if CursorOnSkipBackwStopWord()
          call ExprOuterStartBackw()
        else
          normal! W
        endif
      endif
    endif
  endif
  " normal! lh

  " Escape Again: Additional escapes from unwanted spots
  " let cword = expand('<cword>')
  " if cword == 'let\|case\|if\|where' " A 'let' appears after a delim (=)
  "     call ExprOuterStartBackw()
  " endif
endfunc " ▲


" is this needed? - extend to empty bracket?
func! CursorIsOnEmptyList()
  let line = getline('.')
  let c1 = strgetchar( line, virtcol('.')-1 )
  let c2 = strgetchar( line, virtcol('.') )
  return (c1 == 40 && c2 == 41) || (c1 == 91 && c2 == 93) || (c1 == 123 && c2 == 125)
endfunc
" echo CursorIsOnEmptyList()
" Test: ab () [] {}

func! ChangeVisSel( fn_motion )
  let [lineOther, colOther] = GetVisSelOtherEnd()
  " Perform motion of the cursor
  call a:fn_motion()
  " Get the new cursor pos
  let [nLine, nCol] = getpos('.')[1:2]
  " Set the visual sel
  call setpos( "'<", [0, lineOther, colOther, 0] )
  call setpos( "'>", [0, nLine, nCol, 0] )
  " activate the selection
  normal! gv
endfunc
vmap <silent><leader>cn <esc>:call ChangeVisSel( function('ExprInnerStartForw') )<cr>
" Test: Just ein >>= Some 4 [3, 4] <$> More "a"

func! SetVisSel( l1, c1, l2, c2 )
  call setpos( "'<", [0, a:l1, a:c1, 0] )
  call setpos( "'>", [0, a:l2, a:c2, 0] )
  normal! gv
endfunc
" call SetVisSel( line('.'), col('.') +3, line('.'), col('.') -2 )
" The "'>" always sets the focus in vis-sel

" Considering the current cursor pos marks one end of the vis-sel, return the other end of the visual selection
func! GetVisSelOtherEnd()
  " The vis-sel needs to be canceled in order to be able to access the cursorpos
  let cursorPos = getpos('.')[1:2]
  let visStart = getpos("'<")[1:2]
  let visEnd   = getpos("'>")[1:2]
  return cursorPos == visStart ? visEnd : visStart
endfunc
" Test: Select a range - use 'o' to change cursor - unselect - running the line will still consider 'gv' selection
" echo GetVisSelOtherEnd()
vmap <silent><leader>cn :<c-u>call TestVisSel()<cr>"
" The vis-sel needs to be canceled in order to be able to access the cursorpos
vmap <silent><leader>cc <esc>:call TestVisSel()<cr>
nmap <silent><leader>cn :call TestVisSel()<cr>
vmap <silent><leader>cn :call TestVisSel()<cr>
func! TestVisSel()
  echo GetVisSelOtherEnd()
  normal! gv
endfunc " ▲
" Cursor pos is always == visual start


" ─   Next/prev in comma separated lists                 ■
nnoremap <silent> t :call CommaItemStartForw()<cr>
onoremap <silent> T :call CommaItemStartForw()<cr>
" Note/Test: The "T" is meant to avoid the "t"/till here - test this
vnoremap <silent> t <esc>:call ChangeVisSel(function('CommaItemStartForw'))<cr>
nnoremap <silent> T :call CommaItemStartBackw()<cr>
vnoremap <silent> T <esc>:call ChangeVisSel(function('CommaItemStartBackw'))<cr>
" Can't remap omap t, as this is the 't'ill map
" onoremap <silent> t :call CommaItemStartBackw()<cr>
" Test: tttlvTot           v           |     v
" allLanguages = [Haskell, Agda abc,  Idris, PureScript]
func! CommaItemStartForw() " ■
  let [oLine, oCol] = getpos('.')[1:2]
  " When on bracket, jump to the end of the bracket
  call FlipToPairChar('')
  " Find delimiter on the same bracket level, skip matches in Strings
  " let [sLine, sCol] = searchpairpos( '{\|\[\|(', ',', '}\|\]\|)', 'nW', 'CursorIsInsideStringOrComment()' )
  " Test this: I may want to use this in comments and strings?!
  let [sLine, sCol] = searchpairpos( '{\|\[\|(', ',', '}\|\]\|)', 'nW' )
  " echo sLine . '-' . sCol
  if sLine && sLine < (oLine + 5)
    call setpos('.', [0, sLine, sCol, 0] )
    if CursorIsOnClosingBracket()
      normal! %
    else
      normal! w
    endif
  else
    call BracketStartForw()
  endif
endfunc " ▲

func! CommaItemStartBackw()
  let [oLine, oCol] = getpos('.')[1:2]
  " Move backward to (presumably) the prev delim match, so it doesn't match again in this back motion
  " Find delimiter on the same bracket level, skip matches in Strings
  let [sLine, sCol] = searchpairpos( '{\|\[\|(', ',', '}\|\]\|)', 'bnW', 'CursorIsInsideStringOrComment()' )
  if sLine && sLine > (oLine - 5)
    call setpos('.', [0, sLine, sCol, 0] )
    normal! w
    let [nLine, nCol] = getpos('.')[1:2]
    if nLine < oLine || nCol < (oCol - 3) " Has already done a significant movement
      return
    else " Get ready for step 2 - revert the word motion
      normal b
    endif
  else
    call BracketStartBackw()
    return
  endif
  " Second step
  let [sLine, sCol] = searchpairpos( '{\|\[\|(', ',\|{\|\[\|(', '}\|\]\|)', 'bnW', 'CursorIsInsideStringOrComment()' )
  if sLine && sLine > (oLine - 5)
    call setpos('.', [0, sLine, sCol, 0] )
    call search('\S')
  else
    call search('\S')
  endif
endfunc
" ─^  Next/prev in comma separated lists                 ▲


" ─   Comma textobjects                                  ■
onoremap <silent> at :<c-u>call CommaItem_VisSel_Around()<cr>
vnoremap <silent> at :<c-u>call CommaItem_VisSel_Around()<cr>o
onoremap <silent> it :<c-u>call CommaItem_VisSel_Inside()<cr>
vnoremap <silent> it :<c-u>call CommaItem_VisSel_Inside()<cr>o
" Test: cat, yat, vat, vit, vit<o>
" allLanguages = [Haskell, Agda abc,  Idris, PureScript]

func! CommaItem_VisSel_Around()
  normal! m'
  " Move to the start of the item
  call CommaItemStart()
  " and save that position
  let [sLine, sCol] = getpos('.')[1:2]
  " now move to the end of the item, then to the start of the next and back one step
  call CommaItemEnd()
  normal! Wh
  let [eLine, eCol] = getpos('.')[1:2]
  call setpos( "'<", [0, sLine, sCol, 0] )
  call setpos( "'>", [0, eLine, eCol, 0] )
  " activate the selection
  normal! gv
endfunc

func! CommaItem_VisSel_Inside()
  normal! m'
  call CommaItemStart()
  let [sLine, sCol] = getpos('.')[1:2]
  call CommaItemEnd()
  let [eLine, eCol] = getpos('.')[1:2]
  call setpos( "'<", [0, sLine, sCol, 0] )
  call setpos( "'>", [0, eLine, eCol, 0] )
  normal! gv
endfunc
" ─^  Comma textobjects                                  ▲


" ─   Start of next/prev bracket                         ■
nnoremap <silent> ]t :call BracketStartForw()<cr>
vnoremap <silent> ]t <esc>:call ChangeVisSel(function('BracketStartForw'))<cr>
nnoremap <silent> [t :call BracketStartBackw()<cr>
vnoremap <silent> [t <esc>:call ChangeVisSel(function('BracketStartBackw'))<cr>
" See the 't' tests above. In tests file see BracketStartForw. Note the visual maps will hardly be needed
" Issue: t/T and ]t/[t is not very intuitive
" Tests: just some ]t]t]t and some [t[t[t - note this jumps to start of comment and other 'wrong' spots - but that's ok
" eitherDecode "[1,2,[3,true]]" ∷ Either String (Int, Int, (Int, Bool))
func! BracketStartForw()
  if CursorIsOnOpeningBracket() " If on opening bracket, make sure to jump into the bracket
    normal! h
  endif
  let [oLine, oCol] = getpos('.')[1:2]
  let [sLine, sCol] = searchpos( '{\|\[\|(', 'nW' )
  if sLine && sLine < (oLine + 15)
    call setpos('.', [0, sLine, sCol, 0] )
    if CursorIsOnEmptyList()
      normal! ll
      call BracketStartForw()
    else
      call search('\S')
    endif
  endif
endfunc

func! BracketStartBackw()
  let [oLine, oCol] = getpos('.')[1:2]
  let [sLine, sCol] = searchpos( '{\|\[\|(', 'bnW' )
  if sLine && sLine > (oLine - 15)
    call setpos('.', [0, sLine, sCol, 0] )
    normal! w
  endif
  " If the cursor has not moved we are already at the start of a list → go back to the outer or previous lists start
  let [nLine, nCol] = getpos('.')[1:2]
  if oLine==nLine && oCol==nCol
    call searchpos( '{\|\[\|(', 'bW' )
    call BracketStartBackw()
  endif
endfunc
" ─^  Start of next/prev bracket                         ▲

" End of a list: 
" Move to the end of a list, ready to insert the next item.
nnoremap <silent> ]T :call BracketEndForw()<cr>
vnoremap <silent> ]T <esc>:call ChangeVisSel(function('BracketEndForw'))<cr>h
" Test: t]Ti,<space>JS<esc>
" allLanguages = [ Haskell, Agda abc,  Idris, PureScript ]
func! BracketEndForw()
  " Don't be stuck at previous location
  normal! l
  let [oLine, oCol] = getpos('.')[1:2]
  let [sLine, sCol] = searchpos( '}\|\]\|)', 'nW' )
  if sLine && sLine < (oLine + 15)
    call setpos('.', [0, sLine, sCol, 0] )
    normal! BE
  endif
endfunc

" TODO is this still needed? ■
" Note the difference to CommaItemStartBackward. This one is not meant to progressively move back
" nnoremap <silent> <localleader>T :call CommaItemStart()<cr>
" func! CommaItemStart()
"   call search( '\([\|(\|{\|,\)', 'bW')
"   normal! w
" endfunc

" nnoremap <silent> <localleader>t :call CommaItemEnd()<cr>
" vnoremap <silent> <localleader>t <esc>:call ChangeVisSel(function('CommaItemEnd'))<cr>
" func! CommaItemEnd()
"   call searchpair( '{\|\[\|(', '\(,\|}\|\]\|)\)', '}\|\]\|)', 'W' )
"   normal! h
" endfunc ▲


" ─   HsWord                                            ──
" - skip brackets and quotes
" - skip lambda var
" - skip namesspaced/dots in var - use camelcase motion instead
" - skip closing pairs on forward and opening pairs on backward motion
"   * basically everything that is a one char delim is better addressed by 'h' and 'l' motions
"   * back motion jumps to beginning of var, not adjasant opening bracket/pair
" - skip empty lines
nnoremap <silent> w :call ExprInnerStartForw()<cr>
nnoremap <silent> b :call ExprInnerStartBackw()<cr>
vnoremap <silent> w <esc>:call ChangeVisSel(function('ExprInnerStartForw'))<cr>
vnoremap <silent> b <esc>:call ChangeVisSel(function('ExprInnerStartBackw'))<cr>
" Test: vbbbowww      v        |                v     ← cursor on "|", result sel on "v"
" hello >>= Just 123  >> Just 43 <*> (map eins) >> Abc
func! ExprInnerStartForw()
  " When on bracket, jump to the end of the bracket
  call FlipToPairChar('')
  normal! W
  if IsEmptyLine( line('.') )
    call ExprInnerStartForw()
  endif
endfunc

func! ExprInnerStartBackw()
  call MoveBackIfOpeningPairIsNext()
  " Could not escape brackets/quotes otherwise

  let [oLine, oColumn] = getpos('.')[1:2]

  " First Char: Go to end of prev line
  if IsColOfFirstChar( col('.') )
    " go to the previous line - 'l' is to not skip over one letter vars
    normal! k$ll
  endif

  " 
  if IsColOfLastChar( col('.')-1 ) || CursorIsAtStartOfWord()
    if ClosPairAtEndOfPrevWord()
      call search('\S\(\s\|\n\)', 'b')
      " flip to the start of the bracket. If on a quote, flip to a preceding quote mark
      call FlipToPairChar('b')
    else
      call NormalMoveBack()
    endif
  else
    call NormalMoveBack()
  endif

  if IsEmptyLine( line('.') )
    call ExprInnerStartBackw()
  endif
endfunc

func! NormalMoveBack()
  normal! B
  call MoveIntoPairIfOnOpeningPair()
endfunc

" Move to closing backet only if on opening bracket
func! FlipToPairChar(flags)
  let forwMo = a:flags !~ 'b'
  let ac = GetCharAtCursorAscii()
  " "()"=40 "[]"=91,93 "{}"=123,125 '"'=34 `=96 "'"=39

  " Brackets:
  " Only opening brackets will flip on forward motion
  if forwMo && (ac==40 || ac==91 || ac==123)
    normal! %
  endif
  " Only closing brackets will flip on backward motion
  if !forwMo && (ac==41 || ac==93 || ac==125)
    normal! %
  endif

  " String Quote:
  if ac == 34
    let [line, col] = getpos('.')[1:2]
    " Example ForwardMotion:  cursor is →"Some Str"
    " Makes sure we are at the start quote when moving forward
    if     forwMo  && IsInsideString( line, col +1 )
      call search('"', a:flags)
    " Example BackwardMotion:            "Some Str"← cursor is there
    " Makes sure we are at the end quote when moving backward
    elseif !forwMo && IsInsideString( line, col -1 )
      call search('"', a:flags)
    endif
  endif

  " Other Quote Types:
  if ac == 39
    call search("'", a:flags)
  elseif ac == 96
    call search('`', a:flags)
  endif
endfunc

" Move to closing backet only if on opening bracket
func! EmptyBracket()
  let cursCode = GetCharAtCursorAscii()
  " "(" = 40 "[" = 91 '"' = 34
  " if cursCode == 40 || cursCode == 91 || cursCode == 123
    return search('[]\|()', 'n') == line('.')
  " endif
endfunc

func! EmptyBracketAhead()
  return PttnIsFirst('[]\|()', g:exprDelimPttn, '') && PttnIsFirst('[]\|()', '\n', '')
endfunc
" echo EmptyBracketAhead()
    " test
" eins <*> zwei [] ab

func! ClosPairAtEndOfPrevWord()
  return !PttnIsFirst( '\()\|\]\|}\|"\)\(\s\|\n\)', '\S\(\s\|\n\)', 'b')
endfunc
" echo ClosPairAtEndOfPrevWord()
" Test: ab (ab) abc [abc] dcfd "abc" ghi jkl
" call TestA(')\s', '\S\s')

func! MoveIntoPairIfOnOpeningPair()
  if GetCharAtCursor() =~ '(\|\[\|{\|"'
    normal! l
    call MoveIntoPairIfOnOpeningPair()
  endif
endfunc
" Test: ab (ab) abc (["abc"]) {dcfd} "abc" ghi jkl

" Move back if it is an opening pair char, or one optional space between the cursor and the the pair char
func! MoveBackIfOpeningPairIsNext()
  let c = col('.')
  let c1 = getline('.')[c-3]
  let c2 = getline('.')[c-2]
  " Note that \"\s or →" ← or quote space can not be a match as this occurs in normal args
  if (c1 =~ '\((\|\[\|{\)' && c2 == ' ') || c2 =~ '\((\|\[\|{\|"\)'
    normal! h
    call MoveBackIfOpeningPairIsNext()
  endif
endfunc
" Test: abc [ ade ] [abc abc] \"abc \" abc

" Test if the first pattern matches earlier in the file
func! PttnIsFirst( pttn1, pttn2, flags )
  let [l1, c1] = searchpos( a:pttn1, 'nW'.a:flags)
  let [l2, c2] = searchpos( a:pttn2, 'nW'.a:flags)
  if !l1
    return 0 " First pattern not found
  elseif !l2
    return 1 " Second pattern not found
  else
    return l1 < l2 || (l1 == l2 && c1 < c2)
  endif
endfunc
" Test: 'return' matches earlier in the file than 'endfunc'
" echo PttnIsFirst('return', 'endfunc', 'b')

func! TestA( pttn1, pttn2 )
  echo searchpos( a:pttn1, 'nWb')
  echo searchpos( a:pttn2, 'nWb')
endfunc

func! CursorOnSkipNextWordCharOrWord()
  let cw = expand('<cword>')
  let skipKW = cw == 'let' || cw == 'in' || cw == 'do' || cw == 'if' || cw == 'then' || cw == 'else' || cw == 'case' || cw=='instance' || cw=='where'
  let ac = GetCharAtCursorAscii()
  return skipKW || ac == 8594 || ac == 8658 || ac == 60 || ac == 62 || ac == 43 || ac == 45 || ac == 124 || ac == 44 || ac == 61 || ac == 8759 || ac == 58 || ac == 96
endfunc
" echo CursorOnSkipNextWordCharOrWord()
" Test: → X ⇒ < + > "- b | x , x } x { x = x ∷ a ` a

func! CursorOnSkipBackwStopWord()
  let cw = expand('<cword>')
  return cw == 'where'
endfunc

func! CursorIsOnClosingBracket()
  let ac = GetCharAtCursorAscii()
  return ac == 41 || ac == 93 || ac == 125
endfunc
" Test: () [] {}

func! CursorIsOnOpeningBracket()
  let ac = GetCharAtCursorAscii()
  return ac == 40 || ac == 91 || ac == 123
endfunc
" Test: () [] {}

func! SkipSyntaxIDs()
  return CursorIsInsideString() || GetSyntaxIDAtCursor() =~ 'where'
endfunc





