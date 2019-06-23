

" ─   Settings                                          ──
" Intero starts automatically. Set this if you'd like to prevent that.
let g:intero_start_immediately = 0
" let g:intero_use_neomake = 0
" This show ghi warnings as opposed to hlint warnings:
" TODO: toggle warnings without restart vim!
let g:intero_ghci_options = '-Wall -fno-warn-name-shadowing -Wno-unused-matches -Wno-missing-signatures -Wno-type-defaults -Wno-unused-top-binds -XPartialTypeSignatures -Wno-partial-type-signatures'
" let g:intero_ghci_options = '-Wall -Wno-unused-matches -Wno-missing-signatures -Wno-type-defaults -Wno-unused-top-binds'
" let g:intero_ghci_options = '-Wall -Wno-missing-signatures -Wno-type-defaults -Wno-unused-top-binds'
" https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/flags.html#warnings

" TODO: when do I need this?
let g:haskellmode_completion_ghc = 1
" autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
" causes tag error?

" autocmd BufWritePost *.hs GhcModCheckAndLintAsync ■
" autocmd BufWritePost *.hs call s:check_and_lint()
" function! s:check_and_lint()
"   let l:qflist = ghcmod#make('check')
"   call extend(l:qflist, ghcmod#make('lint'))
"   call setqflist(l:qflist)
"   cwindow
"   if empty(l:qflist)
"     echo "No errors found"
"   endif
" endfunction ▲


" ─   Maps                                               ■
" nnoremap <silent> <leader>is :InteroStart<CR>
" nnoremap <silent> <leader>isc :SignsClear<CR>
" Todo: unify this with purs?
nnoremap <silent> <leader>ik :InteroKill<CR>
nnoremap <silent> <leader>io :InteroOpen<CR>
nnoremap <silent> <leader>ih :InteroHide<CR>
nnoremap <silent> <leader>im :InteroLoadCurrentModule<CR>
nnoremap <silent> <leader>il :InteroLoadCurrentFile<CR>
nnoremap <silent>         gd :call GotoDefinition()<CR>
nnoremap <silent> ,gd :sp<CR>:call GotoDefinition()<CR>
" fee mapping
" nnoremap <silent>         ]d :call GotoDefinition()<CR>
" ─^  Maps                                               ▲

" ─   Legacy Intero Types: TODO                          ■
" only for identifier, no unicode conversion
nnoremap <silent> gw :InteroTypeInsert<cr>
nnoremap <silent> <localleader>tw :InteroTypeInsert<cr>
" does not echo any more (changed this in Intero) outputs gentype only in Repl
map <localleader>tt <Plug>InteroType

map <silent> <localleader>tg <Plug>InteroGenTypeInsert
vnoremap <localleader>tg :InteroGenTypeInsert<cr>
" map <localleader>tg <Plug>InteroGenericType
nnoremap <localleader>ti :InteroInfoInsert<cr>
vnoremap <localleader>ti :InteroInfoInsert<cr>
" ─^  Legacy Intero Types: TODO                          ▲

" ─   Repl legacy                                        ■


" ─^  Repl legacy                                        ▲


" ─   Repl Eval Insert                                   ■
"
" Default:
nnoremap gei :call InteroEval_SmartShow()<cr>

" Plain Repl Lines:
nnoremap ges :call InteroEval( GetReplExpr(), "FloatWin_ShowLines", '' )<cr>

" ─   legacy to be reviewed                              ■
" Run cword in repl - paste returned lines verbally:
nnoremap <silent> gew :call InteroEval( GetReplExpr(), "ShowList_AsLines_Aligned", '' )<cr>
nnoremap geW :call InteroEval( GetReplExpr(), "PasteLines", '' )<cr>
" -                   - Haskell list as lines:
nnoremap gel :call InteroEval( GetReplExpr(), "ShowList_AsLines_Aligned", '' )<cr>
" -                   - Haskell list as table:
nnoremap gec :call InteroEval( GetReplExpr(), "ShowList_AsLines_Aligned", 'AlignColumns('')' )<cr>
nnoremap geC :call InteroEval( GetReplExpr(), "ShowList_AsLines_Aligned", 'AlignTable' )<cr>
" ─^  legacy to be reviewed                              ▲

