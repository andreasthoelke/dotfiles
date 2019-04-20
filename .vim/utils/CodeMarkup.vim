
" Navigating and editing long sources files using markup and textobjects
"
"
"
" Code Markup
"   more visual and navigational structure
"   highlights
"   motions and textobjects



" ─   Examples          
" Another one: but now content is below
" Another: but now content is below
" and multiple lines
" Test Three:
" but now content is below
" and multiple lines

" ─   Structure         
  " words
  " arguments, parans (next argument navigation), type signature, list, string
  " lines
" paragraph / and native paragraph
" top-level def
  " folds (zj z)
  " hunks/errors/spells (s] sj?)
" labels
" headers
" sections

" how can I unify jumps to objects and end of objects with the content/around/inside reference?
" words, lines, paragraphs sort of have this
" but not vim-targets? (other textobject examples? - there is def. reuse of the patters)

" folds are sort of related to longer jumps or textobjects - can easily be created/deleted

" zj/k z]z[ are native and work well for folds
" c-l/h for paragraphs, ,c-l for end of paragraph
"   is really convienient - like scrolling
" c-n/p is a more highlevel - to navigate labels and headers
" but what if I only want headers and sections? 
" ** should have these three objects in tagbar
" There is also 'next haskell/vim top-level devinition' playing into this
" there is also next hunks and next warning/ale/gitgutter

" How to create headers, labels and sections
" how to change them?

" Another one: but now content is below
" Another: but now content is below
" and multiple lines
" Test Three:
" but now content is below
" and multiple lines

" This is but maybe. I this is longer .. it would not be a label: and that can be brief


" a section is closed when an end marker is created
"   the map/command automatically uses the header txt of the previous sectionheader
" also when a section end marker is created, fold markers are added 
" to the section start and end lines

" Headings are not folds by default but can easily be made to folds)
" Headings may have no fold start markers
" you can add a manual fold. cursor on the header line: "zf\j.." or vis-sel

" ─   Todos              ■
" labels could be indented
"        should be limied in length and not contain dots
" make header of commented line
" support haskell comments in highlighing
" use haskell/vim comments depend on file type

" delete header (and end marker) but leave headline text to edit? then recreate?
" include optional foldmarkers
" automatically when an end line is created
" reformat section end after change of header text
" also update an end marker if exsistent ▲

" go to next/prev section header (not end header)
" go to end → text object
" go to next/prev label
" → all these consistent in mapping and implementation

" Textobjects:
" inside section header
" inside section
" around section
" inside label

" ─   Some tests                                         ■
" call append( line('.'), 'line below')
" /\v^("|--)\s─(\^|\s)\s{2}\u.*\S\s*──$
" call search('\v^("|--)\s─(\^|\s)\s{2}\zs\u.*\S\ze\s*──$')
" call search('\v^("|--)\s─\s{3}\zs\u.*\S\ze\s*──$', 'bW')
" echo matchstr(getline (line('.') -1), '\v^("|--)\s─(\^|\s)\s{2}\zs\u.*\S\ze\s*──')
" echo matchstr(getline (line('.') -1), '[a-z]*t')
" ─^  Some tests                                         ▲


" ─   Maps                                              ──
nnoremap <leader>css :call MakeSectionHeader(0, '', 0)<cr>
nnoremap <leader>cse :call MakeSectionEndMarker()<cr>
nnoremap <leader>csr :call RefreshSectionMarkers()<cr>
" Test on these lines

" normal Headings
" ─   Utils fold                                        ──

" ─   Utils traverse                                    ──


" Heading with manually created fold
" this may be created until/around the next heading to then fold headings
" ─   Utils fold                                        ── ■

" more
 " ▲

" Sections are created as headings, then creating the end line will delete the end dashes in the heading! so they are different from headings with manual folds
" ─   Helpers                                            ■

" ─^  Helpers                                            ▲



" let [sl, sc] = searchpos(a:opening, 'bcW') " search left for opening


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

" Create Section header start or end markers
" Uses the current line text if headerText is empty string
func! MakeSectionHeader ( isEnd, headerText, addFoldMarker )
  let lineTargetLength = 64
  let sectionHeaderText = len(a:headerText) ? a:headerText : getline('.')
  normal dd
  let lineFirstPart = a:isEnd ? '" ─^  ' : '" ─   '
  let foldMarkerText = a:isEnd ? ' ▲' : ' ■'
  let lineLastPart = a:addFoldMarker ? ('──' . foldMarkerText) : '──'
  let numOfFillChars = lineTargetLength - (len(lineFirstPart) + len(sectionHeaderText) + len('──'))
  let fillChars = repeat( ' ', numOfFillChars)
  let lineText = lineFirstPart . sectionHeaderText . fillChars . lineLastPart
  call append( line('.') -1, lineText )
  normal k
endfunc
" call MakeSectionHeader(0, 'Some Text', 0)
" call MakeSectionHeader(1, 'Some Text', 1)

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

" ─^  Maps                                              ──
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




