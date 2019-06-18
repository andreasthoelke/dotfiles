
" Learn: \hu, \hU, \ht, leader if

" tj00 ∷ a
" tj00 = undefined


" Try: - "gqaf"
" Issue: this behaved strangely when tried in 5.2019
" set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
" If the 'formatexpr' option is not empty it will be used instead formatprg
" In HsSyntaxAdditions
" setlocal formatprg=stylish-haskell


" "unique functions"
nnoremap <localleader>hu :call RandFnName()<cr>2w
nnoremap <localleader>hU :call RandSymbol()<cr>A ∷ String<esc>^ywo<esc>PA= undefined<esc>w
" produces a (test) haskell function with a random name, ejk.:
" cp0 = undefined
" "unique symbol"
nnoremap <leader>hus :call RandSymbol()<cr>

" "expand function" expand a symbol name to a function stub
" nnoremap <leader>ef A ∷ String<esc>^ywo<esc>PA= undefined<esc>b
nnoremap <localleader>ht ^yiwko<esc>PA ∷ a<esc>w
" nmap <leader>fe A :: String<esc>^ywjPA= undefined<esc>b

" "expand signature" expand a signature to a function stub
nnoremap <leader>es ^ywo<esc>PA= undefined<esc>b
nnoremap <leader>hes ^ywo<esc>PA= undefined<esc>w

" "expand undefined": expand a signature to a function stub
nnoremap <leader>eu yiwo<esc>PA = undefined<esc>b
" nmap <leader>fe A :: String<esc>^ywjPA= undefined<esc>b


nnoremap <leader>uef <leader>us<leader>ef
" Test stub:
" nmap <leader>ts <leader>us<leader>ef
nmap <leader>hfs :call RandSymbol()<cr>A ∷ String<esc>^ywo<esc>PA= undefined<esc>w

" "index symbol" append postfix index to function name
nnoremap <leader>if ea0^jea0^k
" nnoremap <leader>his ea0^jea0^k

" Increase/ decrease the index of TypeSig and term level binding together
nnoremap <leader><c-a> jk^
nnoremap <leader><c-x> <c-x>j<c-x>k^


function! RandFnName()
python << EOF
import string
import random
import vim
vim.current.line += ''.join(random.choice(string.ascii_lowercase) for _ in range(2)) + '0 = undefined'
EOF
endfunction
" Note the Python code must not be indented in a Vim function

function! RandSymbol()
python << EOF
import string
import random
import vim
vim.current.line += ''.join(random.choice(string.ascii_lowercase) for _ in range(2)) + '0'
EOF
endfunction


" Reduce a paragraph (purs repl type output) to one line, deleting 2+ space seperations between words
nnoremap <leader>ccu "td}:call TransfTRegAndAppend( function('StripNewlinesAndMultispaces') )<cr>k

" Get the type of do-binds by producing a type error:
" nnoremap <leader>cco "tyiwolet (xb0 :: Int) = <esc>"tp^
nnoremap <leader>cco "tyiwolet (xb0 :: Int) = <esc>$"tp^
" "$" is needed because EasyClip jumps back
" Note: It's easier to see the type with this, but then it requires 3 keypesses to undo
nmap <leader>cci wi∷ _ <esc>^dr
nmap <leader>ccu wdwdw^dr
" These work fine - conflict with bracket/comma navigation
" nmap ,ti wi∷ _ <esc>^dr
" nmap ,tu wdwdw^dr


" Apply 'fn' to the 't'/temp and append the result after the current line
func! TransfTRegAndAppend ( fn )
  call append( line('.') - 1, a:fn( @t ))
endfunc
" Testfn: Use of TransfTRegAndAppend with higher order function
nnoremap <leader>cci "tdd:call TransfTRegAndAppend( function('toupper') )<cr>

func! StripNewlinesAndMultispaces( str ) " 1. delete all newlines:
  let l:str1 = substitute(  a:str,  '\n',  '', 'ge' )
  " 2. replace sections/words that have more than one space (regex: ' \+') with one space
  let l:str2 = substitute( l:str1, ' \+', ' ', 'ge' )
  return l:str2
  " the same in one 's' command:
  " exec 's/\n//ge | s/ \+/ /ge'
endfunc

func! StripString( original, stripThisString )
  return substitute(  a:original, a:stripThisString, '', 'ge' )