" Get repl :type/:kind info for cword / vis-sel:
nnoremap get :call InteroEval( ':type ' . expand('<cword>'), "PasteTypeSig", '' )<cr>
vnoremap get :call InteroEval( ':type ' . Get_visual_selection(), "PasteTypeSig", '' )<cr>
nnoremap gek :call InteroEval( ':kind ' . expand('<cword>'), "PasteLines", '' )<cr>
vnoremap gek :call InteroEval( ':kind ' . Get_visual_selection(), "PasteLines", '' )<cr>

nnoremap geT :call InteroRunType( expand('<cword>'), 'HsShowLinesInFloatWin' )<cr>


" Align function needs to be a script var .. (?)
let s:async_alignFnExpr = ''
let s:async_curType = ''



func! InteroEval_SmartShow()
  " 1. Eval the type of the expression in the repl
endfunc

func! InteroEval_SmartShow_step2( replReturnedLines ) " ■
  " 2. Store the type of the expression
  let firstLine = split( a:replReturnedLines[0], ' ' )
  " let typeSepIndex = index( firstLine, '"::' )
  " let s:curType = join( firstLine[typeSepIndex:], ' ' )
  let s:curType = join( firstLine[2:], ' ' )
  " 3. Now eval the expression in the repl
  " echoe s:curType
  if s:curType[0:1] == '[(' || s:curType[0:1] == '[['
    " 1) List of Tuples/Lists: `show` the Tuple/List and align to all commas
    let replExpr = 'show <$> ' . GetReplExpr()
    " let s:async_alignFnExpr = "AlignColumns( ['\,', '2\,'] )"
    call InteroRun( replExpr, 'ShowList_AsLines_Aligned', "AlignTable( ',' )" )
  elseif s:curType =~ '\v(Map |Vector |\[\u)'
    " 2) Map, Vector or Haskelltype (uppercase in list): use ppTable
    " -- echo "Map.Map Stock" =~ '\v(Map |Vector |\[\u)' ■
    " -- echo "Vector Stock" =~ '\v(Map "|Vector |\[\u)'
    " -- echo "[Ein" =~ '\v(Map "|Vector |\[\u)' ▲
    let replExpr = 'T.printTable ' . GetReplExpr()
    call InteroRun( replExpr, 'HsShowLinesInFloatWin', '' )
  elseif s:curType =~ '\v(Int |Integer |String |Text |\[Char)'
    " 3) Simple type are shown as they are:
    call InteroRun( GetReplExpr(), 'HsShowLinesInFloatWin', '' )
  else
    " 4) Non list type: use Pretty.Simple
    let replExpr = 'pPrint ' . GetReplExpr()
    call InteroRun( replExpr, 'HsShowLinesInFloatWin', '' )
  endif
endfunc
" Tests: see ~/Documents/Haskell/6/HsTrainingTypeClasses1/src/Prettyprint.hs
" call InteroRun( ':type ' . GetReplExpr(), 'InteroEval_SmartShow_step2', '' ) ▲

" Select a haskell print/show function and optionally a vim-script align function
" based on the Hs expression/return type
func! HsPrintAlignFn_fromType( typeStr )
  if typeStr[0:1] == '[(' || typeStr[0:1] == '[['
    " 1) List of Tuples/Lists: `show` the Tuple/List and align to all commas
    return ['show <$> ', "AlignTable(',')"]
  elseif s:curType =~ '\v(Map |Vector |\[\u)'
    " 2) Map, Vector or Haskelltype (uppercase in list): use ppTable
    return ['T.printTable ', '']
  elseif s:curType =~ '\v(Int |Integer |String |Text |\[Char)'
    " 3) Simple types are shown as they are:
    return ['', '']
  else
    " 4) Non list type: use Pretty.Simple
    return ['pPrint ', '']
  endif
endfunc


" Separates 3 output types:
" - Forwards multi-line repl-outputs
" - Splits a list of strings into lines
" - Forwards other values
func! InteroReplReturnCB( lines )
  if len( lines ) == 1
    " Repl returned the typlical one value
    let hsReturnVal = lines[0]
    if hsReturnVal[0:1] == '["'
      " Detected list of strings: To split the list into lines, convert to vim list of line-strings!
      call HsShowLinesInFloatWin( eval ( hsReturnVal ) )
    else
      call HsShowLinesInFloatWin( [hsReturnVal] )
    endif
  elseif
    call HsShowLinesInFloatWin( lines )
  endif
endfunc

func! HsShowLinesInFloatWin( hsLines )
  normal! m'
  call FloatWin_ShowLines( a:hsLines )
  call FloatWin_do( 'call HaskellSyntaxAdditions()' )
  call FloatWin_FitWidthHeight()
  if len( s:async_alignFnExpr )
    call FloatWin_do( 'call ' . s:async_alignFnExpr )
  endif
endfunc
" call HsShowLinesInFloatWin( ["eins", "zwei"] )

func! InteroRun( replExpr, alignFnExpr )
  let s:async_alignFnExpr = a:alignFnExpr
  call intero#process#add_handler( function( 'InteroReplReturnCB' ) )
  call intero#repl#eval( a:replExpr )
endfunc

func! InteroRunType( testExpr, continueFnName )
  let g:async_runTypeContinue = a:continueFnName
  call intero#process#add_handler( function( 'InteroReplTypeReturnCB' ) )
  call intero#repl#eval( ':type ' . a:testExpr )
  " call intero#repl#eval( ':type +d ' . a:testExpr )-- TODO how to integrate the polymorphic flag?
endfunc
" call InteroRunType('maybe', 'HsShowLinesInFloatWin' )
" call InteroRunType('database', 'HsShowLinesInFloatWin' )

func! InteroReplTypeReturnCB( lines )
  if len( a:lines ) == 1
    call call( g:async_runTypeContinue, [[HsGetTypeFromSignatureStr( a:lines[0] )]] )
  else
    call HsShowLinesInFloatWin( lines )
  endif
endfunc

" Simply paste the lines below as they are ■
func! PasteLines( lines )
  call append( line('.'), a:lines )
endfunc

func! PasteTypeSig( lines ) abort
  let unicodeLines = ReplaceStringsInLines( a:lines, g:HsReplacemMap_CharsToUnicodePtts )
  call append(line('.') -1, unicodeLines)
endfunc " ▲

" TODO test and finish the various cases
" Interpretes the first repl-returned line as a Haskell-List of Strings - and appends these items as lines.
" It then aligns the first 2 columns (column separator is <space>)
func! ShowList_AsLines_Aligned( replReturnedLines ) " ■
  let firstLine = a:replReturnedLines[0]
  normal! m'

  if firstLine[0:1] == '["'
    " Received a Haskell list of stings - can simply convert-eval it to vimscript of strings!
    call FloatWin_ShowLines( eval( firstLine ) )
    if len( s:async_alignFnExpr )
      call FloatWin_do( 'call ' . s:async_alignFnExpr )
    endif
  elseif
    " Maybe an error?
    call FloatWin_ShowLines( replReturnedLines )
  endif

  call FloatWin_do( 'call HaskellSyntaxAdditions()' )
  call FloatWin_FitWidthHeight()
endfunc " ▲

" exec l:startWindowNr . 'wincmd w' ■
" call nvim_set_current_win(2)
" Interpretes the first repl-returned line as a Haskell-List of Strings - and appends these items as lines.
" It then aligns the first 2 columns (column separator is <space>)
" func! ShowList_AsColumns( hsList, alignment_FuncName )
"   normal! m'
"   call ShowList_AsLines_Aligned( a:hsList )
"   call FloatWin_do( 'call ' . a:alignment_FuncName . '()' )
"   " call append( line('.'), eval( a:hsList[0] ) )
"   " call AlignColumns()
" endfunc ▲

func! AlignColumns( columnPtts )
  normal V,jo^
  normal V
  " motionType could e.g. be 'char' here - but aligning will only use linewise here
  let motionType = 'lines'
  " The align expression (EasyAlign DSL)
  " If no colums patterns are passed (empty list) then the default (two colums by space) is used
  let columnPtts = len( a:columnPtts ) ? a:columnPtts : ['\ ', '2\ ']
  " Get the range of lines from either visual mode ( "'<") or an (operator pending) motion or text object
  let [l1, l2] = ["'<", "'>"]
  " Format the range string
  let range = l1.','.l2
  " Call the easyAlign main API function
  " function! easy_align#align(bang, live/preview-mode, visualmode, expr) range
  for comExpr in columnPtts
    execute range . "call easy_align#align(0, 0, motionType, comExpr)"
  endfor
  " call JumpBackSkipCurrentLoc()
endfunc

func! AlignTable( columnPttn )
  normal ggV,jo^
  exec "'<,'>Tabu /" . a:columnPttn
  normal Vl
endfunc

" ─^  Repl Eval Insert                                   ▲


"From  https://github.com/sriharshachilakapati/dotfiles/blob/abdef669aad394ff290c7360995e8c05386bcb80/.vimrc
" Callback function used for imports. Calls FZF if there are ambigous imports and resolves with selected one
function! s:PaddImportCallback(ident, result)
  " If the result is empty, then early exit
  if (type(a:result["result"]) == type(v:null))
    return
  endif

  " There are ambigous imports, call FZF with default FZF options
  call fzf#run(fzf#wrap({ 'source': a:result["result"],
        \ 'sink': { module -> PaddImport(a:ident, module) }
        \ }))
