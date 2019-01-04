----------------------------------------------------
# Navigate Containers & Objects
   Tag, Folds, Marks
   * Files, Foders
   * vim-Buffers
   * vim-Wins   → vim-Tabs
   * tmux-Panes → tmux-Windows
   * OS-Wins    → OS-Apps
----------------------------------------------------

## New vim-Window:
  'split' current buffer
    * `<c-w>s` `:sp` below
    * `<c-w>S`(v?) `:vs` left
  launch 'new' buffer
    * `<c-w>n` `:new` below
    * `<c-w>N` `:vnew` left
  with existing buffer/file
    * CtrlP `o` + `h/v`
    * TODO / Issue: above still does not force a split with exsisting buffer

  from selection
    * `c-w gss` or `.. gsa` for split above
    * Pin a paragraph to the top: `vip<c-w>gsa`

## New vim-Tab
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


## Folders

## Arglist

  * `args \`cat files.txt\`` get arglist from a file using backtick expression

### Argdo
  substitute in a selection of files:
  `vim /<c-r>// **/*.txt` previous search pattern in txt files in subfolders
  `QfToArgs | argdo %s//abc/g | update` run a command on all file in the quickfix list


## Registers
  * `qaq` to clear


## Cmdline
  `:find a<tab>` (e.g. in Haskell project folder) allows to:
  * Reach into subfolders (usind `set path+=**`, but this includes other folders)
  * autocompl menu
  * fuzzy complete (e.g. `:find *hs<c-i>` will show all haskell files)
  (https://www.kwyse.com/posts/twid-vim-minimalism/)
  * `cd .vim/plugged`, `:tabf[ind] *.md<tab>` to show all readme files

### Cmdline Menu
  (with setting `set wildmode=longest:list,full`)
  * `c-i` to start command line auto completion (or tab)
  * looking at the grid displayed options:
      * type the first char, then hit `c-i` again to expand the filtered options
  * `c-n/p` will suffle through in horz menu


## Summary of native vim file exploring
   https://vimways.org/2018/death-by-a-thousand-files/
   * `e **/*`
      set wildcharm =<C-z>
      `nnoremap ,e :e **/*<C-z><S-Tab>`
      `nnoremap ,f :find **/*.md<C-z><S-Tab>`
      `nnoremap ,f :find .**/*<C-z>` then c-c then type 'note' .. <tab> to get fuzzy searching


## Dirvish
  * `-` open / up/parent folder
  * `q` close
  * use 'filepath' of dirvish in command:
    * `cd %` set working dir
    * `edit %/foo.txt` create a file **TODO** how to save a temp/unsaved buffer by navigating to a folder, then `w #/filesname`
    * `]f/[f` next/prev file through all sub folders!
    * on a file name (which is a full file path under conceil):
      * `gf` or `<cr>` to `:e ` that file
      * `c-w f` to split view that file below
    * `yy` the path, then:
      * go to buffer and `:read <c-r>"` the content of the yanked path

  * ok, some new stuff in here

## Demo header with Purescript code
and a *simple* line of text with `code in` there

```purescript
ab ∷ Maybe Int → String
ab a = Just "Some"
  where
  aa = 123
  bb = "just some other val"
```
ok, could just put some text in here

## Arglist
  * use `x` and `dax` for arglist
  * `c-w v` then `[A`, `]a` to have a window (`c-w t` or tab) with this group of files!


how about folders?
  relation to files/buffer/tabs?
  create/remove
  ctrlP navigate



## Buffers
  States:
  1. **listed**: in the bufferlist (~in memory)
  2. **displayed**: in some window (or be hidden but still listed)
  3. *active*: displayed in the current window


## Insert mode

  `c-r <reg>` to paste while in insert mode

  `c-x c-f` to start filename browse mode!
  `c-x c-n` for completion. what the difference to just `c-n`?
  use `c-w` to delete a word at the prompt
  use the `*` to get fuzzy suggestions NOTE/TODO: this isn't *on the fly* fuzzy/ while you type - but completion plugins have this.

  use `gi` to resume insert mode where last exited


## Completion
  https://github.com/mhinz/vim-galore#completion

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

## Buffers
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

### Unlist Buffers

### Nav Buffers
  * **Reveal:** CtrlP `<c-v>` to reveal/go to buffer if it's **shown** in a tab-window somewhere
    * otherwise **open/load** buffer in a vertical split. can then `<c-w>c` that split or close the original or use
        `<c-w>T` to move it out of this tab into it's own tab.

### Load Open Buffer
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


## MacOS App windows
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
        `set tags?`
        `c-]` to nav, `c-t` to go back

    * see [Preview window](#Preview window)

[Config](../../.vimrc#Tags:)

### Changes
    * `:changes`
    * back to last change (e.g. paste) `\`.`
    * `g;` `g,` shuffle through changes

### Inserts
    * back to last insert

### Jumps
    * `:jumps`
    * could use CursorHold + updatetime (500 now → 1000) to add more to the jumplist? TODO
    * jumps are currently not centering the view - which might cause less view jumping but makes it harder to find
    cursor. 

## Marks

  * Deleting marks:
  `delm G-Z` to clear a range of marks
  `c-x` in markbar to delete selected mark

[config](../../.vimrc#Marks:)

## Folds, Folding
  `zk` `zj` to navigate
  `zo` `zc` `z<space>` to open/close/toggle individual folds
  `zM`  `zR` to close/open all folds
  `zm`  `zr` progressively close/open the fold levels (of nested folds)
  `zx` / `zX` update /re apply
  http://learnvimscriptthehardway.stevelosh.com/chapters/48.html
  " What actions automatically open folds?
  improve performance of autofolding https://github.com/Konfekt/FastFold

*v:foldstart* *foldstart-variable*
in tutor docs

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


## Align

 * `:Tabularize / /` to align to `" "`
     * uses smart paragraph


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

## Quickfix Locationlist Navigation
  * `leader qq`
  * `]q` with cursor in code,
  * `c-n/p` and `go` with cursor in quickfix list
  * `cnf[ile]` to go the first item in the next file
  * `:cdo {cmd}` run cmd on all qf entries, `cfdo cmd` runs on the files (?)
  * use `p` to open file:loc in preview window, `c-w z` or `P` to close preview

### Examples
  * `lvim /vimium/ .vim/notes/**` load vimseach results into location list
  * Grep to vim quickfix via process substitution: `nvim -q <(grep -rsni todo .vim/notes/**)` or `vim -q<(!!)`


## Sessions
save and restore a session with windows and tabs

----------------------------------------------------

## Tags
document hasktags workflow:
  in stack.yaml add this: `extra-deps: [hasktags-0.71.2]`

Tag screenshot featuring ctrlp and tagbar:
  ~/.vim/screenshots/tags-tagbar-haskell-ctrlp.png

run python that script, does this have --help?
produce ctags as a text file - where is this put?

optimize and document in vim-worksteps progressively:
  * generate `ctags` file
 ~  .vim  notes  python ~/.vim/plugged/markdown2ctags/markdown2ctags.py notes29-09.md
 (could just get to command history in terminal buffer - it now seems to be the same shell(zsh)
 instance??!)
  * ctrlP needed to be cced into that folder .vim/notes, to pick up the 'tags' file

current termina questions. see screenshot:
  how to get to command history how to copy this?
  how to copy/edit/get into vim a command I ran?
  same re the markdown2ctags.py --help output


## Tabline Statusline

## Working modes

TODO  make selection into window split? plugin

### Focused implementation of one code part

  Say you are starting at a clean slate
  * your code will start spanning more than the screen size
  * you will have to jump back and forth between multible code locations
  * you will create multiple files

location could be a
  * win split
  * mark
  * arglist entry


#### Permanent available
 * REPL
 * Tests

#### On demand available
 * doc access
 * notes access
 * git control
 * file explorer
 * launch/ transistion to the modes below

### Quick browse
 * want to explore/insight/confirm related code
#### Tags
 - `gf`, `c-w` `f/gf` to open tab/split?
#### Search
[notes](notes29-09.md# Searching)

#### CtrlP - Args, Buffers, other visit workspaces?
  * how to go back and/or pin/reference the code found?
#### File explorer
#### Exteral Info
  * Documentation
  * Google, websites/ browsertabs
  * Issues, stackoverflow, blogposts

  * most could be brought into vim?
  * otherwise
    * need to copy code via clipboard
    * need separate tab/workspace management

  → a google search for a specific problem produces
    * 3 - 8 tabs
    * several articles that take
      * time to scan
      * need to be re-read after/while implemetation
    * code copy paste
    * captured/ saved with comment with source url/search so it can be found later


### Side by side
#### working simultaniously
 * working back and forth between 2 or more source-code locs
   implementation of code that spans 2 or more distant source-locations (in some or other file)

#### show reference code
 * keep a code example visible/accessible
 * documentation, complementary code

## suspend / resume a task
documentation / multile parts of docs
overview - spin off
taking notes
keep as reference

Search and Explore should produce
  → little splits/ reminders that can be overseen then turned into
    1. a side-by-side/ split
    2. a todo (categorized and prioritised)
    3. a note (categorized and searchable)

### fuzzy file or directory browsing
  * want to preview file before selecting

### code search
  * want to preview/explore sourrounding code before
    * marking/pinning

this includes code search in past commits/ may result in checking out a file


* searching/ browsing/ scanning
then
* pinning to resume later
then
  * arrange in workspace - for side by side work
  * make todo or note

search and file explore is a progressive filtering process

marking/ pinning should have references (not copies) and previews

I might need/want
## a drawer/ stack of
   * previews
   * notes
   * references (urls, code)

## Preview window
  * `h preview-window`
  * `psearch <tagname>` opens a preview win with the target of the tag under the cursor
  * `c-w z` closes the preview window
  * see [Tags](#Tags), [Notes: Tags](notes29-09.md#Tags)


## Navigating markdown files
see/align with Github wiki repository
  * `]]` `[[` next/prev header
  * `to`, `to` to open and go to tagbar toc (use instead of `:Toc` command)
    * then `p` on a heading to focus the heading in the editor window while staying in tagbar
    * the `q` to close tagbar and have the cursor on the heading in the left window

### Create hyperlink to header

use `c-]` (not `ge`) on the link text to navigate hyperlinks and `c-o` to jump back
  text [link to header in other .md file](notes29-09.md# Rich Text) next text
    * note the space after `#` and that only the beginning of the (case sensitive?) header text needs to match
  text [link to header in same file](# Navigating markdown) next text
  text [link to an .md file](notes29-09.md) next text
  text [link to website](http://purescript.org) next text
    * have to use `gx` on either the link text or the url
text [link to string in other file type](commit-nts1.txt#Command) next text text [link to string in other file type](commit-nts1.txt#Vimium) next text text [link to string in other file type](../utils/termin1.vim#PURESCRIPT) next text
  jump to [Repl eval docs in termin1.vim file](../utils/termin1.vim#Repl Eval Insert:) using relative-back path, not having to escape white space
  from any filetype to any search-word: ~/.vimrc#/set whitespace escape: help:rel.txt#/should%20refer
  text commit-nts1.txt#/#%20Vimium%20workflow


## Folding
have the entire file (auto)folded, sort of archieves a similar effect? it can highlight (expand) several parts of an
otherwise collapsed [#Preview window] file. and bring some relavant code parts to attention/ mark them by having them open/ active.
- it requires constant expanding collapsing?
- it can't span different files?

explore/search/notes might feed into this

* copy a selection of code (or text)
* include file location or url+header
* add notes
* add tags
* add prio/reminder

this could be one long buffer that can be filtered easily

arglists and marks:
 * allow to swap content of splits
 * may want to have a stack with name/label/line-preview visible
 * want more destinct select than [a ]a? or is this 'a 'b 'c?

     marks would allow to include exact locs
     ideally would want to be per tab
     but allow to pull in marks from other tabs



## Code Movement, Motions, Editing

### TODO
  * DONE: I often want to paste/copy to the end of the line but excluding the new-line character


### Line
  * line text object `al` `il`

### Targets
  * Pairwise: `i)` `a)` `I)` `A)`
  * Next/Last pairwise: `in)` `c2in)` change 2 inside next parentheses
  * Seek: `vI)` selects "eins" from here: X
    > ( eins ), ( zwei ), ( drei)
  * Separator: `i,` `a,` `I,` `A,`
  * Arguments: `ia` `aa` `Ia` `Aa`

### CamelCaseMotion
  Use e.g. `v2i,w`, `vi,e`, `v,b,b,b`
  Example:
    > script_31337_path_and_name_without_extension_11
    > set Script31337PathAndNameWithoutExtension11=%~dpn0
    > v3iw selects script_31337_path_and_[name_without_extension_]11
    > v3ib selects script_31337_[path_and_name]_without_extension_11
    > v3ie selects script_31337_path_and_[name_without_extension]_11
    > Note there are no "around" textobjects

### Deleting parts of a line
  * delete till end of the line `C` or `d$`
  * delete all chars `cc` or `dD`
  * delete line `dd`


### EasyClip notes
  * delete does not change clipboard, but <localleader>d does
  * `S` substitute motion
  * yank stack use with <leader>"<regnum>
    * persisted and shared with vim instances

> Exercise: Sort these arguments
fnName( drei, zwei, eins, vier)
fnName( eins, zwei, drei, vier)
fnName( drei, zwei, eins, vier)
> Solution:
let @r='yIaWWyw"1SwBBSw0j'
nmap <leader>ab :normal yIaWWyw"1SwBBSw0j<cr>
> use @@ to rerun the macro


