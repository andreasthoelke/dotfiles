----------------------------------------------------
# Navigate Containers & Objects
   * Tags, Folds, Marks
   * Files, Foders
   * vim-Buffers 
   * vim-Wins   → vim-Tabs 
   * tmux-Panes → tmux-Windows
   * OS-Wins    → OS-Apps
----------------------------------------------------

### New vim-Window:
  'split' current buffer
    * `<c-w>s` `:sp` below
    * `<c-w>S`(v?) `:vs` left
  launch 'new' buffer
    * `<c-w>n` `:new` below
    * `<c-w>N` `:vnew` left
  with existing buffer/file
    * CtrlP `o` + `h/v` 
    * TODO / Issue: above still does not force a split with exsisting buffer


### New vim-Tab
  with current buffer
    * `:tabe` or `:tabe somename` for a new/temp buffer
    * `<c-w>t` or `:tabe %` to zoom/duplicate the current buffer in the tab
    * `<c-w>T` to spin off a window to a tab
  with other buffer/file
    * ctrlP `o` + `t` 
    * nerdtree `t`

### Close vim-Window
  * `<c-w>c` 
  * `:q`
  window and buffer
    * `:bd` the buffer (when last window)

### Close vim-Tab
  * `gx` and go to prev Tab
  * `:tabc`
#### tab and buffer
     * `:bd` the buffer (when last window)

### Nav vim-Tabs
  * go next / prev `<c-d>` / `<c-f>` 
#### Arrage Tabs
  * move tab left/right `[t` `]t`

### Nav vim-Windows
  * go left, right, up, down `<c-w>h/j/k/l`
#### Arrange Windows
  * zoom to (temp) tab `<c-w>t` then `gx`
  * swap `<c-w>r`
  * `<c-w>HJKL` push window to left/down/up/right
#### Resize Windows
  * expand left/down `<c-.>` / `<c-,>`
  * equal size `<c-w>=`


## Files
  States:
  1. **created**: by saving the content of a buffer
  2. **loaded**: in a buffer

## Buffers
  States:
  1. **listed**: in the bufferlist (~in memory)
  2. **displayed**: in some window (or be hidden but still listed)
  3. **active**: displayed in the current window

> Tab navigate the file system while in insert mode
inoremap <Tab> <c-x><c-f>
" In command mode use <c-d> and Tab
  Example path: `Documents/PS/2/pux-todo/README.md`
  this works nicely with <c-j/k/l> nav
  ⇒ maybe mapping to produce, then copy and delete the path from insert/normal mode and past it to command?
In command mode (see `:h cmdline-completion`) after `:e ` 
 1. `c-d` to show all options
 2. then (optionally) type a char or two
 3. then `c-n` (or `c-i` or Tab) and `c-p` to go back and forth through the options
 (1.) `c-d` selects/locks-in the currently selected element and displays child options
 ⇒ `c-d` - `c-p/n` in alternation
 * `c-w` to delete a word back

Navigate in scrollback history: 
  * <c-p> to go back in command history, <c-n> to go forward in history.

code auto completion: 
  Vim Completes me (currently testing)
  Youcomplete-me is sort of difficult to install?
  alternative: https://github.com/ncm2/ncm2 or Shougo/deoplete.nvim

### List Buffers
  Create New (File)
    **Current Win** 
      * `:e <new path/name>` create in the curr win
    **New Win**
      * `<c-w>n/N` create below or left
      * CtrlP `<new path/name> <c-y>` create left
    **New Tab**
      * CtrlP `<new path/name> <c-y>` create left && `<c-w>T` 

  From File
    **Current Win** 
      * `:e <filename>` list a buffer and display it in the curr win. (currently no use to list but not display buffer)
      * CtrlP `o` + `r` (in file, mru) to list a buffer and display it in the curr window (no matter if buffer is displayed in other wins)

#### Unlist Buffers

### Nav Buffers
  * **Reveal:** CtrlP `<c-v>` to reveal/go to buffer if it's **shown** in a tab-window somewhere
    * otherwise **open/load** buffer in a vertical split. can then `<c-w>c` that split or close the original or use
        `<c-w>T` to move it out of this tab into it's own tab.