endfunction


func! ServerCmd( command, ... )
  let l:args = get(a:, 1, [])
  call LanguageClient_workspace_executeCommand( a:command, l:args, function('PasteLines'))
endfunc

func! LanguageClient_workspace_executeCmd(...)
  return call('LanguageClient#workspace_executeCommand', a:000)
endfunc


nnoremap dip :Pimport<cr>
nnoremap dap :Papply<cr>:call PurescriptUnicode()<cr>
" TODO: currently :Papply indents the current line by one char.  same for haskell?


" just for testing - not sure when this might be useful
nnoremap <leader>dhi :echo intero#util#get_haskell_identifier()<cr>
" alternative to PSCIDEgetKeyword()

" New Haskell And Purescript Maps: ------------------------------------------------------

nnoremap dr :InteroReload<cr>

" nnoremap tr :call TraceTopLevelValue()<cr>
" Todo: where did this come from?
" nnoremap ta :call TraceTopLevelValue()<cr>
" nnoremap tf :call TraceComLine()<cr>


" GHCI:
" use :m -<module name> to unload modules
" use :m to go to only Prelude
" edit ghci.conf to set
" DEFAULT IMPORTS:
" e ~/.ghc/ghci.conf
" ERROR:
" currently with the file it never stops loading..?
" also in .cabal file there is "Exposed modules", which can be multible
" modules that are loaded into ghci on startup.


