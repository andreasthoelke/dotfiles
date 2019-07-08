
func! GetTopLevSymbolName( lineNum )
  return matchstr( getline(a:lineNum), '^\S*\ze\s')
endfunc
" echo GetTopLevSymbolName( line('.') +1 )
" aber arg = eins
" aber ∷ eins

" Return the previous function name
func! GetTopLevSymbolNameBackw()
  let lineNum = TopLevBackwLine()
  return GetTopLevSymbolName( lineNum )
endfunc
" echo GetTopLevSymbolNameBackw()


" Like <cword> but includes Haskell symbol characters
func! HsCursorKeyword()
  let isk = &l:isk
  " Tempoarily extend the isKeyword character range
  setl isk+=.,<,>,$,#,+,-,*,/,%,',&,=,!,:,124,~,?,^
  let keyword = expand("<cword>")
  let &l:isk = isk
  return keyword
endfunc

" Get the type signature from line
func! HsExtractTypeFromLine( lineNum )
  let line  = getline( a:lineNum )
  let pattern = '\v^.*(∷|:)\ze'
  return substitute( line, pattern, '', '')
endfunc
" Control.Monad replicateM :: (Applicative m) => Int -> m a -> m [a]
" echo HsExtractTypeFromLine( line('.')-1 )
" Control.Monad replicateM ∷ (Applicative m) => Int -> m a -> m [a]
" echo HsExtractTypeFromLine( line('.')-1 )

func! HsExtractReturnTypeFromTypeSigStr( typeSigStr )
  let list = split( a:typeSigStr, '\v(∷\s|⇒\s|→\s)' )
  return list[ len( list ) -1 ]
endfunc
" Control.Monad replicateM ∷ (Applicative m) ⇒ Int → m a → m [a]
" echo HsExtractReturnTypeFromTypeSigStr( getline( line('.')-1 ) )

func! HsExtractArgTypesFromTypeSigStr( typeSigStr )
  let mainPartsList = split( a:typeSigStr, '\v(∷\s|⇒\s)' )
  " let signatureTypes = split( mainPartsList[-1], '\v→' )
  let signatureTypes = split( mainPartsList[-1], PatternToMatchOutsideOfParentheses( '→', '(', ')' ) )
  let argumentsTypes = signatureTypes[:-2]
  return TrimListOfStr( argumentsTypes )
endfunc
" Control.Monad replicateM ∷ (Applicative m) ⇒ Int → m a → m [a]
" echo HsExtractArgTypesFromTypeSigStr( getline( line('.')-1 ) )
" Control.Monad replicateM ∷ (Applicative m) ⇒ Int → (a → b) → m a → m [a]
" echo HsExtractArgTypesFromTypeSigStr( getline( line('.')-1 ) )

func! HsGetTypeFromSignatureStr( signStr )
  return matchstr( a:signStr, '\v(∷|::)\s\zs.*')
endfunc
" Control.Monad replicateM ∷ (Applicative m) ⇒ Int → m a → m [a]
" echo HsGetTypeFromSignatureStr( getline( line('.')-1 ) )

func! ArgsPlacehoderStr ( argumentTypesList )
  return Reduce( {acc, nextStr -> acc . '(i∷ ' . nextStr . ') '}, a:argumentTypesList )[0:-2]
endfunc
" echo ArgsPlacehoderStr( ['a → b', 'Maybe a'] )

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


