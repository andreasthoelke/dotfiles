

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

" autocmd BufWritePost *.hs GhcModCheckAndLintAsync

" autocmd BufWritePost *.hs call s:check_and_lint()
" function! s:check_and_lint()
"   let l:qflist = ghcmod#make('check')
"   call extend(l:qflist, ghcmod#make('lint'))
"   call setqflist(l:qflist)
"   cwindow
"   if empty(l:qflist)
"     echo "No errors found"
"   endif
" endfunction


" ─   Maps                                              ──
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

" nnoremap <silent> ,tw :call InsertTypeAnnotation()<cr>
nnoremap <silent> gw :call InsertTypeAnnotation()<cr>
map <silent> <localleader>tg <Plug>InteroGenericType
map <silent> <localleader>tt <Plug>InteroType

" nnoremap tt :call TypeInsert( PSCIDEgetKeyword() )<cr>
" nnoremap <localleader>tt :call TypeInsert()<cr>
" vnoremap tt :call TypeInsert( Get_visual_selection() )<cr>
" TODO: problem: PSCIDEgetKeyword only work when PSCIDE is started/ throws error with Haskell
" nnoremap <localleader>tg :InteroGenTypeInsert<cr>
" map <silent> <leader>tq <Plug>InteroGenericType

map <silent> <localleader>tg <Plug>InteroGenTypeInsert
vnoremap <localleader>tg :InteroGenTypeInsert<cr>
nnoremap <localleader>ti :InteroInfoInsert<cr>
vnoremap <localleader>ti :InteroInfoInsert<cr>

nnoremap <silent> <localleader>tw :call InsertTypeAnnotation()<cr>
" Type Inserts: ----------------------------------------------------


" ─   Repl Eval Insert                                   ■
" Evaluate a string in the Repl (purs or ghci) and insert the result of the evaluation
" gee → expr after -- (comment)
"       expr after =
"       selection
" gel → entire line
" gew → keyword
" (cursor-column is only significant for gew)

" Extract a (repl-) evaluable expression-string from current line
nnoremap gei :call ReplEvalExpr_Insert( ExtractEvalExpFromLineStr( getline('.') ) )<cr>
" vnoremap gei :call ReplEvalExpr_Insert( Get_visual_selection() )<cr>

" Evaluate the entire line
" nnoremap gel :call ReplEvalExpr_Insert( getline('.') )<cr>

" Eval the current keyword
" nnoremap gew :call ReplEvalExpr_Insert( PSCIDEgetKeyword() )<cr>

" This uses a custom function inside Intero?!
" nnoremap gew :call ReplEvalExpr_Insert( expand("<cword>") )<cr>



" Run cword in repl - paste returned lines verbally:
nnoremap gew :call InsertEvalExpr( expand("<cword>"), "FloatWin_ShowLines", '' )<cr>
nnoremap geW :call InsertEvalExpr( expand("<cword>"), "PasteLines", '' )<cr>
" -                   - Haskell list as lines:
nnoremap gel :call InsertEvalExpr( expand("<cword>"), "ShowList_AsLines", '' )<cr>
" -                   - Haskell list as table:
nnoremap gec :call InsertEvalExpr( expand("<cword>"), "ShowList_AsLines", 'Align2Columns' )<cr>
nnoremap geC :call InsertEvalExpr( expand("<cword>"), "ShowList_AsLines", 'AlignTable' )<cr>

" Get repl :type/:kind info for cword / vis-sel:
nnoremap get :call InsertEvalExpr( ':type ' . expand('<cword>'), "PasteTypeSig" )<cr>
vnoremap get :call InsertEvalExpr( ':type ' . Get_visual_selection(), "PasteTypeSig" )<cr>
nnoremap gek :call InsertEvalExpr( ':kind ' . expand('<cword>'), "PasteLines" )<cr>
vnoremap gek :call InsertEvalExpr( ':kind ' . Get_visual_selection(), "PasteLines" )<cr>


" Evaluate "expr" in ghci. "renderFnName" will receive what ghci returns as a vim list of lines.
func! InsertEvalExpr( expr, renderFnName, alignFnName ) abort
  " Set the align function as a script var as it can not be passed to callback(?)
  let s:alignFnName = a:alignFnName
  call intero#process#add_handler( function( a:renderFnName ) )
  call intero#repl#eval( a:expr )
endfunc

" Simply paste the lines below as they are
func! PasteLines( lines )
  call append( line('.'), a:lines )
endfunc

func! PasteTypeSig( lines ) abort
  let unicodeLines = ReplaceStringsInLines( a:lines, g:HsReplacemMap_CharsToUnicodePtts )
  call append(line('.') -1, unicodeLines)
endfunc

" Interpretes the first repl-returned line as a Haskell-List of Strings - and appends these items as lines.
" It then aligns the first 2 columns (column separator is <space>)
func! ShowList_AsLines( hsList )
  normal! m'
  call FloatWin_ShowLines( eval( a:hsList[0] ) )
  " call append( line('.'),  eval( a:hsList[0] ) )
  if len( s:alignFnName )
    call FloatWin_do( 'call ' . s:alignFnName . '()' )
  endif
  call FloatWin_FitWidthHeight()
