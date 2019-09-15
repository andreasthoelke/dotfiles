

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

func! GetVisSel()
  return Get_visual_selection()
endfunc

" The visible column index of a charater column index (recognising conceals/replacements)
func! VisualCol( lineNum, sourceCharIdx )
  let concealedCharCount = 0
  let concealInstanceIds = []
  for charIdx in range(1, a:sourceCharIdx)
    let [charConcealed, replacementChar, groupId] = synconcealed( a:lineNum, charIdx )
    if charConcealed
      let concealedCharCount += 1 " this char is concealed, but ..
      if replacementChar != ''
        " .. it is replaced by a one char wide replacement char, which might represent multiple concealed chars in one
        " conceal instance. This conceal instance is represented by a (syntax-group) Id which is unique over the line (is it?)
        call add( concealInstanceIds, groupId ) " track all instance Ids that had replacement chars
      endif
    endif
  endfor
  let replacementInstances = len( uniq( concealInstanceIds ) )
  let reducedColumnCount = concealedCharCount - replacementInstances
  return a:sourceCharIdx - reducedColumnCount
endfunc


func! VisualBlockMode()
  " Activate visual block mode. 'x' option is needed to exec right away.
  call feedkeys("\<c-v>", 'x')
endfunc


" Vim Pattern: For applying a function via an operator map, visual selection and command
nnoremap <leader><leader>lc      :let g:opProcessAction=['LinesOfCodeCount',[],'Echo',['Lines of code']]<cr>:set opfunc=Gen_opfunc2<cr>g@
vnoremap <leader><leader>lc :<c-u>let g:opProcessAction=['LinesOfCodeCount',[],'Echo',['Lines of code']]<cr>:call Gen_opfunc2(0,1)<cr>g@
command! -range=% LinesOfCodeCount echo LinesOfCodeCount( <line1>, <line2> )

" And opFunction (operation on lines of code (very common in vim!)) has to be an action/side-effect
" This allows to write processing code into a pure/resusabel function and then run action on result.
func! Gen_opfunc2( _, ...)
  " First arg is sent via op-fn. presence of second arg indicates visual-sel
  let [startLine, endLine] = a:0 ? [line("'<"), line("'>")] : [line("'["), line("']")]
  let processorFn   = g:opProcessAction[0]
  let processorArgs = g:opProcessAction[1]
  let actionFn   = g:opProcessAction[2]
  let actionArgs = g:opProcessAction[3]

  let processResult = call( processorFn, processorArgs + [startLine, endLine] )
  call call( actionFn, actionArgs + [processResult] )
endfunc
" TODO: test/unify this with ~/.vim/plugin/utils-align.vim#/func.%20Gen_opfunc.%20_,

" Count non-commented and non-empty lines
func! LinesOfCodeCount( startLine, endLine )
  let lines = getline( a:startLine, a:endLine )
  let count = 0
  for line in lines
    if line =~ '^.*--.*$' || line =~ '^$'
    else
      let count += 1
    endif
  endfor
  return count
endfunc

func! Echo( label, val )
  echom a:label . ': ' . string( a:val )
endfunc
" call Echo( 'My list', [2, 3, 4] )


" Returns the indent level (column num) of lineNum
func! IndentLevel( lineNum )
  return matchstrpos( getline( a:lineNum ), '\S')[1] + 1
endfunc
" echo matchstrpos("    sta", "\S")
   " echo IndentLevel( line('.') )

" Returns the column num of the first (min two spaces) column
func! IndentLevel1stColumn( lineNum )
  return matchstrpos( getline( a:lineNum ), '\S\s\s\+\zs\S')[1] + 1
endfunc
" echo IndentLevel1stColumn     ( line('.') )

" Returns the column num of the first (min two spaces) column
func! IndentLevelWordStarts( lineNum )
  let line = getline( a:lineNum )
  let words = split( getline( a:lineNum ) )
  let wordStarts = []
  for word in words
    call add( wordStarts, matchstrpos( line, word )[1] +1 )
  endfor
  return wordStarts
endfunc
" echo IndentLevelWordStarts ( line('.') )

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

func! IsImportLine( linenum )
  return getline( a:linenum ) =~ 'import '
endfunc
" echo IsImportLine( line('.') )

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
