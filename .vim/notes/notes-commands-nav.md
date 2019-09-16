# Current commands

### Language client
ged         - show diagnostic message in float-win
gd, ,gd     - go to definition /in split
leader lk   - Symbol documentation
leader la   - Code action → import symbol!
insert c-i  - show completions with type sig!
insert c-n  - non LC show omnicomplete (symbols of other buffers..?)

### Intero
gw, gW      - show type at/vis-sel / generic type
get         - show type of symbol or vis sel (also works when module not compiles)
,gw         - insert type above
gek         - kind at symbol or vis sel
ges         - run symbol
ges vis-sel - run expression!

ger         - Curl send sting in line to localhost, show response

### Hs API Explore
gsd/D       - to edit vis-sel and search for it
gsk         - to insert info into buffer - using the module name (cursor on module shows module info!)
gsK         - show info in float-win
gsb/B       - browse module
,atip/iB    - to HsTabu Type-sig align a range: Use l, \j or 'v' visual-sel
2leader sm  - SplitModulesInLines
2leader jm  - JoinModulesFromLines
2leader ht  - HsTabu
2leader hT  - StripAligningSpaces
2leader sa  - StripAligningSpaces
2leader hu  - HsUnicode
2leader hU  - HsUnUnicode

### Imports
leade hii/I - (in HsAPI) import identifier
leader lhi  - import identifier via LClient
leader hfi  - format imports

TODO make Stubs and Markup maps consistent
### Stubs
leader hu/U - anonymous binding /+ signature
leader ht   - add type stub
leader es   - add function to type-sig/ expand signature
leader if   - add an index/num to the signature-symbol name
leader ct   - create inline test stub
leader ca   - create assertion
>>>>>>>
leader eu/U - anonymous binding /+ signature
leader es   - add signature type stub
leader eb   - add function to type-sig/ expand signature
leader ei   - add an index/num to the signature-symbol name
leader et   - create inline test stub
leader ea   - create assertion

### Code Markup
leader ch   - heading
leader cs   - close section
leader cr   - refresh heading/section
leader cd   - delete/strip heading/section
>>>>>>>
leader ehs  - heading
leader ehe  - close section
leader ehr  - refresh heading/section
leader ehd  - delete/strip heading/section


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
leader wp   - pin a function/paragraph (or imports) to the top

### Files
\v \T       - browse-open file in split/tab
#### Dirvish
t           - open in new tab
p           - preview in split
leader P    - preview in float-win
#### Arglist
,x          - toggle to from arglist (x, vis-sel, line-motion)
            - " Tip: can add popular folders as well, then CtrlP-v/t to open the dirvish pane
            leader oa   - show arglist in CtrlP. v/t to open. <c-s> to delete

### Command window
;           - then c-n and c-i and c-x c-f for completion.
            " - c-cr/return to commit in insert mode. leader se in normal mode


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
leader ha (+m/vs) - type-sig align (motion or vis-sel) 'aB'-> error?
leader hA   - type-sig align entire buffer. or "viB<space>ha<c-o>"

### Motions
g;          - to revert the InsertLeave jump
gI^- <cr>   - to prefix the current line with a '- ' without movng the cursor
q/Q         - labels
tab/s-t/,t  - Headers next/prev /end of header
c-i/m       - ballparks
]b[b        - binding-type sig (incl where, let)
cib         - to change the binding name in consequtive lines
Y/I         - columns
J/K         - start of line | use to jump to virtual line starts in concealed top level binds
t/T         - next/prev list item
]t/[t       - into next/prev inner list
]T          - end of list (to append new elements)
[g ]g       - go back to last insert start/end. or native \`[ \`]
z] z[ zk    - beginning/end of current fold/prev fold
[c ]c       - prev/next git hunk (TODO: make ]c or c] consistent?)
,j/k        - end/start of indent block
,J/K        - end/start of indent block

### Tools
leader og   - Git magit. Also :GitcommitAuthor
leader oG   - Git gitV viewer
leader ot   - Tagbar
leader om   - Markbar
leader oU   - Undo tree (Mundo)

### Rename
leader lr/m - rename symbol with all it's live/active references
ga \raf     - highlight/search symbol, \r + range of the replace. leader-rb is a sortcut for a haskell function rename
leader rb   - to rename a binding and its occurences

### Vim
leader sm   - show past vim echoed text (show messages)


