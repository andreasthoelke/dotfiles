## Housekeeping & Cache Files

### Shada
  * `ShadaClear` does: "!rm" . ' ~/.local/share/nvim/shada/main.shada'

  * Marks save format:
          Global mark with timestamp 2018-12-21T18:29:55:
            % Key  Description  Value
            + n    name         'A'
            + f    file name    "/Users/andreas.thoelke/.vim/notes/notes29-09.md"
            + l    line number  730
            + c    column       0
  * also contains jumps, changes, history, ..
  * does this replace all/most of what is stored in .viminfo file?

[config](../../.vimrc#Shada:)

### Viminfo file
  * see ~/.viminfo
     * Command Line History (newest to oldest):
     * Search String History (newest to oldest):
     * Registers
     * Jumplist
     * History of marks within files (would like to turn this off)

### Vimtmp folder
  * see ~/vimtmp/
     * use `c-w f` to get into dirvish
     * delete the 'bak-..' folders
     * rename `view` and `undo` to 'bak-..'
     * create new view and undo folders

### Todos
  * automate this? with VimLeave? [cleanup](../../.vimrc#Cleanup:)

## Styles
reactive and test haskell-vim first
this or the purescript one seems needed for:
  NLKNguyen/papercolor-theme https://github.com/NLKNguyen/papercolor-theme
  another one:
  https://github.com/kamwitsta/flatwhite-vim

font: Iosevka - for writing

  * Commented segments in code, like: https://github.com/sdothum/dotfiles/blob/master/vim/.vim/config/buffer.vim
  * Should be lined to Tags and Folds

  * Marks and Registers: https://github.com/Yilin-Yang/vim-markbar

  * scroll indicator https://www.reddit.com/r/vim/comments/6xkjz9/presenting_vimlinenoindicator_see_your_position/

## Textobjects
https://github.com/wellle/targets.vim

https://github.com/bkad/camelcasemotion
  * do inner word selects! v3ie selects script_31337_path_and_[name_without_extension]_11

https://github.com/coderifous/textobj-word-column.vim
  * vicA - Append new text to a column

  * `Haskell` function next/prev: http://silly-bytes.blogspot.com/2016/08/vim-haskell_11.html
    au FileType haskell onoremap <silent> ia :<c-u>silent execute "normal! ?->\r:nohlsearch\rwvf-ge"<CR>
    au FileType haskell onoremap <silent> aa :<c-u>silent execute "normal! ?->\r:nohlsearch\rhvEf-ge"<CR>
    function! JumpHaskellFunction(reverse)
        call search('\C[[:alnum:]]*\s*::', a:reverse ? 'bW' : 'W')
    endfunction
  * `Haskell` textobjects only has 'inner function': https://github.com/gilligan/vim-textobj-haskell/blob/master/plugin/textobj/haskell.vim

additionals
https://github.com/kana/vim-textobj-user/wiki



## Splits
  * https://github.com/wellle/visual-split.vim
  * extend this to splitting out to (the top of) a right bar column


## Email
https://github.com/danchoi/vmail
http://nosubstance.me/post/mutt-secret-sauce/




## Documentation Readme
  * using git tags and releases
  * list features plugins
  * refactor into smaller scripts?
  * use standardized comments/section formatting
      * that allows
        * automatic folding
  * document processes with https://asciinema.org/ (list command strokes, include comments, include
      a clickable table of contents)

## Searching
  * `q/` search history
  * `HelpGrep` to seach vim help (rename?)

" This works pretty well. could reuse for other purposes
command! Todo Grepper -tool git -query -E '(TODO|FIXME|XXX):'

Populate arglist with Dirvish, then use `##` special symbol to search through these files
  read: Tip 13: Searching Files with Grep-Alikes

## Undofile Shada

  `:verbose e .config/alacritty/alacritty.yml" 491L, 18989C`
    Reading ShaDa file "/Users/andreas.thoelke/.local/share/nvim/shada/main.shada" marks
    Reading undo file: /Users/andreas.thoelke/vimtmp/undo/%Users%andreas.thoelke%.config%alacritty%alacritty.yml

  TODO: Does vim resume undohistory after git-checkout?
        git check in ShaDa and undo files

## Code Motions
  Sneak
  * move to (2 chars): `f/F` <.><.> `:`/`H`
  * move before (1 char): `t/T` <.>
H/L maps

  word motion for camel casing?


## Chrome Bookmarks:
A simple big JSON file `Library/Application\ Support/Google/Chrome/Default/Bookmarks`
{
  "date_added": "13151100891640297",
  "id": "5498",
  "meta_info": {
    "last_visited_desktop": "13180999900501445"
  },
  "name": "Haskell Development with Neovim - Bits, Bytes, and Words",
  "sync_transaction_version": "25798",
  "type": "url",
  "url": "https://blog.jez.io/haskell-development-with-neovim/#fn:3"
}

## Processing Lines & Columns
  * Sort: [range]sort u %sort u
  * Sustitute: [range]s/,/;/g
  * Make nice-looking ascii table: `[range]CSVTable<cr>` using `csv.vim` plugin
  * How can I address/select a column in table data using s/..
  * How to set up conditions for that value, to add/change something in that line


## Editing commands in terminal mode and the shell
* term cursor posion vs. normal mode position
  > how to see and move both. in- and outside of vim

## Dirvish


## NOTES .MD EDITOR
Sync markdown on leave insert

add #to-learn tags onto mappings/tips? haskell conclusions?
remind about these in the notes taking app?

* use the conceil feature to highlight code/keywords/tags in haskell and vim comments
* include tags for folding → }}}
* autogen }}} tags based on ctags?
* ctags toc for vimrc using regex `Folding: ---"`


