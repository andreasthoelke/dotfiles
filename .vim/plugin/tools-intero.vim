
" Issue: prevent intero+neomake to clear the LC warnings/loclist. temp neomake patch  ~/.vim/plugged/neomake/autoload/neomake/cmd.vim#/call%20setloclist.0,%20[],


" ─   Settings                                          ──
" Intero starts automatically. Set this if you'd like to prevent that.
let g:intero_start_immediately = 1
" let g:intero_use_neomake = 0
" This show ghi warnings as opposed to hlint warnings:
" TODO: toggle warnings without restart vim!

" See warnings here: https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/flags.html#warnings
" let g:intero_ghci_options = '-Wall -fdefer-typed-holes -frefinement-level-hole-fits=1 -fno-warn-name-shadowing -Wno-unused-matches -Wno-missing-signatures -Wno-type-defaults -Wno-unused-top-binds -XPartialTypeSignatures -Wno-partial-type-signatures'
let g:intero_ghci_options = '-fdefer-typed-holes -frefinement-level-hole-fits=1 -XPartialTypeSignatures'
" let g:intero_ghci_options = '-Wall -Wno-unrecognised-pragmas -fno-warn-name-shadowing -Wno-unused-matches -Wno-missing-signatures -Wno-type-defaults -Wno-unused-top-binds -XPartialTypeSignatures -Wno-partial-type-signatures'
" let g:intero_ghci_options = '-Wall -Wno-unused-matches -Wno-missing-signatures -Wno-type-defaults -Wno-unused-top-binds'
" let g:intero_ghci_options = '-Wall -Wno-missing-signatures -Wno-type-defaults -Wno-unused-top-binds'


" TODO: when do I need this? ■
let g:haskellmode_completion_ghc = 1
" autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
" causes tag error?



" GHCI:
" use :m -<module name> to unload modules
" use :m to go to only Prelude
" edit ghci.conf to set
" DEFAULT IMPORTS:
" e ~/.ghc/ghci.conf ▲


" ─   Maps                                               ■
" nnoremap <silent> <leader>is :InteroStart<CR>
" nnoremap <silent> <leader>isc :SignsClear<CR>
" Todo: unify this with purs?
nnoremap <silent> <leader>ik :InteroKill<CR>
nnoremap <silent> <leader>io :InteroOpen<CR>
nnoremap <silent> <leader>ih :InteroHide<CR>
nnoremap <silent> <leader>im :InteroLoadCurrentModule<CR>
nnoremap <silent> <leader>il :InteroLoadCurrentFile<CR>
nnoremap <silent>         gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> ,gd :sp<CR>:call LanguageClient_textDocument_definition()<CR>
" fee mapping
" nnoremap <silent>         ]d :call GotoDefinition()<CR>
nnoremap dr :InteroReload<cr>
" ─^  Maps                                               ▲

" ─   Legacy Intero Types: TODO                          ■
" only for identifier, no unicode conversion
" nnoremap <silent> gw :InteroTypeInsert<cr>
" nnoremap <silent> <localleader>tw :InteroTypeInsert<cr>
nnoremap <silent> <localleader>gw :InteroTypeInsert<cr>
" does not echo any more (changed this in Intero) outputs gentype only in Repl
map <localleader>tt <Plug>InteroType

map <localleader>tg <Plug>InteroGenTypeInsert
vnoremap <localleader>tg :InteroGenTypeInsert<cr>
" map <localleader>tg <Plug>InteroGenericType
nnoremap <localleader>ti :InteroInfoInsert<cr>
vnoremap <localleader>ti :InteroInfoInsert<cr>
" ─^  Legacy Intero Types: TODO                          ▲


" ─   Show Type-At symbol or selection                   ■
map gw :call SetReplCallbackFloatWin()<cr><Plug>InteroType
vmap gw :<c-u>call SetReplCallbackFloatWin()<cr>gv<Plug>InteroType
map gW :call SetReplCallbackFloatWin()<cr><Plug>InteroGenericType
map gW :<c-u>call SetReplCallbackFloatWin()<cr>gv<Plug>InteroGenericType

func! SetReplCallbackFloatWin()
  call intero#process#add_handler( function( "FloatWin_stripToType" ) )
endfunc

func! FloatWin_stripToType( lines )
  let str = join( a:lines, ' ' )
  let type = HsGetTypeFromSignatureStr( str )
  call FloatWin_ShowLines( [type] )
endfunc
" ─^  Show Type-At symbol or selection                   ▲




" Default:
nnoremap gei :call InteroEval_SmartShow()<cr>

" Plain Repl Lines:
" nnoremap ges :call InteroEval( GetReplExpr(), "FloatWin_ShowLines", '' )<cr>
nnoremap ges :call InteroEval( GetReplExpr(), "FloatWinAndVirtText", '' )<cr>

vnoremap ges :call InteroEval( Get_visual_selection(), "FloatWinAndVirtText", '' )<cr>

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
nnoremap get :call InteroEval( ':type ' . expand('<cword>'), "FloatWin_ShowLines", '' )<cr>
" nnoremap gwt :call InteroEval( ':type ' . expand('<cword>'), "PasteTypeSig", '' )<cr>
vnoremap get :call InteroEval( ':type ' . Get_visual_selection(), "FloatWin_ShowLines", '' )<cr>
nnoremap gek :call InteroEval( ':kind ' . expand('<cword>'), "FloatWin_ShowLines", '' )<cr>
vnoremap gek :<c-u>call InteroEval( ':kind ' . Get_visual_selection(), "FloatWin_ShowLines", '' )<cr>

