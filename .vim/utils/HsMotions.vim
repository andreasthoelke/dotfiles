

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


" Haskell Patterns:
" Line starts in col 1 and is not a comment (non consuming lookaround)
let g:topLevPttn = '^[^ -]'
let g:anyCharsNotBracketOrEqu = '[^=(]*'

" Top level Haskell type signature. May the colon in a new line. Exclues colons after = and inside ()
let g:topLevTypeSig = g:topLevPttn . g:anyCharsNotBracketOrEqu . '\_s' . g:anyCharsNotBracketOrEqu . MakeOrPttn( ['∷', '::'] )
let g:topLevOtherPttn = '^' . MakeOrPttn( ['instance', 'data', 'class', 'type', 'newtype', 'func!'] )
let g:topLevCombined = MakeOrPttn( [ g:topLevTypeSig, g:topLevOtherPttn ] )

" Note the { - } is conceald in this pattern
let g:multilineTilAfterEqual = '\_.\{-}\s=\_s\+\zs\S'

" all haskell type devs - even inner once
" all top level →
"   how to combine or patterns in regex or functions?

let g:nextWordPttn = '\_s\+\zs\S'
let g:infixOps = ['<$>', '<\*>', '\*>', '>>', '>>=', '++', '<>', ':']
let g:typeArgs = ['::', '∷', '=>', '⇒', '->', '→']
let g:syntax   = ['<-', '←', '=', '\$', '`\w*`', '->', '→', '|', ',', '=', 'let', 'in', 'do', 'where', 'if', 'then', 'else', 'case', 'instance']
let g:numOps   = ['+', '-', '\*', '&&']
" let g:fnWirePttn = MakeOrPttn( AppendSpace( ['^[^ -][^=(]*\zs∷', '^[^ -][^=(]*\zs::', 'where', 'do', ' \zsin', '^[^-].*\zsof', 'then', 'let'] ) )
let g:fnWire1Pttns = NotInCommentLine( PrependSpace( AppendSpace( ['where', 'do', 'in', 'of', 'then', 'let'] )) )
let g:fnWirePttn = MakeOrPttn( [g:topLevTypeSig . g:multilineTilAfterEqual] + g:fnWire1Pttns )
let g:rhsPttn = MakeOrPttn( ['→', '->', '←', '<-', '='] )
let g:exprDelimPttn = MakeOrPttn( AppendSpace(g:infixOps + g:typeArgs + g:syntax + g:numOps) )

func! HaskellMaps()
  nnoremap <silent><buffer> <c-p> :call HsPrevSignature()<cr>:call ScrollOff(10)<cr>
  " TODO inc visual maps
  vnoremap <silent><buffer> <c-p> :call HsPrevSignature('v')<cr>:call ScrollOff(10)<cr>
  nnoremap <silent><buffer> <c-n> :call HsNextSignature()<cr>:call ScrollOff(16)<cr>
  vnoremap <silent><buffer> <c-n> :call HsNextSignature(1)<cr>
  nnoremap <silent><buffer> ,<c-n> :call HsBlockLastLine()<cr>:call ScrollOff(10)<cr>
  vnoremap <silent><buffer> ,<c-n> :call HsBlockLastLine()<cr>
endfunc


nnoremap <silent> <c-n> :call TopLevForw()<cr>call ScrollOff(16)<cr>
func! TopLevForw()
  call search( g:topLevCombined, 'W' )
endfunc

nnoremap <silent> <c-p> :call TopLevBackw()<cr>:call ScrollOff(10)<cr>
func! TopLevBackw()
  call search( g:topLevCombined, 'bW' )
endfunc

func! PrevBlockLastLine()
  " Seach back to a line that does not start with a comment
  call search('\v^(\s*--.*)@!\s*.', 'bW')
endfunc

nnoremap <silent> ,<c-n> :call HsBlockLastLine()<cr>:call ScrollOff(10)<cr>
func! HsBlockLastLine()
  call TopLevForw()
  call PrevBlockLastLine()
  call IfOnSpaceGoWord()
endfunc