integrate screenshots into notes? markdown
push markdown to google docs?

this is super nice for all the quick notes:
" TIP: Vim-anywhere replacement: use: "alfred vim(mac vim)", edit text, then
" do "<leader>ccl" to copy to clipboard and ":q!" vim.

how can I use the markdown preview with this?
- jobsend for vim 8
create a markdown filetype command?
write *emails* in markdown

there is also vim-pencil and http://vimwiki.github.io/ and vim-orgmode
    * see for wiki&markdown integration: https://www.reddit.com/r/vim/comments/9riu4c/using_vimwiki_with_markdown/

## Rich Text Comments In Referened Meta File

Take mark-up comment meta files
A list of record that refer to line numbers in different files
Will show expand tags in the runnable source file to see the notes.



## Markdown

* show document outline/contents in tagbar?
* navigate this outline
* navigate/format hyperlinks/weblinks
    * in vim(help) these are tags. can I create/use haskell/markdown tags? (is tagbar related?)
    * make grep search for a text tag through most recent files? show first result in split?
* learn markdown editing
    * how to format/indent lists?

* haskell/ps comments support syntax highlight for code blocks?


## Tags
[Config](../../.vimrc#Tags:)

> When you are using Language Servers with LanguageClient-neovim, You can use PreviewFile to preview definition instead of jump to it:
> call LanguageClient#textDocument_definition({'gotoCmd':'PreviewFile'})
> Your current buffer will not be switched away, and just close the preview window by CTRL+W z when you are done.


## Haskell IDE Engine LSP setup
* https://www.reddit.com/r/haskell/comments/a4lr0h/haskell_programming_set_up_in_vim/

intero-neovim?



## Git
  * show number of unstaged files/hunks in (tmux?) status?
  * Diff against last commit (instead of staging area)
  * test using vimdiff in git: `git config --global diff.tool vimdiff`


## Pandoc
links in haskell docs lhs? pandoc

support: literate haskell, SoH Markdown

not hide/conceile image tags in markdown
can I just use html image tags in markdown?




## Syntax Tricks
format/syntax highlight a filepath so it only show on cursor over?
<!-- syn match purescriptFunction "\%(\<instance\s\+\|\<class\s\+\)\@18<!\<[_a-z]\(\w\|\'\)*\>"  contained -->
  * Select PS function via syntax file?
consider using vim help syntax for .txt files
https://stackoverflow.com/questions/3847224/documentation-for-vim-help-file-markup

Different syntax highlighting within regions of a file!!
http://vim.wikia.com/wiki/Different_syntax_highlighting_within_regions_of_a_file





## Vimium

other navigation transfer mappings to vimium?
file:///Users/andreas.thoelke/Documents/
  * github raw text has vim (but not vimium?), nicely `$` and `0` work here, but not `y`!? .. can
      use `cmd-c` instead.


## Todos

install plugins, run vimtutor of vim-pad

document, summarize markdown preview

find that 'gx' bug: in markdown the "gx" does not work

make a commit

fill line with dashes with repeat

*v:foldstart* *foldstart-variable*
in tutor docs

switch to foldcolumn = 1

move section? `Utility And Example Commands:`

review black hole delete:
when I have copy-deleted something, I may need to edit (e.g. delete) some code *before* I can paste
→ nmap de die"_dl

review:  EXTRACT SIGNATURES:
Folding

* code block to Gist: https://github.com/mattn/gist-vim

send meeting invites quickly
  show browser win at location -
  show e.g. a bookmark timebuddy, google search?


using shell alias
see: /Users/andreas.thoelke/.zshrc
run "alias" in terminal

spell check/suggest words like "jealous" when typing in messenger or slack
or should i send via API of these services?

allow iTerm to launch at different loc


" To delete all markers (as a last resort, just delete the ~.viminfo file!!

" Sneak Quick Navigation Find: ------------------------------------------------
set a different Sneak next key? .. I think L and H are fine

asana integration?
send to time manager! (have regular interval events?)

/Users/andreas.thoelke/.vim/init.vim|1680 col 22 m| B: " nnoremap <leader>mm :SignatureListGlobalMarks<cr><c-w>k
src/Aeson2.hs|126 col 15 m| D: val0 ∷ Value
src/Aeson2.hs|211 col 50 m| E: myobj ∷ ToJSON a ⇒ H.HashMap Text a → Value
/Users/andreas.thoelke/.vim/init.vim|1469 col 1 m| H: "

set stl+=%{expand('%:~:.')}

consolidate vim Tips "Tip" is redundant?!
align vim tips to after ":"

"vimscript utils
" Todo: Call function with testarg. Example line below of function:
" find next testarg line, "Wy[to some other register])"


