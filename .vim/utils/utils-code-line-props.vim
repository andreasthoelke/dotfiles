

func! GetTextWithinLineColumns_asLines( startLine, startColumn, endLine, endColumn )
  let lines = getline( a:startLine, a:endLine )
  " The last (-1) line
  let lines[-1] = lines[-1][: a:endColumn - 1]
  let lines[0]  = lines[0][a:startColumn - 1:]
  return lines
endfunc
" echo GetTextWithinLineColumns_asLines( 1575, 1, 1577, 10 )

function! Demo1()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0]  = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

" Returns the indent level of lineNum
func! IndentLevel( lineNum )
  return matchstrpos( getline( a:lineNum ), '\S')[1] + 1
endfunc
" echo matchstrpos("    sta", "\S")

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
  return GetCharAtColRelToCursor( -1 ) =~ '\s'
endfunc

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
