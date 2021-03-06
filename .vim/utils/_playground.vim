
function! OutAB(output, ...) abort
  let l:quiet = get(a:000, 0)

  if has_key(a:output, 'result')

    " let out = keys( a:output['result'] )
    let out = get(a:output, 'result')

    " call FloatWin_ShowLines( out )
    call append( line('.'), keys( eval(out) ))

    " call append( line('.'), get(a:output, 'result') )
    " call append( line('.'), a:output.result)
    " return get(a:output, 'result')

  elseif has_key(a:output, 'error')
    let l:error = get(a:output, 'error')
    let l:message = get(l:error, 'message')
    if !l:quiet
      call s:Echoerr(l:message)
    endif
    return v:null
  else
    if !l:quiet
      call s:Echoerr('Unknown output type: ' . json_encode(a:output))
    endif
    return v:null
  endif
endfunction




'/Users/andreas.thoelke/Documents/Haskell/6/HsTrainingTypeClasses1/src/Prettyprint.hs':

[{'source': 'hlint', 'range': {'end': {'character': 14, 'line': 193}, 'start': {'character': 6, 'line': 193}}, 'code': 'Use const', 'message': 'Use const Found:   \ s -> 123 Why not:   const 123 ', 'severity': 4}, 

{'source': 'hlint', 'range': {'end': {'character': 14, 'line': 193}, 'start': {'character': 0, 'line': 193}}, 'code': 'Redundant lambda', 'message': 'Redundant lambda Found:   sw0 = \ s -> 123 Why not:   sw0 s = 123 ', 'severity': 3}], 

'/Users/andreas.thoelke/Documents/Haskell/6/HsTrainingTypeClasses1/src/Functortown.hs':

[{'source': 'ghcmod', 'range': {'end': {'character': 33, 'line': 48}, 'start': {'character': 32, 'line': 48}}, 'message': '• Found type wildcard ‘_’ standing for ‘w’   Where: ‘w’ is a rigid type variable bound by            the inferred type of <expression> :: w            at /private/var/folders/34/znb2fck12rd8921q3r04ml8m0000gn/T/ghc-mod39133/Functortown39132-0.hs:49:33 • In an expression type signature: _   In the second argument of ‘(==)’, namely ‘(i :: _)’   In the expression: e1_lookup1 == (i :: _) • Relevant bindings include     a13_lookup1 :: Bool       (bound at /private/var/folders/34/znb2fck12rd8921q3r04ml8m0000gn/T/ghc-mod39133/Functortown39132-0.hs:49:1)', 'severity': 2}, 

{'source': 'hlint', 'range': {'end': {'character': 18, 'line': 50}, 'start': {'character': 6, 'line': 50}}, 'code': 'Use <>', 'message': 'Use <> Found:   "aa" ++ "bb" Why not:   "aa" <> "bb" ', 'severity': 3},
{'source': 'hlint', 'range': {'end': {'character': 21, 'line': 125}, 'start': {'character': 9, 'line': 125}}, 'code': 'Use <>', 'message': 'Use <> Found:   "eins" ++ aa Why not:   "eins" <> aa ', 'severity': 3}]}



let g:cmd1 = '$path'
call append( line('.'), split( system( g:cmd1 ), '\s' ) )


let g:cmd1 = 'find $VIMRUNTIME -type f -name \*.vim'
call append( 15, split( system( g:cmd1 ), '\n' ) )

these don't work:
call append( line('.'), split( g:tagbar_type_haskell, '\n' ) )
call append( line('.'), =g:tagbar_type_haskell)

exec "10,$normal! d8f/"
exec "normal! /run\<cr>"
exec "normal! d/run\<cr>"
/local
nnoremap <leader>abb /shar<cr>
call append( 10, split( &runtimepath , ',' ) )
nnoremap <leader>ab i<c-r>=&runtimepath<cr>
exec "normal! i<c-r>=&runtimepath"
put =&runtimepath
put ='hi there'
hi there
" printf cycles through the args to fill in args
printf 'Start: %s\n' 'here it is!' 'and more'
echo 'a\nb\nc\nb\n' | vim - -es --not-a-term +'g/b/norm gUUixx' +2 +'norm yy2p' '+%p' '+qa!' | tr x z

some things

" Sections can be open or closed ■
" a closed section has an end marker
" an open section extends to the next section header (the related text object "is" does) ▲

" a section is closed when an end marker is created ■
"   the map/command automatically uses the header txt of the previous sectionheader ■
" also when a section end marker is created, fold markers are added ▲
" to the section start and end lines ▲

" open section header lines may have no fold start markers
" you can add a manual fold. cursor on the header line: "zf\j.." or vis-sel

" ─   Syntax Color                                     ───


" ─   Just header                                  ──
let g:ta = '" ─   '
let g:tb = 'Some Examp'
let g:tc = g:ta . g:tb

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


include optional foldmarkers 
  automatically when an end line is created
reformat section end after change of header text
insert leave and text change autocmds will trigger this
  also update an end marker if exsistent

go to next/prev section header (not end header)
go to end → text object
go to next/prev label
→ all these consistent in mapping and implementation

textobjects:
  inside section header
  inside section
  around section
  inside label