send a key to switch desktop!

" Todo: jobsend example!

general: quickly share urls with Android, mac, other iphone


## CtrlP
### open
enter: current window
Ctrl+t: new tab
Ctrl+x: split current window horizontally
Ctrl+v: split current window vertically

*All Control maps:*
  `[` to close
  `r` to purge the cache
  `f` and `b` to cycle between modes.
  `d` to switch to filename search instead of full path.
  `t` or `v`, `x` to open the selected entry in a new tab or in a new split.
  TRY: y to create a new file and its parent directories.
  `z` to mark/unmark multiple files and `o` to open them.
  submit `?` in CtrlP for more mapping help
  http://ctrlpvim.github.io/ctrlp.vim/
  `<c-\>` paste from <cword>, visual sel, etc

when fuzzy typing to select a buffer in ctrlP, the filenate (not the folderpath) should be preferred


use `du` mapping?
changed/hunks?

rename with curent path shown
does 'Ren' do this?


how are check-lists rendered in markdown?
can I check those or is this implemented in the vim orgmode?


no line numbers in narrow windows?
use `yon`



reactivate goyo for notes taking?

also check out https://github.com/reedes/vim-pencil

make "O" mapping go up/just push a line below while cursor stays set

toggle line number with leader nn?

update plugin/see plugin changes file

--- TODO: FINISH THIS SUMMARY, MAPPING AND DOCS
closing *buffers* and or windows and/or tabs:
- "gx" only closes the buffer but leaves windows and tab in tact
-

-- PUT THIS UNDER MAPPING KEYS DOCU?
what are sort of 'leader keys' with cound preceed other keys in sequences?
- can't be  leading-sequence keys: b, n, .,
- potential leading-sequence keys: q, [, ],


## Karabiner

### Config path
  * `~/.config/karabiner/karabiner.json`

