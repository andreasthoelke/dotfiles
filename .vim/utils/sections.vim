
" Description:
" Sections can be open or closed
" a closed section has an end marker
" an open section extends to the next section header (the related text object "is" does)

" a section is closed when an end marker is created
"   the map/command automatically uses the header txt of the previous sectionheader
" also when a section end marker is created, fold markers are added 
" to the section start and end lines

" open section header lines may have no fold start markers
" you can add a manual fold. cursor on the header line: "zf\j.." or vis-sel

" Todos:
" include optional foldmarkers
" automatically when an end line is created
" reformat section end after change of header text
" insert leave and text change autocmds will trigger this
" also update an end marker if exsistent

" go to next/prev section header (not end header)
" go to end → text object
" go to next/prev label
" → all these consistent in mapping and implementation

" Textobjects:
" inside section header
" inside section
" around section
" inside label

" ─   Syntax Color                                     ───


call append( line('.'), g:ta . g:tb)

/\v^("|--)\s─(\^|\s)\s{2}\u.*\S\s*──$
call search('\v^("|--)\s─(\^|\s)\s{2}\zs\u.*\S\ze\s*──$')

call search('\v^("|--)\s─\s{3}\zs\u.*\S\ze\s*──$', 'bW')

func! SectionGoPrevHeaderLine ()
  call search('\v^("|--)\s─\s{3}\u.*', 'bW')
endfunc

" Jumps to section end marker if exists and returns 1, does not move and returns 0 otherwise
func! SectionGoMatchingEndMarker ()
  let l:winview = winsaveview()
  call SectionGoPrevHeaderLine()
  let headerText = HeadlinieTxFromLine( line('.') )
  return search('\v^("|--)\s─\^\s{2}' . headerText, 'W')
endfunc

" Go to next end marker, abort at any new section start line (nesting is not supported),
" don't rely on section name, useful for renaming sections
func! SectionGoNextEndMarker ()
  let l:winview = winsaveview()
  " Go to either next start or end marker
  call search('\v^("|--)\s─(\^|\s)\s{2}\u', 'W')
  let isEndMarker = len( matchstr(getline(line('.')), '─^') ) ? 1 : 0
  if isEndMarker " Confirm we have moved to matching end marker
    return 1
  else " Roll back
    call winrestview(l:winview)
    return 0
  endif
endfunc
" echo SectionGoNextEndMarker()

nnoremap <leader>css :call MakeSectionHeader(0, '', 0)<cr>
nnoremap <leader>cse :call MakeSectionEndMarker()<cr>
nnoremap <leader>csr :call RefreshSectionMarkers()<cr>
" Test on these lines
Some Headline Text
" ─   Some Text                                    ──
echo matchstr(getline (line('.') -1), '\v^("|--)\s─(\^|\s)\s{2}\zs\u.*\S\ze\s*──')
echo matchstr(getline (line('.') -1), '[a-z]*t')

" Create Section header start or end markers
" Uses the current line text if headerText is empty string
func! MakeSectionHeader ( isEnd, headerText, addFoldMarker )
  let lineTargetLength = 64
  let sectionHeaderText = len(a:headerText) ? a:headerText : getline('.')
  normal dd
  let lineFirstPart = a:isEnd ? '" ─^  ' : '" ─   '
  let foldMarkerText = a:isEnd ? '▲▲' : '■■'
  let lineLastPart = a:addFoldMarker ? ('──' . foldMarkerText) : '──'
  let numOfFillChars = lineTargetLength - (len(lineFirstPart) + len(sectionHeaderText) + len('──'))
  let fillChars = repeat( ' ', numOfFillChars)
  let lineText = lineFirstPart . sectionHeaderText . fillChars . lineLastPart
  call append( line('.') -1, lineText )
  normal k
endfunc
" call MakeSectionHeader(0, 'Some Text', 0)

" Create section end marker using the header text of the previous header start line
func! MakeSectionEndMarker()
  let l:winview = winsaveview()
  call SectionGoPrevHeaderLine()
  let headerText = HeadlinieTxFromLine( line('.') )
  " Just overwrite/recreate the header line adding the start foldmarker
  call MakeSectionHeader(0, headerText, 1)
  call winrestview(l:winview)
  call MakeSectionHeader(1, headerText, 1)
endfunc
" call MakeSectionEndMarker()
" ─^  Some more Text                                    ──

" Run this after changing the section header text. Will update and marker and realign line spacing
func! RefreshSectionMarkers()
  let l:winview = winsaveview()
  let foldMarkerToPerserve = len( matchstr(getline(line('.')), '■■') ) ? 1 : 0
  let headerText = HeadlinieTxFromLine( line('.') )
  call MakeSectionHeader(0, headerText, foldMarkerToPerserve)
  if SectionGoMatchingEndMarker()
    call MakeSectionHeader(1, headerText, 1)
  endif
  call winrestview(l:winview)
endfunc

" Extract headline text from section header line
func! HeadlinieTxFromLine( lineNum )
  return matchstr( getline(a:lineNum), '\v^("|--)\s─(\^|\s)\s{2}\zs\u.*\S\ze\s*──')
endfunc
" echo HeadlinieTxFromLine( line('.') +1 )
" ─^  Some Headline Text                                ──