nnoremap geT :call InteroRunType( expand('<cword>'), 'HsShowLinesInFloatWin' )<cr>


" Align function needs to be a script var .. (?)
let s:async_alignFnExpr = ''
let s:async_curType = ''

func! FloatWinAndVirtText( lines )
  call FloatWin_ShowLines( a:lines )
  call VirtualtextShowMessage( a:lines[0], 'CommentSection' )
endfunc


func! InteroEval_SmartShow()
  let typeSigLineNum = TopLevBackwLine()
  let funcName       = GetTopLevSymbolName( typeSigLineNum )
  let funcReturnType = HsExtractReturnTypeFromLine( typeSigLineNum )

endfunc

" TODO consideration: could use the ":set +t" ghci feature to always get the type alongside the returned value and
" treat/format it accordingly


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
  elseif CursorIsAtStartOfWord()
    return expand('<cword>')
  elseif isToplevelLine && isDeclarationWithNoArgs
    " echoe 'declaration with no args'
    return topLevelSymbol
  else
    echoe 'Could not extract an expression!'
  endif
endfunc


" ─   Apply args                                         ■
nnoremap <silent> ]g :call TestArgForw()<cr>:call ScrollOff(16)<cr>
func! TestArgForw()
  call search( '\v^e\d_', 'W' )
endfunc

func! TestArgForwLineNum()
  return searchpos( '\v^e\d_', 'cnb' )[0]
endfunc

nnoremap <silent> [g :call TestArgBackw()<cr>:call ScrollOff(10)<cr>
func! TestArgBackw()
  call search( '\v^e\d_', 'bW' )
endfunc

func! InteroEval_TestArgs( lineNum_TestArgs, lineNum_TypeSig )
  let testArgs = HsGetTestArgsFromLineNum( a:lineNum_TestArgs )
  let typeSig = getline( a:lineNum_TypeSig )
  let symbolName = split( typeSig )[0]
  let returnType = HsExtractReturnTypeFromTypeSig( typeSig )
endfunc


" ─^  Apply args                                         ▲


" Select a haskell print/show function and optionally a vim-script align function
" based on the Hs expression/return type
func! HsTypeStr_To_PrintAlignFn( typeStr )
  if a:typeStr[0:1] == '[(' || a:typeStr[0:1] == '[['
    " 1) List of Tuples/Lists: `show` the Tuple/List and align to all commas
    return ['show <$> ', "AlignBufferAsTable(',')"]
  elseif a:typeStr == '\v(Int |Integer |String |Text |\[Char)'
    " 3) Simple types are shown as they are:
    return ['', '']
  elseif a:typeStr =~ '\v^(Map |Vector |\[\u)'
    " 2) Map, Vector or Haskelltype (uppercase in list): use ppTable
    return ['T.printTable ', '']
  else
    " 4) Non list type: use Pretty.Simple
    return ['pPrint ', '']
  endif
endfunc
" echo HsTypeStr_To_PrintAlignFn('[(Integer, Char)]')
" echo HsTypeStr_To_PrintAlignFn('[Sometype Int Char]')
" echo HsTypeStr_To_PrintAlignFn('Map Int Char')


" ─   Tools                                              ■

" Simply paste the lines below as they are ■
func! PasteLines( lines )
  call append( line('.'), a:lines )
endfunc

func! PasteTypeSig( lines ) abort
  " let unicodeLines = ReplaceStringsInLines( a:lines, g:HsReplacemMap_CharsToUnicodePtts )
  call append(line('.') -1, a:lines)
endfunc " ▲

command! HsStackRun    :call HaskellStackRun()

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


" ─   HPack                                             ──
autocmd BufWritePost package.yaml call Hpack()

func! Hpack()
  let err = system('hpack ' . expand('%'))
  if v:shell_error
    echo err
  endif
endfunc

" ─^  Tools                                              ▲

" ─   Other tools Langserver                             ■
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

" just for testing - not sure when this might be useful
nnoremap <leader>dhi :echo intero#util#get_haskell_identifier()<cr>
" alternative to PSCIDEgetKeyword()
" ─^  Other tools Langserver                             ▲

" ─   Repl legacy                                        ■

" Evaluate "expr" in ghci. "renderFnName" will receive what ghci returns as a vim list of lines.
" Renamed from "InsertEvalExpr"
func! InteroEval( expr, renderFnName, alignFnName ) abort
  " exec "InteroReload" " TODO perhaps reload on InsertLeave? otherwise all cmds would take longer..?
  " Set the align function as a script var as it can not be passed to callback(?)
  let s:async_alignFnExpr = a:alignFnName
  call intero#process#add_handler( function( a:renderFnName ) )
  call intero#repl#eval( a:expr )
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
    call InteroRun( replExpr, 'ShowList_AsLines_Aligned', "AlignBufferAsTable( ',' )" )
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
"   " call AlignBufferAsColumns()
" endfunc ▲

" ─^  Repl legacy                                        ▲

nnoremap ger :call WebserverRequestResponse()<cr>
func! WebserverRequestResponse()
  let urlExtension = GetStringInQuotesFromLine( line('.') )
  let l:cmd = "curl http://localhost:8000/" . urlExtension
  let l:resultLines = split( system( l:cmd ), '\n' )
  call FloatWinAndVirtText( l:resultLines[3:] )
  " call append( line('.'), l:resultLines )
endfunc
" !curl http://localhost:8000
" req "abc"



