#### Load Open Buffer
  * **New Tab:** CtrlP `o` + `t` to load buffer into new tab (no matter if buffer is shown somewhere

alternate between prev and current buffer: `:e #` `,`

  * `\tc` for tabc[lose]
  * `\bd` for `:bd`
  * `\tm[` 

" Select multiple files with <c-z> then do <c-o> to load the first into the current window (r) and
to then hide the splits (undo the visual), <c-o> on the first win and <c-w>D or <c-w>o to close the splits
to undo 

use <c-o> open menu?

### New vim-Buffer
  in the same window:
    new/temp file
      * `:e temp1` this needs a (temp?) filename
    existing file or buffer
      * shuffle with airline menu? `<c-d/f>`
      * ctrlP `c-o`, `r` (replace)
      * `:e <tab>` complete from files in the workingdir
      * `:bu <tab>` complete from open offers!
  in new window:
      * `:new` / `<c-w>n` new buffer below
      * `:vnew` new buffer to the right


### close buffer
  * `gx` leaves window open
  * `:bd` closes window/tab


### navigate MacOS App windows
  * `<c-s-w>` next app window (within the current workspace/desktop)
    (defined in `System preferences/Keyboard/Shortcuts/Keyboard` )

### navigate MacOS Apps
  * `<cmd-c-[/]>` prev/next app (showing open apps menu)
    (use to select the app to toggle with) ISSUE: difficult to put thump on cmd
  * `<c-'>` toggle between second app (in apps menu)
    Defined in  `~/.config/karabiner/karabiner.json`
      "description": "Left Control + ' to cycle through running applications (like command+tab).",

## Code navigation
### Tags
    * `:tags`
### Changes
    * `:changes`
    * back to last change (e.g. paste) `\`.`
### Inserts
    * back to last insert
### Jumps
    * `:jumps`


## MARKS
are those recognizing tabs? (no and this may be good)
do a mark not per file but per win/tab?

## Folds, Folding
`zk` `zj` to navigate
`zo` `zc` `z<space>` to open/close/toggle individual folds
`zM`  `zR` to close/open all folds
`zm`  `zr` progressively close/open the fold levels (of nested folds)
`zx` / `zX` update /re apply 
http://learnvimscriptthehardway.stevelosh.com/chapters/48.html
" What actions automatically open folds?
### set foldmethod=marker
integrate fold chars into comments: `fold-create-marker`
haskell (∷?) 'foldmarker' 'fmr'	string (default: "{{{,}}}")
  * Example: begin fold: {{{1 end: }}}
             from "Compos.hs": displayWR ∷ Float → App String -- {{{1
### set foldmethod=syntax
see :syn-fold

### set foldmethod=manual
autohide/expand `foldcolum`? .. or just have a shortcut to toggle

`yofc`

## Code Navigation
* how to navigate header like this:?
SOME *|*
let g:nnoremap = {"]t": "", "[t": ""}
how can I list/find/browse (ctrlp?, tagbar, quicklist) doc tags in e.g. .vimrc?
examples: 
  " Git Workflow: ------
  " Windows: --------
* make Links in vimscript

document |bracket-navigation|
*)* next open
|%| or *]}* closing pair
*[{* parent
NOTE this is not complete - research full solution?
* does not move to "[" as parent → vim navigate json file

  * jump to start/end of inserted/pasted text `\`[ \`]`
  * jump to start/end of previous selection \`< \`>

  * Using seach to navigate
    You can get an empty line with /^$; or if you don't want to select the empty line itself you can use \n\n to put the cursor at the end of the line before the first blank line:
    * <S-v>/^$<CR>
    * <S-v>/\n\n<CR>

  * go to the end of a comment: ]/ , end of parant ])
  * use `gv` to reactive the prev selection or a selection created with `m<`, `m>`

  * nav in markdown (and other langs?) with text objects/motions: https://github.com/coachshea/vim-textobj-markdown

## Sessions
save and restore a session with windows and tabs

----------------------------------------------------