### Create a Karabiner complex modifications mapping
  1. Duplicate an object ({..}) in the `rules` array here: `~/.config/karabiner/karabiner.json`
  2. Open the `Karabiner-Elements Preferences` MacOS app, open the `Log` tab.
  3. Change and save the `rules` object. (Karabiner autoreloads this config file and shows error messages in the log window)

Note: When a `Complex Modificatioin` is `remove`d in the Karabiner-Elements Preferences UI, the
related object is **deleted** from the Karabiner.json file!

> Karabiner option/alt mapping example. (not in use any more)
> Note: - <c-;> and <c-+> are "unmappable" keys in vim! Therefore using:
`nnoremap … q:k`
> This map is using Karabiner mapping: "description": "Left Control + ; to Option + ; to open vim command history",

## Key Codes
  * Use the MacOS `Key Codes` app to view key codes and unicode id.


## Chromium
" Closing The Window: End the terminal session? Use "call jobstop(s:markdown_job_id)"


## Popup Tooltip UI
 * Hover over the following line and `localleader-gi`
   /Users/andreas.thoelke/Pictures/download.jpeg



### Small Minor optimizations

should search highlight and visual selection mode have different colors?

if cursor is in insert mode in first column, and I hit c-[, it moves forward → make exception for
first column?

" TODO "push text to right" mapping. prev. "L"

* vim text/strings (+haskell) should be highlighted (in green) by only including the string, but not the quotes "" into the highlight

Command history Issue: needs two c-c to exit? or `c-w c`


how to find a line that includes "abbrev" and "Hoogle" in termin1.vim?

* syntax highlighting in :Find search results should should somehow set the appropriate syntax (though there may be different files types)
* dim something out (grey) if it is in ()!

navigate .md /markdown files. e.g. next bulletpoint/not bullet point
 * there is the tagbar nav. c-n/p then p to jump file and P to show in preview window

document regex/wildcards in search. e.g. "/eins.*zwei"
how is this consistent with ctrlp filename search?

list of unsaved buffer (status indicator count?)
  => just c-p! note yellow buffers
     * save buffer from ctrlP buffer selector?
else it will prompt me. however will jump to other tabs

search - find within a range of lines /paragraph
search not just the buffer but predefined groups of files (vim config files, haskell examples code/notes)

vim-help syntax sometimes seems broken - need to run `set synatx=help`

make `rm -r` commands move to trash?
make a file remember it's last set syntax? via shada?
vim help in split window still open at the bottom

c-l/c-h should move to non commented lines

close buffer from ctrlP?
airline display swap buffers and tabs?
  * mapping tabs/buffers swapped? docs/comments

spin off a related exploration in a split
i can then leave open different views on a buffer/long file

save buffer without switching to it, save all buffers?
  obsolete with autosave?

* set up unicode mappings (purescript unicode in vimrc) for these lib functions:
  - https://www.schoolofhaskell.com/school/to-infinity-and-beyond/pick-of-the-week/guide-to-ghc-extensions/basic-syntax-extensions

`cursor line?`
  only beginning of line, only when inactive window?
  only highlighted line number?

gitgutter and ale toggles as `yog/a`?

have a quicklink/bookmarks drawer?

## Next:
test out Ctrlp undo, line, dir(!) mode!!
  can I finally navigate down in dir mode?

insert
  sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize
load/save tabed session
load a tab session on top of another session!
move that desktop screenshot and refer it here
see if folds in Reader have been saved
map tab move left/right
remap tabe to c-w>t
check intero/fold column width
check effect of window titles/bars

" TODO switch to foldcolumn = 1

if IsLeftMostWindow "c-." is making current win bigger, else make it smaller
IsTopMostWindow

Session open dialog at startup and close?

How are vim- and tmux sessions similar and could be linked?

create karabina commands for vim launch
can iTerm open normal windows at a position?

test
  let g:ctrlp_extensions = ['dir', 'undo', 'line', 'changes']
 
delete temp/undo folders? set a reminder?

check out popups/completions:
  * https://github.com/vim-scripts/AutoComplPop


* new chrome tab should enable vimium
* next tab navigation in google docs
    * vim/vimium navigarion in google docs?

" `gf` opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>
→ local haskell and PS maps

<c-l> should only jump to unindented lines (given there is }). (when does ]} work btw? folds?)