endfunc


" ─   Hs format utils from HsAPIExplore                 ──



func! PreserveKleisliInUnicodeReplace( listListMap ) "{{{
  call insert( a:listListMap, ['>=>', '>#>'] )
  call add   ( a:listListMap, ['>#>', '>=>'] )
  return a:listListMap
endfunc
" echo PreserveKleisliInUnicodeReplace( [['=>', '⇒'], ['c', 'd']] )}}}

" Require Space Before Operator Chars
func! ExtendOperatorPattern( listListMap )
  let augmentedListList = []
  for [fst, snd] in a:listListMap
    call add( augmentedListList, [ '\s\zs' . fst, snd ] )
  endfor
  return augmentedListList
endfunc
" echo ExtendOperatorPattern( [['aa', 'bb'], ['=>', '⇒']] )

let g:ScratchBuffername = 'HsAPIExplore'

let g:HsReplacemMap_CharsToUnicode = [['->', '→'], ['=>', '⇒'], ['::', '∷'], ['forall', '∀'], ["<-", "←"]]
let g:HsReplacemMap_CharsToUnicodePtts = ExtendOperatorPattern( g:HsReplacemMap_CharsToUnicode )
let g:HsReplacemMap_UnicodeToChars = FlipListList( g:HsReplacemMap_CharsToUnicode )

command! -range=% HsReplaceCharsToUnicode :<line1>,<line2>call ReplaceStringsInRange( ExtendOperatorPattern( g:HsReplacemMap_CharsToUnicode ) )
command! -range=% HsReplaceUnicodeToChars :<line1>,<line2>call ReplaceStringsInRange( g:HsReplacemMap_UnicodeToChars )
" .,+6HsReplaceCharsToUnicode
" .,+6HsReplaceUnicodeToChars
" .+3HsReplaceCharsToUnicode
" Control.Monad replicateM :: (Applicative m) => Int -> m a -> m [a]
" unfold :: Monad m => (b -> Maybe (a, b)) -> b -> Producer m a
" kleisli :: forall e. Example e >=> Line
" kleisli = do aa <- example


" ─   Formatting Haskell Imports                         ■
let g:stylish_haskell_command = 'stylish-haskell'
noremap <leader>hi :call StylishHaskell()<cr>
command! Style  :call StylishHaskell()
command! Indent :call StylishHaskell()

function! StylishHaskell()
  write
  " write any changes as otherwise those would be lost - no undo possible!
  let output = system(g:stylish_haskell_command . " " . bufname("%"))
  let errors = matchstr(output, '\(Language\.Haskell\.Stylish\.Parse\.parseModule:[^\x0]*\)')
  if v:shell_error != 0
    echom output
  elseif empty(errors)
    call s:OverwriteBuffer(output)
    write
  else
    echom errors
  endif
endfunction

" taken from stylish-haskell plugin
function! s:OverwriteBuffer(output)
  let winview = winsaveview()
  silent! undojoin
  normal! gg"_dG
  call append(0, split(a:output, '\v\n'))
  normal! G"_dd
  call winrestview(winview)
endfunction
" ─^  Formatting Haskell Imports                         ▲


let g:hsTypeSigColumns = [ "∷", "⇒", ".*\zs→" ]
" Tabularizes patterns found in TypeSignatures over a range of lines
func! HsTabularizeTypeSigns( startLine, endLine )
  call TabularizeListOfPttns( g:hsTypeSigColumns, a:startLine, a:endLine )
endfunc
" call HsTabularizeTypeSigns( 2, 4 )
" call HsTabularizeTypeSigns( 1, line('$') )

" Obsolete ■
" func! HoogleAlignSinatures()
"   GTabularize /∷/
"   GTabularize /⇒/
"   GTabularize /.*\zs→/
" endfunc

" ALIGNING COLUMS OF HASKELL SIGS:{{{
" run: :browse Data.List.Split in GHCi and copy into a vim buffer
"
" align right to ∷ with padding 1:
" '<,'>Tabularize /::/r1c1l1
" move lines that contain "Splitter" to the bottom of the file!
" g/Splitter/m$
" move lines with two occurences of "Splitter" to the bottom
" g/Splitter.*Splitter/m$
" move lines with "Eq" to line 22!
" '<,'>g/Eq/m22
 " ▲





