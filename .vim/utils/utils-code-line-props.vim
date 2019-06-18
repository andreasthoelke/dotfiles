

func! GetTextWithinLineColumns_asLines( startLine, startColumn, endLine, endColumn )
  let lines = getline( a:startLine, a:endLine )
  " The last (-1) line
  let lines[-1] = lines[-1][: a:endColumn - 1]
  let lines[0]  = lines[0][a:startColumn - 1:]
  return lines
endfunc
" echo GetTextWithinLineColumns_asLines( 1575, 1, 1577, 10 )

function! Get_visual_selection()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0]  = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

func! VisualBlockMode()
  " Activate visual block mode. 'x' option is needed to exec right away.
  call feedkeys("\<c-v>", 'x')
endfunc


func! GetTopLevSymbolName( lineNum )
  return matchstr( getline(a:lineNum), '^\S*\ze\s')
endfunc
" echo GetTopLevSymbolName( line('.') +1 )
" aber ∷ eins

" Return the previous function name
func! GetTopLevSymbolNameBackw()
  let lineNum = TopLevBackwLine()
  return GetTopLevSymbolName( lineNum )
endfunc
" echo GetTopLevSymbolNameBackw()


" Like <cword> but includes Haskell symbol characters
func! HsCursorKeyword()
  let isk = &l:isk
  " Tempoarily extend the isKeyword character range
  setl isk+=.,<,>,$,#,+,-,*,/,%,',&,=,!,:,124,~,?,^
  let keyword = expand("<cword>")
  let &l:isk = isk
  return keyword
endfunc

" Get the type signature from line
func! HsExtractTypeFromLine( lineNum )
  let line  = getline( a:lineNum )
  let pattern = '\v^.*(∷|:)\ze'
  return substitute( line, pattern, '', '')
endfunc
" Control.Monad replicateM :: (Applicative m) => Int -> m a -> m [a]
" echo HsExtractTypeFromLine( line('.')-1 )
" Control.Monad replicateM ∷ (Applicative m) => Int -> m a -> m [a]
" echo HsExtractTypeFromLine( line('.')-1 )

func! HsExtractReturnTypeFromLine( lineNum )
  let line  = getline( a:lineNum )
  let list = split( line, '\v(∷\s|⇒\s|→\s)' )
  return list[ len( list ) -1 ]
endfunc
" Control.Monad replicateM ∷ (Applicative m) ⇒ Int → m a → m [a]
" echo HsExtractReturnTypeFromLine( line('.')-1 )

func! HsGetTypeFromSignatureStr( signStr )
  return matchstr( a:signStr, '\v(∷|::)\s\zs.*')
endfunc
" Control.Monad replicateM ∷ (Applicative m) ⇒ Int → m a → m [a]
" echo HsGetTypeFromSignatureStr( getline( line('.')-1 ) )

" Returns the indent level of lineNum
func! IndentLevel( lineNum )
  return matchstrpos( getline( a:lineNum ), '\S')[1] + 1
endfunc
" echo matchstrpos("    sta", "\S")
   " echo IndentLevel( line('.') )

" Return the character under the cursor
func! GetCharAtCursor()
  return getline('.')[col('.')-1]
endfunc
" echo GetCharAtCursor()

func! GetCharAtColRelToCursor( offset )
  return getline('.')[ col('.') + a:offset -1 ]
endfunc
" echo GetCharAtColRelToCursor( -1 )

func! IsEmptyLine( linenum )
  return getline( a:linenum ) == ''
endfunc

func! MatchesInLine( linenum, pttn )
  " return len( matchstr( getline( a:linenum ), a:char ) ) ? 1 : 0
  return getline( a:linenum ) =~ a:pttn
endfunc
" echo MatchesInLine( line('.') -1, 'a' )

func! IsTypeSignLine( linenum )
  return getline( a:linenum ) =~ '\(∷\|::\)'
endfunc
" echo IsTypeSignLine( line('.') )

func! IsTypeSignLineWithArgs( linenum )
  return getline( a:linenum ) =~ '\(∷\|::\).*→'
endfunc
" echo IsTypeSignLineWithArgs( line('.') )

func! ColOfFirstChar()
  return searchpos('^\s*\zs', 'cnb')[1]
endfunc

func! IsColOfFirstChar( col )
  return ColOfFirstChar() == a:col
endfunc
" echo IsColOfFirstChar( col('.') )


func! ColOfLastChar()
  return strlen(getline('.'))
endfunc
" echo ColOfLastChar()

func! IsColOfLastChar( col )
  return ColOfLastChar() == a:col
endfunc
" echo IsColOfLastChar( col('.') )


func! CursorIsAtStartOfWord()
  return GetCharAtColRelToCursor( -1 ) =~ '\s' && GetCharAtColRelToCursor( 0 ) =~ '\S'
endfunc
" echo  CursorIsAtStartOfWord()

" Returns Ascii code of multi-byte charaters like '→'
func! GetCharAtCursorAscii()
  return strgetchar( getline('.'), virtcol('.')-1 )
endfunc
" echo GetCharAtCursorAscii() " a → ( b → c) [()] ⇒ d "


func! CursorIsInsideString()
  let curCar = GetCharAtCursor()
  if curCar == '"' || curCar == "'"
    " Cursor is on quote/ start/end of the string
    return 0
  else
    return GetSyntaxIDAtCursor() =~ 'string'
  endif
endfunc
" nnoremap <leader>bb :echo searchpair('(', 'e', ')', 'W', 'CursorIsInString()')<cr>
" Demo: Note how the 'e' in the 'vimCommentString' gets skipped
" a E b e a (f E a e d) d E "a e" f E

func! IsInsideString( line, col )
  return synIDattr( synID( a:line, a:col, 0), 'name' ) =~ 'string'
endfunc

func! IsInsideSyntaxStackId( line, col, testStr )
  let synList = map(synstack( a:line, a:col ), 'synIDattr(v:val,"name")')
  for synID in synList
    if synID =~ a:testStr
      return 1
    endif
  endfor
  return 0
endfunc
" echo IsInsideSyntaxStackId( line('.'), col('.'), 'function' )
" echo IsInsideSyntaxStackId( line('.'), col('.'), 'comm' )

func! CursorIsInsideComment()
  return GetSyntaxIDAtCursor() =~ 'comment'
endfunc

func! CursorIsInsideStringOrComment()
  return CursorIsInsideComment() || CursorIsInsideString()
endfunc