endfunc

" exec l:startWindowNr . 'wincmd w' ■
" call nvim_set_current_win(2)
" Interpretes the first repl-returned line as a Haskell-List of Strings - and appends these items as lines.
" It then aligns the first 2 columns (column separator is <space>)
" func! ShowList_AsColumns( hsList, alignment_FuncName )
"   normal! m'
"   call ShowList_AsLines( a:hsList )
"   call FloatWin_do( 'call ' . a:alignment_FuncName . '()' )
"   " call append( line('.'), eval( a:hsList[0] ) )
"   " call Align2Columns()
" endfunc ▲

func! Align2Columns()
  normal V,jo^
  normal V
  " motionType could e.g. be 'char' here - but aligning will only use linewise here
  let motionType = 'lines'
  " The align expression (EasyAlign DSL)
  let comExpressions = ['\ ', '2\ ']
  " Get the range of lines from either visual mode ( "'<") or an (operator pending) motion or text object
  let [l1, l2] = ["'<", "'>"]
  " Format the range string
  let range = l1.','.l2
  " Call the easyAlign main API function
  " function! easy_align#align(bang, live/preview-mode, visualmode, expr) range
  for comExpr in comExpressions
    execute range . "call easy_align#align(0, 0, motionType, comExpr)"
  endfor
  " call JumpBackSkipCurrentLoc()
endfunc

func! AlignTable()
  normal V,jo^
  exec "'<,'>Tabu / /"
  normal V
endfunc

" ─^  Repl Eval Insert                                   ▲


nnoremap dip :Pimport<cr>
nnoremap dap :Papply<cr>:call PurescriptUnicode()<cr>
" TODO: currently :Papply indents the current line by one char.  same for haskell?


" just for testing - not sure when this might be useful
nnoremap <leader>dhi :echo intero#util#get_haskell_identifier()<cr>
" alternative to PSCIDEgetKeyword()

" New Haskell And Purescript Maps: ------------------------------------------------------

" nnoremap dr :call ReplReload()<cr>
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


function! GotoDefinition()
  if IsPurs()
    normal m'
    " add position to jumplist
    exec 'Pgoto'
  else
    exec 'InteroGoToDef'
  endif
endfun

" function! TypeInsert( keyword)
function! TypeInsert()
  if IsPurs()
    let l:kw = PSCIDEgetKeyword()
    " call PursType( a:keyword )
    call PursType( l:kw )
  else
    " exec 'InteroInstTypeInsert'
    " :InteroInstTypeInsert
    :InteroGenTypeInsert
  endif
endfun

function! ReplEvalExpr_Insert( exprStr )
  if IsPurs()
    call PursEval( a:exprStr )
  else
    call InsertEvalExpressionRes( a:exprStr )
  endif
endfun

" Get a (repl-) evaluable expression-string from a (line-) string
function! ExtractEvalExpFromLineStr( lineStr )
  let l:lineList = split( a:lineStr )

  if l:lineList[0] == '--'
    " it's a commented line
    " → use the second word onwards
    return join( l:lineList[1:], ' ')

  elseif l:lineList[1] == '='
    " it's a declaration
    " → use the third word onwards
    return join( l:lineList[2:], ' ')
  else
    echoe 'Could not extract an expression!'
  endif
endfun


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


function! ReplReload()
  let modulename = GetModuleName()
  " exec ':up'
  if IsPurs()
    " TODO: is this needed? what does it do?
    call purescript#ide#utils#update()
    exec ':Prebuild'
    call PursEval(':r')
    call PursEval('import ' . modulename)
    " call PursEval('import Helpers')
    " exec 'SlimeSend1 :r'
    " exec 'SlimeSend1 import ' . modulename
    " exec 'SlimeSend1 import Helpers'
  else
    if has('nvim')
      exec ':InteroReload'
    else
      exec 'SlimeSend1 :r'
      exec 'SlimeSend1 :l ' . modulename
    endif
  endif
endfun

function! InsertTypeAnnotation()
  " exec ':up'
  if IsPurs()
    " exec ':PSCIDEaddTypeAnnotation'
    call PSCIDEaddTypeAnnotation(matchstr(getline(line(".")), '^\s*\zs\k\+\ze'))
  else
    if has('nvim')
      exec ':InteroTypeInsert'
    else
      exec ':GhcModTypeInsert'
    endif
  endif
  " This has no effect/comes too early as the text will be inserted by Intero asynced/later
  " call PurescriptUnicode()
endfun

function! ImportIdentifier()
  if IsPurs()
    exec ':PSCIDEimportIdentifier'
  else
    " TODO
  endif
endfun

function! PsciReload()
  let modulename = GetModuleName()
  exec ':w'
  exec 'SlimeSend1 :r'
  exec 'SlimeSend1 import ' . modulename
  " import is for purescript / psci
  " exec 'SlimeSend1 :l ' . modulename
  " :l is for haskell / ghci
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