onoremap ih :call HsBlockVisSel()<cr>
xnoremap ih :<c-u>call HsBlockVisSel()<cr>
func! HsBlockVisSel()
  call TopLevBackw()
  normal! V
  call HsBlockLastLine()
  normal! o
endfunc

" --------------


" Paragraph Movement: ----------------

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
onoremap <silent> ,<c-l> :<C-u>exec "keepjumps norm! " . v:count1 . "}-g_"<CR>
" The VisSel map spans to the *end* of the last line
vnoremap <silent> ,<c-l> }-g_
" Jump to the beginning of the last line of the previous paragraph
nnoremap <silent> ,<c-h> :<C-u>exec "keepjumps norm! " . v:count1 . "{{}-"<CR>

" Keep jumps with native paragraph motions
nnoremap } :<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>
nnoremap { :<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>


" Argument Movement: Note the is Vim-targets related
" Move to current-next argument - the B before the next ','
nnoremap <localleader>a f,B
" Move to the next argument - the B before the next ',' after the next ','
nnoremap ,a f,;B
" Move to the previous argument - the B before the previous ','
nnoremap ,A F,B



" ⎼⎼⎼⎼ Haskell Movement Textobjects ⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼



" Vimscript Movement: -------------

func! VimScriptMaps()
  nnoremap <silent><buffer> <c-p> :call VimPrevCommentTitle()<cr>:call ScrollOff(10)<cr>
  nnoremap <silent><buffer> <c-n> :call VimNextCommentTitle()<cr>:call ScrollOff(16)<cr>

endfunc

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
onoremap ib :<c-u>exec "normal! ggVG"<cr>
" iv = current viewable text in the buffer
onoremap iv :<c-u>exec "normal! HVL"<cr>
vmap iv ,Ho,L

" Needed for textobj-markdown because of conflict with textobj-function?
omap <buffer> af <plug>(textobj-markdown-chunk-a)
omap <buffer> if <plug>(textobj-markdown-chunk-i)
omap <buffer> aF <plug>(textobj-markdown-Bchunk-a)
omap <buffer> iF <plug>(textobj-markdown-Bchunk-i)

" Movement Naviagation:  ---------------------------------------------------------------------

" --------------

nnoremap t :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap q :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>

" TODO add long moves to jumplist as reverting moves would be challenging to perform?

nnoremap <silent> Q :call FnWireframeForw()<cr>
nnoremap <silent> T :call FnWireframeBackw()<cr>
func! FnWireframeForw()
  " Step back is needed to find keywords that are being skipped to from a prev keyword, e.g. a 'do' after '='
  normal! h
  let [oLine, oCol] = getpos('.')[1:2]
  " Find the next hotspot keyword
  call SearchSkipSC( g:fnWirePttn, 'W' )
  if CursorIsInsideComment() || CursorIsInsideString()
    normal! w
    call FnWireframeForw()
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

func! FnWireframeBackw()
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
    call FnWireframeBackw()
  endif
  call ScrollOff(10)
endfunc

" Optional highlighting of fnWireframe keywords:
" doesn't work with multiple files, also slow - obsolete?
func! HighlightFnWireframe( on )
  if a:on && !g:hlWireframeID
    let g:hlWireframeID = matchadd('BlackBG', '\(\s\zswhere\ze\_s\|\s\zsdo\ze\_s\|\s\zsin\ze\_s\|\s\zscase\ze\_s\|\s\zsthen\ze\_s\|\s\zslet\ze\_s\)')
  elseif !a:on && g:hlWireframeID
    call matchdelete( g:hlWireframeID )
    let g:hlWireframeID = 0
  else
    echo 'already set!'
  endif
endfunc
let g:hlWireframeID = 0
" call HighlightFnWireframe(1)
" call HighlightFnWireframe(0)
" let g:fnWire2Pttns = PrependSpace( AppendExtSpace( ['where', 'do', 'in', 'case', 'then', 'let'] ))
" call append( line('.'), MakeOrPttn( g:fnWire2Pttns ) )
" call matchdelete( abc )
" call clearmatches()


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
      " rename this to ExprOuter_VisSel_Inside / Around
" Textobject to select inside an OuterExpression
onoremap ie :call HsExprOuterVisSel()<cr>
xnoremap ie :<c-u>call HsExprOuterVisSel()<cr>
func! HsExprOuterVisSel()
  " Make sure the cursor is not at the start of the expression, as this would select the previous expression
  normal! l
  call ExprOuterStartBackw()
  normal! v
  call ExprOuterEndForw()
  normal! o
endfunc

nnoremap <silent> W :call ExprOuterStartForw()<cr>
nnoremap <silent> B :call ExprOuterStartBackw()<cr>
func! ExprOuterStartForw() " ■
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
      " Just jump to the next word which another undesirable word ..
      normal! W
    endif
  endif

  " Escape Again: Additional escapes from unwanted spots
  if expand('<cword>') =~ 'let\|case\|if\|where' " A 'let' appears after a delim (=)
    normal! W
  endif
  if IsEmptyLine( line('.') )
    call ExprOuterStartForw()
  endif

  " normal! lh
endfunc " ▲

nnoremap <silent> ,W :call ExprOuterEndForw()<cr>
func! ExprOuterEndForw() " ■
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
endfunc " ▲

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
        normal! W
      endif
    endif
  endif
  " normal! lh

  " Escape Again: Additional escapes from unwanted spots
  let cword = expand('<cword>')
  if cword =~ 'let\|case\|if\|where' " A 'let' appears after a delim (=)
      call ExprOuterStartBackw()
  endif
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


" TODO ,q and then just W to include comma? is comma vs expression move often used? then →
" or use localleader for normal comma move
nnoremap <silent> q :call CommaItemStartForw()<cr>
nnoremap <silent> t :call CommaItemStartBackw()<cr>
func! CommaItemStartForw()
  let [oLine, oCol] = getpos('.')[1:2]
  " When on bracket, jump to the end of the bracket
  call FlipToPairChar('')
  " Find delimiter on the same bracket level, skip matches in Strings
  let [sLine, sCol] = searchpairpos( '{\|\[\|(', ',', '}\|\]\|)', 'nW', 'CursorIsInsideStringOrComment()' )
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
endfunc

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
  let [sLine, sCol] = searchpairpos( '{\|\[\|(', ',', '}\|\]\|)', 'bnW', 'CursorIsInsideStringOrComment()' )
  if sLine && sLine > (oLine - 5)
    call setpos('.', [0, sLine, sCol, 0] )
    normal! w
  else
    normal! w
  endif
endfunc

nnoremap <silent> ,q :call BracketStartForw()<cr>
nnoremap <silent> ,t :call BracketStartBackw()<cr>
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
      normal! w
    endif
  endif
endfunc

func! BracketStartBackw()
  let [oLine, oCol] = getpos('.')[1:2]
  let [sLine, sCol] = searchpairpos( '{\|\[\|(', '{\|\[\|(', '}\|\]\|)', 'bnW', 'CursorIsInsideStringOrComment()' )
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


" - skip brackets and quotes
" - skip lambda var
" - skip namesspaced/dots in var - use camelcase motion instead
" - skip closing pairs on forward and opening pairs on backward motion
"   * basically everything that is a one char delim is better addressed by 'h' and 'l' motions
"   * back motion jumps to beginning of var, not adjasant opening bracket/pair
" - skip empty lines
nnoremap <silent> w :call ExprInnerStartForw()<cr>
nnoremap <silent> b :call ExprInnerStartBackw()<cr>
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
  let skipKW = cw == 'let' || cw == 'in' || cw == 'do' || cw == 'if' || cw == 'then' || cw == 'else' || cw == 'case' || cw=='instance'
  let ac = GetCharAtCursorAscii()
  return skipKW || ac == 8594 || ac == 8658 || ac == 60 || ac == 62 || ac == 43 || ac == 45 || ac == 124 || ac == 44 || ac == 61 || ac == 8759 || ac == 58 || ac == 96
endfunc
" echo CursorOnSkipNextWordCharOrWord()
" Test: → X ⇒ < + > "- b | x , x } x { x = x ∷ a ` a

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