" Get a (repl-) evaluable expression-string from a (line-) string
func! GetReplExpr()
  let lineList                = split( getline('.') )
  let secondWordOnwards       = join( l:lineList[1:], ' ')
  let topLevelSymbol          = lineList[0]
  let isDeclarationWithNoArgs = lineList[1] == '='
  let isToplevelLine          = IndentLevel( line('.') ) == 1
  let cursorIsAtStartOfLine   = col('.') == 1 " not sure where?

  if CursorIsInsideStringOrComment()
    return secondWordOnwards
  elseif IsTypeSignLine( line('.') )
    return topLevelSymbol
  elseif IsTypeSignLineWithArgs( line('.') )
    return topLevelSymbol
  elseif isToplevelLine && isDeclarationWithNoArgs
    " echoe 'declaration with no args'
    return topLevelSymbol
  elseif CursorIsAtStartOfWord()
    return expand('<cword>')
  else
    echoe 'Could not extract an expression!'
  endif
endfunc


" ─   Apply args                                         ■
nnoremap <silent> ]g :call TestArgForw()<cr>:call ScrollOff(16)<cr>
func! TestArgForw()
  call search( '\v^--\s\>', 'W' )
endfunc

func! TestArgForwLineNum()
  return searchpos( '\v^--\s\>', 'cnb' )[0]
