


nnoremap <leader>ct :call CreateInlineTestDec()<cr>
" e1_database4 = database4 (Just "eins") 123
func! CreateInlineTestDec()
  let typeSigLineNum = TopLevBackwLine()
  let funcName       = GetTopLevSymbolName( typeSigLineNum )
  let argumentTypesList = HsExtractArgTypesFromTypeSigStr( getline( typeSigLineNum ) )
  let nextIndex = GetNextTestDeclIndex()
  let lineText = 'e' . nextIndex . '_' . funcName . ' = ' . funcName . ' ' . ArgsPlacehoderStr( argumentTypesList )
  call append( line('.') -1, lineText )
  normal k^ww
endfunc


func! GetNextTestDeclIndex()
  let lineNumPrevInlineTestDec = InlineTestDeclBackwLine()
  let thereIsAPrevTestDecl = lineNumPrevInlineTestDec > TopLevBackwLine()
  if thereIsAPrevTestDecl
    return 1 + eval( GetTestDeclIndex( lineNumPrevInlineTestDec ) )
  else
    return 1
  endif
endfunc
" database2 ∷ String → [(String, String, Int)]
" e1_database4 = database4 (Just "eins") 123
" echo GetNextTestDeclIndex()


nnoremap <leader>ca :call CreateAssertion()<cr>
" Tests: (uncomment)
" database4 ∷ String → [(String, String, Int)]
" e1_database4 = database4 (Just "eins") 123
" a11_database4 = id e1_database4 == (i∷ [(String, String, Int)])
func! CreateAssertion()
  let lineNumPrevInlineTestDec = InlineTestDeclBackwLine()
  if lineNumPrevInlineTestDec < TopLevBackwLine()
    echoe 'Please create the assertion after a test declaration!'
    return
  endif
  let typeSigLineNum = TopLevBackwLine()
  let funcName       = GetTopLevSymbolName( typeSigLineNum )
  let funcReturnType = HsExtractReturnTypeFromTypeSigStr( getline( typeSigLineNum ) )

  let nextIndex = GetNextAssertionIndex()
  let decSymbolName = GetTopLevSymbolName( lineNumPrevInlineTestDec )
  let lineText = 'a' . nextIndex . '_' . funcName . ' = id ' . decSymbolName . ' == (i∷ ' . funcReturnType . ')'
  call append( line('.') -1, lineText )
  normal k^ww
endfunc

func! GetNextAssertionIndex()
  let lineNumPrevInlineTestDec = InlineTestDeclBackwLine()
  let lineNumPrevAssertion     = InlineTestAssertionBackwLine()
  let thereIsAPrevTestDecl  = lineNumPrevInlineTestDec > TopLevBackwLine()
  let thereIsAPrevAssertion = lineNumPrevAssertion > lineNumPrevInlineTestDec
  if thereIsAPrevTestDecl
    if thereIsAPrevAssertion
      return 1 + eval( GetAssertionIndex( lineNumPrevAssertion ) )
    else
      return GetTestDeclIndex( lineNumPrevInlineTestDec ) . '1'
    endif
  else
    echoe 'Please create the assertion after a test declaration!'
    return 11
  endif
endfunc
" database2 ∷ String → [(String, String, Int)]
" e1_database4 = database4 (Just "eins") 123
" a14_database4 = id e1_database4 == (i∷ [(String, Int)])
" echo GetNextAssertionIndex()



func! InlineTestDeclBackwLine()
  return searchpos( '\v^e\d_', 'cnbW')[0]
endfunc
" echo InlineTestDeclBackwLine()

func! InlineTestAssertionBackwLine()
  return searchpos( '\v^a\d\d_', 'cnbW')[0]
endfunc
" echo TopLevBackwLine()

func! GetTestDeclIndex( lineNum )
  return matchstr( getline(a:lineNum), '^e\zs\d\ze_')
endfunc
" echo GetTestDeclIndex( 6 )
" echo GetTestDeclIndex( line('.') +1 )
" e2_database4 = database4 Nothing 99

func! GetAssertionIndex( lineNum )
  return matchstr( getline(a:lineNum), '^a\zs\d\d\ze_')
endfunc
" echo GetAssertionIndex( line('.') +2 )
" echo 10 + eval( GetAssertionIndex( line('.') +1 ) )
" a14_database4 = id e1_database4 == (i∷ [(String, Int)])



" ─   "unique functions"                                 ■
nnoremap <localleader>hu ^icb<esc>:call RandFnName()<cr>2w
nnoremap <localleader>hU ^icb<esc>:call RandSymbol()<cr>A :: String<esc>^ywo<esc>PA= undefined<esc>w
" produces a (test) haskell function with a random name, ejk.:
" cp0 = undefined
" "unique symbol"
nnoremap <leader>hus :call RandSymbol()<cr>

" "expand function" expand a symbol name to a function stub
" nnoremap <leader>ef A ∷ String<esc>^ywo<esc>PA= undefined<esc>b
" nmap <leader>fe A :: String<esc>^ywjPA= undefined<esc>b
" Issue: This clutters the register
" nnoremap <localleader>ht ^yiwko<esc>PA :: a<esc>w

" TODO adapt other stub maps to not use yank register
nnoremap <localleader>ht :call Stubs_ExpandATypeSign()<cr>
func! Stubs_ExpandATypeSign()
  let symbName = GetTopLevSymbolName( line('.') )
  let lineText = symbName . ' :: a'
  call append( line('.') -1, lineText )
  normal! ^kww
endfunc
" Test:
" cbom0 :: a
" cbom0 = compare

" "expand signature" expand a signature to a function stub
nnoremap <leader>es ^ywo<esc>PA= undefined<esc>b
nnoremap <leader>hes ^ywo<esc>PA= undefined<esc>w

" "expand undefined": expand a signature to a function stub
nnoremap <leader>eu yiwo<esc>PA = undefined<esc>b
" nmap <leader>fe A :: String<esc>^ywjPA= undefined<esc>b


nnoremap <leader>uef <leader>us<leader>ef
" Test stub:
" nmap <leader>ts <leader>us<leader>ef
nmap <leader>hfs :call RandSymbol()<cr>A :: String<esc>^ywo<esc>PA= undefined<esc>w

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
" ─^  "unique functions"                                 ▲