grepper maps to collect
local plugin window maps
function! s:side_buffer_settings() abort

Regex example:
`/(^cr|exe$)/gm`
  1. the global and multiline expression flags are on
  2. `^` defines that the `cr` string is only matched at a *beginning* of a line
  3. `$` is only matched if it's at the end of a line.
http://regexr.com/40v3p


JSON release image on desktop
  * json syntax and color using conceil and type colors
  * use this test file: `.vim/plugged/vim-json/json-test.json`
  * syntax file: `.vim/plugged/vim-json/syntax/json.vim`
  * highlight colors are difined at `JSON colors` (seach tag)

> neovim remote open in running nvim
also from ranger open-wi

f naviage with ";"?! not possibe

c-s c-l is fast, but should it switch windows? tabs?
c-s-w is awkward and should be consitent

c-s J/K/L/H is pretty intuitive!

> change dir of underlying terminal so I can <c-z> - fg in a vim related folder easily
      some start Documents/PS/2/pux-todo/node_modules/anymatch


## Github
set up the vim-hub plugin
oh-my-zsh github plugin:
* `empty_gh` - Creates a new empty repo (with a `README.md`) and pushes it to GitHub
* `new_gh` - Initializes an existing directory as a repo and pushes it to GitHub
* `exist_gh` - Takes an existing repo and pushes it to GitHub
* `git.io` - Shortens a URL using [git.io](https://git.io)


# next/prev through bufferlist where to show?
  * command bar - as it's temp anyway
  * in a horz split win at the top - to keep tabline visible
  * temp switch tabline to bufline
## Prob:
   bufferlist sequence is rated arbit (unmanagable?)
   you want groups/lists of files
   → could create separate buffer lists (attach to tab/win?)


# rename tab!
# not show bufferline buffer names!
  * still with many tab, where/what scrolls/collapses?
# rather show buffername in statusline (per window!)
  * don't show all these stats line num/ collapse?
  * .. or only when active?
show curr working dir in tmux-line!!?

add arglist indicator to statusline? → StatuslineArglistIndicator()
run interactive shell commands like `history!` in a hidden terminal
  example: function! OpenMarkdownPreview() abort

nerdtree only show one level/parent - mini - faster
* nicely: current file is highlighted/focused

create files with touch
remove files with rm

how about folders?
  relation to files/buffer/tabs?
  create/remove
  ctrlP navigate

# Zsh Shell Vim Mode
  * to learn
  * use c-[ to get out of insert mode
  *  .. only then do `c-p` to get to scrollback history


# make TermCursor visible:
* highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
→ resume video
→ get to pasting text in place, jump back to instert start

scroll text window to max left - "(" only jumps to first char

ctrlP typing in buffers selector refers to files name with preference
  .. not to some char in the long folderpath!

what are buffertags?
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir']


quit vim map: <localleader>qa

saving from ctrlP, or google "save all unsaved buffer .. (dangerous!)


airline config to show buffername
**


**

how are changes recorded in vim?

where does the startup indent come from?
what does tab spin-off scroll?

diff with all entry changes in init.vim?

load list/lines into loclist preview window?

ctrlp c-v should also allow opening it again - not just reveal

---
https://medium.com/@olegsmetanin/vim-recipes-ac65f75f26bf
---

" Deoplete: code completion tool
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Use TAB for code completion
Plug 'ervandew/supertab'
" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1
" Select from completion list with SHIFT-j/k
inoremap <expr> <C-j> ("\<C-n>")
inoremap <expr> <C-k> ("\<C-p>")

" Go to definition in new split
nnoremap <silent>fd <C-w>v<C-w>w :call feedkeys("gd")<CR>

" CtrlP file, buffer, tag search
let g:ctrlp_extensions = ['mixed', 'changes', 'quickfix']
let g:ctrlp_cmd = 'call CallCtrlP()'
" Search tags with Ctrl-i
noremap <c-i> :CtrlPTag<CR>
func! CallCtrlP()
    if exists('s:called_ctrlp')
        CtrlPLastMode
    else
        let s:called_ctrlp = 1
        CtrlPMixed
    endif
endfunc

---------------

test gregsexton/gitv

new register /copy paste plugin

learn about conceal feature
  usecaes:
  * haskell lambda, Integer/String symbols (example plugin)
  * hide quotes?

match(it) "" in markdown syntax to highlight strings

use augroup to allow safely reloading my vimrc. can use the `au!` patterns to first remove commands
in of that group

### File/ folder bookmarks
  Consider use-cases
  How to implement?
  Nerdtree recover the bookmarks

config save a grep search through all info sources for:
(have a `args \`cat file\``) /file lists for these searches:
  * vim notes
  * vim code
  * haskell code examples
  * etc ..

## Cleanup patched plugings
* fork the original repo, pull it locally
* run a diff with the version that i'm currently using
* integrate what I have changed
* push change to forked github repo
* github will show changes from original repo, so I can merge them from time to time!!


# Current Todos

  search should not add to jumplist - only the beginning
    many other motions should add to the jumplist

  nyaovim fontsize, popup test, minibrowser
  vifm: show last changed in hours vs size!
  Grepper: Test running in Haskell hello44 vs Homedir
           How to quickly change dir the underlying shell?
           How to get the current folder path into an ex-command?

  Minimal Tab/status line plugin (to test)
  Buffer manager plugin

  The `Term` command allows running `history` and `node` repl
  * set up callbacks
  * chunk returned text events into visible list. - allows to refer to/ insert specific protions via register/ paste?
  * consider using https://github.com/kassio/neoterm

  Select till end of the paragraph/sentence with vim-target

  deal with directories in ctrlp
    also create files in ctrlp

  show g:auto_save in status bar

  cd in the underlying shell:
    * can now in Divish buffer copy the current path to clipboard and cd in shell: `let @*=@%`, `c-z`, `c-[` for normal mode, `P<cr>`
    * there should be a Tmux based solution

something activates gitgutter when quickfix list is used

make local arglist global?
  -------------------

highlight vim comment header `" Examples: --` in markbar/purescript syntax

- use ctrlp tags?
  (this is based on set the generated ctags = 'tags' here: tags=tags;/,codex.tags;/
  (and it very/too big and slow)
  maybe ctrlp-tags could use the lurshtags?

turn a selection into a (drawer) split
using mark previews drawer
using search previews
notes drawer?
isn't the quickfix list a drawer? - just a small preview/ not syntax highlight
can other 'lists' (of pins, marks) be used like the arglist?

if i have yanked a line (with line bread at the end) how do i past it at the mid of a line, without linebreaking

a start screen?
https://github.com/mhinz/vim-startify


consider using ctrlp to create files/folders? see ctrlp help
        f)  Type the name of a non-existent file and press <c-y> to create it. Mark a
            file with <c-z> to create the new file in the same directory as the marked
            file.

            E.g. Using 'newdir/newfile.txt' will create a directory named 'newdir' as
                 well as a file named 'newfile.txt'.

## Easy-clip
  * delete does not change clipboard
  * `S` substitute motion
  * yank stack use with <leader>"<regnum>
  * persisted and shared with vim instances

## Temp next
cut/ move map
doc targets, substitute
delete undo for vimrc. why is this so long?
the changelist enables `g;` but it does not seem to be persisted/show up after vim restart

## Commit/ Release notes

* vim-better-whitespace plugin
* easyclip:
  * delete does not change clipboard
  * `S` substitute motion
  * yank stack use with <leader>"<regnum>
  * persisted and shared with vim instances
* close all Markbar wins on VimLeave [cleanup](../../.vimrc#Cleanup:)
* include file-local marks
* refresh shada to avoid deleted global marks re-apear after vim-restart
* ctrlP MRU map to `gp`
* dont jump to markbar win on open
* use `mo` and `to` to toggle markbar & tagbar
* use `c-w \ ` to jump to rightmost/mark/tag bar window and `c-w p` to jump back
* defining links in code with `h rel-links` like ~/.vimrc#/Rel%20Links: using `gk`

old: .vim/notes/commit-nts1.txt








