# dotfiles
VimScripts for Haskell &amp; Purescript dev

![](https://github.com/andreasthoelke/dotfiles/blob/master/.vim/screenshots/ScreenShot1.png)

### Features:

#### Run Repl/Ghci function calls in the code buffer (Haskell & Purescript):

In the screenshot/code example above run 'gei' ("go evaluate insert") on this line:

```
-- getDog14 andr1
```
The result of the evaluation is inserted below:
```
-- Dog {dogsName = DogName "Suslik", dogsAddress = Address "Berlin"}
```
(See `ReplEvalExpr_Insert` in `.vimrc`)

#### Import Haskell identifiers using Hoogle and Hsimport:
1. Use "gsd" ("go search docs") on a missing identifier or e.g. ":Hoogle replicateM"/ or "Hoogle (Applicative m) ⇒ Int → m a → m [a]"
2. In the hoogle list of available identifiers, go to the line/version you want to import and 
" run <leader>ii to import the identifier (confirm the import section of your source file has added the identifier)
  
(See `HoogleImportIdentifier` in `.vimrc`)