endfunc

nnoremap <silent> [g :call TestArgBackw()<cr>:call ScrollOff(10)<cr>
func! TestArgBackw()
  call search( '\v^--\s\>', 'bW' )
endfunc

func! InteroEval_TestArgs( lineNum_TestArgs, lineNum_TypeSig )
  let testArgs = HsGetTestArgsFromLineNum( a:lineNum_TestArgs )
  let typeSig = getline( a:lineNum_TypeSig )
  let symbolName = split( typeSig )[0]
  let returnType = HsExtractReturnTypeFromTypeSig( typeSig )
endfunc

func! HsGetTestArgsFromLineNum( lineNum )
  return split( getline( a:lineNum ), '>\s' )[1]
endfunc
" -- > "eins" 123
" echo HsGetTestArgsFromLineNum( line('.')-1 )

" ─^  Apply args                                         ▲

func! HsExtractReturnTypeFromTypeSig( typeSig )
  let list = split( a:typeSig, '\v(∷\s|⇒\s|→\s)' )
  return list[ len( list ) -1 ]
endfunc




" TODO: Intero has these custom functions:
" InsertInstType
" InsertGenType
" InsertEvalRes
" InsertEvalExpressionRes
" TODO: make proper API


" Todo: use join( list, ' ' )
function! ListToHsFnCall(stlist)
  let l:fncall = ""

  for nextItem in a:stlist
    let l:fncall = l:fncall . " " . nextItem
  endfor
  return l:fncall
  " echo fncall
endfun

function! GetModuleName()
  for lineNum in [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    " skip empty lines as those seem to confuse the if == 'module'
    if split( getline( lineNum ) ) == []
      continue
    endif
    let firstWord  = get( split( getline( lineNum ) ), 0 )
    let moduleName = get( split( getline( lineNum ) ), 1 )
    if firstWord == "module"
      break
    endif
  endfor
  return moduleName
endfun



" Extracts the project name, e.g. "pragmaticServant" from the Stack "package.yaml" file
fun! HaskellProjectName()
  let firstLine = readfile('package.yaml')[0:0][0]
  return split(firstLine)[1]
endfun
" These are the first two lines from "package.yaml" at the root of the project folder/working directory:
" name:                pragmaticServant
" version:             0.1.0.0

" Alternative approach: use name of working directory
" expand('%:p:h:t')
fun! HaskellProjectName1()
  return fnamemodify('package.yaml', ':p:h:t')
endfun


command! Run    :call HaskellStackRun()

" Opens a visible terminal and builds and runs the stack project (using stack build && stack exec ..)
" TODO: two alternative ways to launch long running processes:
" ➜  pragmaticServant git:(master) ✗ stack runghc src/Lib.hs
" 2. Launch a terminal with "glt" + "ghcid -T :main"
fun! HaskellStackRun()
  " let Cbs2 = {
  " \ 'on_stdout': function('OnEv1'),
  " \ 'on_stderr': function('OnEv1'),
  " \ 'on_exit': function('OnEv1')
  " \ }

  " let commandBaseString = "!stack build && stack exec "
  let projectName = HaskellProjectName1()
  " let commString = commandBaseString . projectName . "-exe"
  " let commString = "stack build"
  let commString = "20Term stack build && stack exec " . projectName . "-exe"
  " let StackRunIO = jobstart(commString, Cbs2)
  " exec "20Term stack build"

  exec commString
endfun
" example command:
" "stack build && stack exec pragmaticServant-exe"
" glt :20Term<cr>

" command! PursRepl :let PursReplID = jobstart("pulp repl", Cbs1)
" :call jobstart(split(&shell) + split(&shellcmdflag) + ['{cmd}'])
"





