## Current commands
leader lk   - LC Symbol documentation
leader la   - LC Code action → import symbol!
insert c-i  - LC show completions with type sig!
insert c-n  - non LC show omnicomplete (symbols of other buffers..?)
leader hi   - format imports

gw, gW      - IN show type at/vis-sel / generic type
get         - IN show type of symbol or vis sel
gek         - IN kind at symbol or vis sel
ges         - IN run symbol
ges vis-sel - IN run expression!
ger         - Curl send sting in line to localhost, show response
ged         - LC show diagnostic message in float-win
gd, ,gd     - go to definition /in split

### Hs API Explore
gsD         - to edit vis-sel
leader ha   - Type-sig align a range: Use l, \j or 'v' visual-sel


### Stubs
leader hu/U - anonymous binding /+ signature
leader ht   - add type stub
leader es   - add function to type-sig/ expand signature
leader if   - add an index/num to the signature-symbol name
leader ct   - create inline test stub
leader ca   - create assertion

### Code Markup
leader ch   - heading
leader cs   - close section
leader cr   - refresh heading/section
leader cd   - delete/strip heading/section

### Search & Docs
gsd         - hoogle search word under cursor or vis-sel
gsD <c-f>   - hoogle edit vis-sel or wuc: gsD then <c-f> .. <c-c><cr> (?)
gsh         - search hoogle.org
gse         - explore definition (haskell-code-explorer.com)
Fhask       - search local haskell code exampes: /6/HsTraining1/** 6/HsTrainingBook2/** ~/.vim/utils/utils-search.vim#/command.%20-nargs=1%20Fhask 
Fdeleted    - deleted code in repo
Lines, GFiles?, BCommits, Maps, Helptags


### Win, Buffer Navigation
c-w n/N     - SymbolNext SplitTop
c-w i       - jump into float-win
#### Dirvish
t           - open in new tab
p           - preview in split
leader P    - preview in float-win

### Command window
;           - then c-n and c-i and c-x c-f for completion.
            " - c-cr/return to commit in insert mode. leader se in normal mode

### Arglist
,x          - toggle to from arglist (x, vis-sel, line-motion)
            - " Tip: can add popular folders as well, then CtrlP-v/t to open the dirvish pane
            leader oa   - show arglist in CtrlP. v/t to open. <c-s> to delete

### Git
leader gg   - GitGutterToggle
]c [c       - GitGutter Next/Prev Hunk
GitGutter.. UndoHunk, ..PreviewHunk

lead lg/lG  - go to definition/ in split

### Intero Errors or Warnings
leader qq   - open QFL
[Q [q ]q    - go to first/prev/next error (while in main win)
c-n/p       - next/prev (while in QFL)
go (in QFL) - jump to line (but stay in QFL)
p           - to open file:loc in preview window, `c-w z` or `P` to close preview

### LC Warnings AND Errors
leader ll   - open Loclist
[L [l ]l    - go to first/prev/next error/warning (while in main win)
Go (in LLi) - jump to line (but stay in LocList)
c-m/i       - next/prev in QFL
p           - does not work! .. could set up a split?

### Align, Indent
\,l/j/}     - intent range of lines to current cursor H
dw          - align/pull inwards to the cursorH the first char to the right
`>ii`         - shift lines of indent block to the right
leader al   - easy align
leader a-ii - align a 'case' block! to '->'

### Motions
g;          - to revert the InsertLeave jump
q/Q         - labels
tab/s-t/,t  - Headers next/prev /end of header
c-i/m       - ballparks
]b[b        - binding-type sig (incl where, let)
Y/I         - columns
J/K         - start of line | use to jump to virtual line starts in concealed top level binds
t/T         - next/prev list item
]t/[t       - into next/prev inner list
]T          - end of list (to append new elements)

" ─   Bindings, including where/let                     ──
`]b`, `[b`      - for next/prev binding
`cib`         - to change the binding name in consequtive lines

### Rename
leader lm   - LC menu:rename to rename symbol with all it's live/active references
ga \raf     - highlight/search symbol, \r + range of the replace. leader-rb is a sortcut for a haskell function rename
`<leader>rb`  - to rename a binding and its occurences
