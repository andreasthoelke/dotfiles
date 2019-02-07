
-- Prelude
traverse  ∷ (Traversable t, Applicative f) ⇒ (a → f b) → t a     → f (t b)
{- base Prelude
Map each element of a structure to an action, evaluate these actions
from left to right, and collect the results. For a version that
ignores the results see traverse_. -}
-- Data.Traversable
traverse  ∷ (Traversable t, Applicative f) ⇒ (a → f b) → t a     → f (t b)
-- Control.Lens.Traversal
traverse  ∷ (Traverse_ t, Applicative f) ⇒ (a → f b) → t a     → f t b
{- lens Control.Lens.Traversal
Map each element of a structure to an action, evaluate these actions
from left to right, and collect the results. For a version that
ignores the results see traverse_. -}
-- Text.Trifecta.Util.Array
traverse  ∷ Applicative f                  ⇒ (a → f b) → Array a → f (Array b)
-- Data.Foldable
traverse_ ∷ (Foldable t, Applicative f)    ⇒ (a → f b) → t a     → f ()



traverse  ∷ (Traversable t, Applicative f) ⇒ (a → f b) → t a     → f (t b)          Prelude

traverse  ∷ (Traversable t, Applicative f) ⇒ (a → f b) → t a     → f (t b)          Data.Traversable

traverse  ∷ (Traverse_ t, Applicative f)   ⇒ (a → f b) → t a     → f t b

traverse  ∷ Applicative f                  ⇒ (a → f b) → Array a → f (Array b)      Data.Foldable

traverse_ ∷ (Foldable t, Applicative f)    ⇒ (a → f b) → t a     → f ()


traverse  ∷ (Traversable t, Applicative f) ⇒ (a → f b) → t a     → f (t b)
  {-lens Control.Lens.Traversal -}
traverse  ∷ (Traversable t, Applicative f) ⇒ (a → f b) → t a     → f (t b)
  {-{{{lens Control.Lens.Traversal
  Map each element of a strucTure to an action, evaluate these actions
  from left to right, and collect the results. For a version that
  ignores the results see traverse_. }}}-}
traverse  ∷ (Traverse_ t, Applicative f) ⇒ (a → f b) → t a     → f t b

traverse  ∷ Applicative f                  ⇒ (a → f b) → Array a → f (Array b)

traverse_ ∷ (Foldable t, Applicative f)    ⇒ (a → f b) → t a     → f ()


let concealID = matchadd("Conceal", "{-", -1, -1, {"conceal": ""})
let concealID = matchadd("Conceal", "-}", -1, -1, {"conceal": ""})
let concealID = matchadd("Conceal", "{{{", -1, -1, {"conceal": ""})
let concealID = matchadd("Conceal", "}}}", -1, -1, {"conceal": ""})

echo matchadd('Conceal', '{-', -1, -1, {'conceal': ''})
call matchadd('Conceal', '-\}', -1, -1, {'conceal': ''})
call matchadd('Conceal', '\{\{\{', -1, -1, {'conceal': ''})
call matchadd('Conceal', '\}\}\}', -1, -1, {'conceal': ''})
set conceallevel=2

call matchdelete( concealID )
call clearmatches()

nnoremap <leader>hl :call nvim_buf_add_highlight( bufnr(''), g:nsid_def, 'Folded', line('.')-1, 0, 120)<cr>

set foldtext=foldtext()

setlocal foldtext=HoogleInfoFoldtext()
func! HoogleInfoFoldtext()
  let l:line = split( getline(v:foldstart) )
  return '  ' . l:line[ 1 ]
endfunc

eins

HsPsTypesExplore



