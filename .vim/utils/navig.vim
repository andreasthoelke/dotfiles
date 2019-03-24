

" call search('\v^("|--)\s─(\^|\s)\s{2}\zs\u.*\S\ze\s*──$')
" nnoremap <leader>bb :echo searchpair('(', 'e', ')', 'W', 'CursorIsInString()')<cr>
  " a E b e a (f E a e d) d E "a e" f E

" nnoremap <leader>bn :echo GetSyntaxIDAtCursor()<cr>

func! AppendSpace( listOfPatterns )
  let res = []
  for pttn in a:listOfPatterns
    call add( res, pttn . '\s' )
  endfor
  return res
endfunc

func! MakeOrPttn( listOfPatterns )
  return '\(' . join( a:listOfPatterns, '\|' ) . '\)'
endfunc
" echo MakeOrPttn( g:infixOps + g:typeArgs )


let g:infixOps = ['<$>', '<\*>', '\*>', '>>', '>>=', '++', '<>', ':']
let g:typeArgs = ['::', '∷', '=>', '⇒', '->', '→']
let g:syntax   = ['<-', '←', '=', '\$', '`\w*`', '->', '→', '|', ',', '=', 'let', 'in', 'do', 'where', 'if', 'then', 'else', 'case', 'instance']
let g:numOps   = ['+', '-', '\*', '&&']
let g:exprDelimPttn = MakeOrPttn( AppendSpace(g:infixOps + g:typeArgs + g:syntax + g:numOps) )



nnoremap <silent> W :call ExprOuterStartForw()<cr>
nnoremap <silent> B :call ExprOuterStartBackw()<cr>
func! ExprOuterStartForw() " ■
  let [oLine, oColumn] = getpos('.')[1:2]
  " Preparation when moving back or forward
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
      " .\ze) allows a newline match right after a parentheses by requiring ) but excluding it from the match
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
  if expand('<cword>') =~ 'let\|case\|if' " A 'let' appears after a delim (=)
    normal! W
  endif
  if IsEmptyLine( line('.') )
    call ExprOuterStartForw()
  endif

  " normal! lh
endfunc " ▲

func! ExprOuterStartBackw() " ■
  let [oLine, oColumn] = getpos('.')[1:2]
  " Move backward to (presumably) the prev delim match, so it doesn't match again in this back motion
  normal! B
  if line('.') < oLine " if the jump back was to the prev line - undo that jump!
    normal! W
  endif

  " Approach: Find expression delimiter on the same bracket level, skip matches in Strings
  let [sLine, sColumn] = searchpairpos( '{\|\[\|(', g:exprDelimPttn, '}\|\]\|)', 'bnW', 'CursorIsInsideString()' )
  " echo 'Delim found at: ' . sLine . ' - ' . sColumn

  " Set Cursor:
  if sLine == oLine
    " Forward and backward matches on the same line
    call setpos('.', [0, sLine, sColumn, 0] )
    " echo 'Delim motion to: ' . sLine . ' - ' . sColumn
    normal! W

  else " Match found in preceding line, but move/test to move to the start of this line first
    normal! ^
    if col('.') == oColumn || CursorOnSkipNextWordCharOrWord()
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
        call setpos('.', [0, sLine, sColumn, 0] )
        normal! W
      endif
    endif
  endif
  normal! lh

  " Escape Again: Additional escapes from unwanted spots
  let cword = expand('<cword>')
  if cword =~ 'let\|case\|if' " A 'let' appears after a delim (=)
      call ExprOuterStartBackw()
  endif
endfunc " ▲


" is this needed? - extend to empty bracket?
func! CursorIsOnUnitType()
  let line = getline('.')
  let c1 = strgetchar( line, virtcol('.')-1 )
  let c2 = strgetchar( line, virtcol('.') )
  return c1 == 40 && c2 == 41
endfunc
" echo CursorIsOnUnitType()
" Test: ab () ] }


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
  call Move1CharBackIfThatsAnOpeningPair()
  " Could not escape brackets/quotes otherwise

  let [oLine, oColumn] = getpos('.')[1:2]
  if IsColOfFirstChar( col('.') )
    " go to the previous line - 'l' is to not skip over one letter vars
    normal! k$ll
  endif

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

func! Move1CharBackIfThatsAnOpeningPair()
  if getline('.')[col('.')-2] =~ '(\|\[\|{\|"'
    normal! h
    call Move1CharBackIfThatsAnOpeningPair()
  endif
endfunc


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

func! TestA( pttn1, pttn2 ) " ■
  echo searchpos( a:pttn1, 'nWb')
  echo searchpos( a:pttn2, 'nWb')
endfunc " ▲

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

func! SkipSyntaxIDs()
  return CursorIsInsideString() || GetSyntaxIDAtCursor() =~ 'where'
endfunc





