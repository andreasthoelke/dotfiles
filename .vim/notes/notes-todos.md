## Housekeeping, Cache Files, Cleanup

 some
 line
 * in here
 * and more

> test
> this

### Shada
  * `ShadaClear` does: "!rm" . ' ~/.local/share/nvim/shada/main.shada'
    but I think I have to do this when vim is off

  * Marks save format:
  ``` 
  Global mark with timestamp 2018-12-21T18:29:55:
      % Key  Description  Value
      + n    name         'A'
      + f    file name    "/Users/andreas.thoelke/.vim/notes/notes29-09.md"
      + l    line number  730
      + c    column       0
  ```

  * also contains jumps, changes, history, ..
  * does this replace all/most of what is stored in .viminfo file?

``` javascript
function updateMenu(browserWindow, loadInit) {
    const menu = menu_1.buildMenu(browserWindow, loadInit);
    if (process.platform === "darwin") {
        electron_1.Menu.setApplicationMenu(menu);
        const dockMenu = menu_1.buildDockMenu(browserWindow, loadInit);
        electron_1.app.dock.setMenu(dockMenu);
    }
    else {
        browserWindow.setMenu(menu);
    }
}
```


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
     * actually do this while vim is closed!
     * delete the 'bak-..' folders
     * rename `view` and `undo` to 'bak-..'
     * create new view and undo folders
  * there is a `ClearUndo` command now - but the counter seems not resetted
    * now set undolevels to 300 for faster mundo loading?

### Todos
  * automate this? with VimLeave? [cleanup](../../.vimrc#Cleanup:)

## Styles

font: Iosevka - for writing

  * Commented segments in code, like: https://github.com/sdothum/dotfiles/blob/master/vim/.vim/config/buffer.vim
  * Should be lined to Tags and Folds
  * related: fill line with dashes with repeat

* vim text/strings (+haskell) should be highlighted (in green) by only including the string, but not the quotes "" into the highlight

## Textobjects


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


## Email
https://neomutt.org/distro/homebrew
https://github.com/danchoi/vmail
http://nosubstance.me/post/mutt-secret-sauce/



## Documentation Readme
  * use standardized comments/section formatting
      * that allows
        * automatic folding
  * document processes with https://asciinema.org/ (list command strokes, include comments, include
      a clickable table of contents)


## FZF
  `Files ~/.vim`
  `GFiles ~` all git files: (git ls-files)
  `:BLines` is super useful alternative to search/navigate `/something` as it's not cluttering the jumplist!
  `vim $(fzf -m)` opening multiple buffers using multiselect (TAB/S-TAB) and process substitution
    * TODO set this up for arglist, and lines of full paths
  nvim $(fzf --height 40%)


## Undofile Shada

  `:verbose e .config/alacritty/alacritty.yml" 491L, 18989C`
    Reading ShaDa file "/Users/andreas.thoelke/.local/share/nvim/shada/main.shada" marks
    Reading undo file: /Users/andreas.thoelke/vimtmp/undo/%Users%andreas.thoelke%.config%alacritty%alacritty.yml

  TODO: Does vim resume undohistory after git-checkout?
        git check in ShaDa and undo files


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

## Drawer
  turn a selection into a (drawer) split
  using mark previews drawer
  using search previews
  notes drawer?
  isn't the quickfix list a drawer? - just a small preview/ not syntax highlight
  can other 'lists' (of pins, marks) be used like the arglist?
  * just one more

## Processing Lines & Columns
  * Sort: [range]sort u %sort u
  * Sustitute: [range]s/,/;/g
  * Make nice-looking ascii table: `[range]CSVTable<cr>` using `csv.vim` plugin
  * How can I address/select a column in table data using s/..
  * How to set up conditions for that value, to add/change something in that line

## NOTES .MD EDITOR

Current state (29-12-2018):

  * run `glm` or `:Markdown` to
    * launch a grip-server and
    * open load the preview page in chromium
    * use vimium to navigate in chromium
    * Sync markdown on leave insert
      * this now works via autosave and it's fast (like 700ms)
      * could try to autosave while typing in insert mode
    * position window
      * now the previous position is reused. which is useful
    * close a window with Vimium `x`
    * **todos**:
      * scale canvas
      * jump to a headline from vim
      * update scroll loc from vim?
      * autosave markdown on TextChanged
      * nicer style


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

run vim-tutor of https://github.com/reedes/vim-pencil
or run vimtutor of vim-pad?

  Pandoc
  links in haskell docs lhs? pandoc
  support: literate haskell, SoH Markdown
  not hide/conceile image tags in markdown
  can I just use html image tags in markdown?


## Some command line ideas

  * use [notes <the note text> <or empty to view ~/notes.md file>](../../.zshrc#Note Taking:)
  * do `notes some text <<ID` .. lines .. ID
  * can also log any standard in. example: `fzf | notes`

  * A *Scratchpad* alias
  `alias sp='vim ~/notes/scratchpad-$(date +"%m-%d-%Y-%T")'`

  * The cron points to a shell script:
  > #!/bin/sh
  cd ~/notes
  git add -A .
  git commit -am wip
  git pull
  git push

  * Very simple:
    * `cat >> ~/notes` will save on new line
    * `rlwarp cat >> ~/notes` allows proper `c-h` and `c-c`


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

### Literate Markdown
tried out but not yet loading into Intero
/Users/andreas.thoelke/Documents/Haskell/6/HsTrainingTypeClasses1/src/LiterateHsMarkdown.md
https://gitlab.haskell.org/ghc/ghc/wikis/literate-markdown

### Markdown rendered in browser
* works with `:Markdown` cmd via Chromium
Highlighting/pointing
* Viumum `vc` ⇒ carret mode, `jk, gg` 
* then `V` to highlight line, then `c` for carret, etc

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

## CtrlP

* open
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

- use ctrlp tags?
  (this is based on set the generated ctags = 'tags' here: tags=tags;/,codex.tags;/
  (and it very/too big and slow)
  maybe ctrlp-tags could use the lurshtags?


TODO some tricks from FZF:
  `GFiles ~` all git files: (git ls-files)
  `:BLines` is super useful alternative to search/navigate `/something` as it's not cluttering the jumplist!


## Key Maps - Mappings
### Free mappings
  > `)` is a free mapping!
  > `L` is also a free mapping!

### Karabiner

Config path
  * `~/.config/karabiner/karabiner.json`

  Create a Karabiner complex modifications mapping
  1. Duplicate an object ({..}) in the `rules` array here: `~/.config/karabiner/karabiner.json`
  2. Open the `Karabiner-Elements Preferences` MacOS app, open the `Log` tab.
  3. Change and save the `rules` object. (Karabiner autoreloads this config file and shows error messages in the log window)

  Note: When a `Complex Modificatioin` is `remove`d in the Karabiner-Elements Preferences UI, the
  related object is **deleted** from the Karabiner.json file!

#### Route vim-unmappable keys through a karabiner option alt keymap
Problem: Some keys can not be mapped in vim, e.g. `c-s` control+shift, also `Tab` simply tiggers `c-i` while I'd like to
map both keys differently.
Solution:
  * Make a Karabiner map of to unmappable key to some (arbitry) option key:
    This Karabiner object maps the `Tab` key to `option-q`:
  {
                      "description": "Tab to <option-g>",
                      "manipulators": [
                        {
                          "conditions": [
                            {
                              "bundle_identifiers": [
                                "^io\\.alacritty$"
                              ],
                              "type": "frontmost_application_if"
                            }
                          ],
                          "from": {
                            "key_code": "tab",
                            "modifiers": {
                            }
                          },
                          "to": [
                            {
                              "key_code": "g",
                              "modifiers": [
                                "left_option"
                              ]
                            }
                          ],
                          "type": "basic"
                        }
                      ]
                    }
  * Note that only some alt/option keys work with just one keystroke! To find out go into insert mode, hold down the
  option key and type various characters and see the special symbols inserted after one or two keypresses.
  * For example typing `option-g` produces `©`. Thus with the karabiner setting above typing `Tab` will send this char: `©`
  * The special char can now be used in Vim-Maps:
nnoremap œ :echo col('.')<cr>
nnoremap Œ :echo line('.')<cr>
→ type `tab` and see the current cursor column echoed in vim.
  * Note that you need to consider Shift-Tab usage separately: It needs a separate Karabiner map! you need to find an
  Option + Shift + Key that prints with one keypress (option+shift+g does not work in one press!) and you need to use
  that other special char for the vim map

#### Limit a map to specific app
Source this line to get the `bundle id` of a MacOs app:
!osascript -e 'id of app "Finder"'
!osascript -e 'id of app "Alacritty"'

The conditions array resides in the root object/ the same level as the "from" and "to" objects
            "conditions": [
                            { "bundle_identifiers": [
                                "^io\\.alacritty$"
                              ],
                              "type": "frontmost_application_if"
                            }
                          ],


#### Karabiner option/alt mapping example. (not in use any more)
Note: - <c-;> and <c-+> are "unmappable" keys in vim! Therefore using:
  `nnoremap … q:k`
nnoremap … :echo 'ab'<cr>
This map is using Karabiner mapping: "description": "Left Control + ; to Option + ; to open vim command history",

  Key Codes
  * Use the MacOS `Key Codes` app to view key codes and unicode id.


## Chromium
  can start Chromium macos app and
   * install extensions
   * go to settings
   * Closing The Window: End the terminal session?
     * Use "call jobstop(s:markdown_job_id)"
   * Use `<leader>gx` to open URL: http://purescript.org https://github.com
     * TODO, this opens terminal tab. 
       * → allows to close tab/chromium from vim
       * → automatically sessionrecreates the browserwins!!
   * `gx` works for Chrome. not sure where this is configured though

Status:
  this throws channelID errors and sometimes vimium does not launch
    nnoremap <leader>gx :call LaunchChromium('<c-r><c-p>')<cr>

let g:js = '(function() { var nodes = document.querySelectorAll("h2"); var titles = []; for (var i = 0; i < 5; i++) { titles.push(nodes[i].innerHTML) } return titles.join(" "); })();

let g:js = '(function() { var nodes = document.querySelectorAll("h2"); var titles = []; for (var i = 0; i < 5; i++) { titles.push(nodes[i].textContent) } return titles.join(","); })();'

let g:js = 'console.log( abc1 )'
let g:js = 'console.log("hi")'

let g:js = 'abc1 = "test"'

chrome-cli execute '(function() { var nodes = document.querySelectorAll("h2"); var titles = []; for (var i = 0; i < 5; i++) { titles.push(nodes[i].innerHTML) } return titles.join("
"); })();'

echo system('chrome-cli execute ' . shellescape(g:js))

call system('chrome-cli open http://github.com')

!chrome-cli open http://github.com
echo system('chrome-cli execute ' . shellescape(@a))


(function() {
  return document.readyState === 'complete';
})();

call timer_start(1000, function("Backer", ["one"]))

{{{
call timer_start(1000, 'TestHandler', {'repeat': 3})
let g:cnt = 0
func! TestHandler( timer )
  let g:cnt = g:cnt + 1
  if g:cnt > 1
    call timer_stop( a:timer )
    echo 'done'
  endif
  echo ('yes ' . g:cnt)
endfunc
}}}



testi

silent !chrome-cli activate -t 1192
silent !chrome-cli activate -t 1182

func! Backer(foo, ...)
  echo 'back: ' ++ a:foo
endfunc

could to google search with quickfix list

window.location = 'http://purescript.org';
window.location = 'http://github.com';
window.open('https://www.codexworld.com', '_blank');

Overview Installation JavaScript execution Usage Examples

Overview,Installation,JavaScript execution,Usage,Examples

chrome-cli
  Overview
  Installation
      Homebrew
      Manual
        Downloads
  JavaScript execution
  Usage
  Examples 

func! InsertHeadingTexts()
  let g:headingsStartLine = line('.')
  let g:headingTextAsLines = system('chrome-cli execute ' . shellescape( @a ))
  call append( line('.') - 1, '' )
  call append( line('.') - 2, split( g:headingTextAsLines, ',') )
  exec 'normal!' ++ g:headingsStartLine ++ 'G'
endfunc
call InsertHeadingTexts()

Here, we get a list of <p> elements whose immediate parent element is a div with the class "highlighted" and which are located inside a container whose ID is "test".

var container = document.querySelector("#test");
var matches = container.querySelectorAll("div.highlighted > p");

(function() {
  var content = document.querySelector('article');
  var headingElems = content.querySelectorAll('h1, h2, h3, h4, h5');
  var headingTexts = Array.from( headingElems ).map( el => {
                                                       const indent = ' '.repeat( 2 * (el.tagName[1] - 1) );
                                                       return indent + el.textContent;
                                                     }).join(',');
  return headingTexts;
})();



return 

## NVim GUI Clients: NyaoVim, vimR, nvim-qt, VeoNim

### NyaoVim
  * start with `gln` or :NyaoVim ''

  Config
    * NyaoRC. html ~/.config/nyaovim/nyaovimrc.html
    * Markdown preview config ~/.vimrc#/NyaoVim%20Markdown:


  Markdown
    * `leader mp`
    - TODO call markdown_preview#scroll('down')

  Mini Browser
    * `leader bo/bc` to open/close browser
    * Use `leader gx` on Url http://purescript.org https://github.com http://docs.google.com
    https://chrome.google.com/webstore/category/extensions
    https://docs.google.com/document/d/12NNunuYleBu5d-scEkxIJMZbOIn6fVsvszbCwAxJ0CI/
    * back and forward buttons work

  Popup
    * `gi`
    * Test: ~/Documents/logo.png


> Open DevTools
call nyaovim#open_devtools('undocked')

> Use NyaoVim Methods via RpcNotify
call rpcnotify( 0, 'markdown-preview:scrollToLine', 223 )

call rpcnotify( 0, 'markdown-preview:scroll', 'down' )
call rpcnotify( 0, 'markdown-preview:scroll', 'up' )

call rpcnotify( 0, 'mini-browser:demo1', 'some text' )
call rpcnotify( 0, 'sometest2' )

call rpcnotify( 0, 'dev-tools:open' )
call rpcnotify( 0, 'mini-browser:devtoolsopen' )
call rpcnotify( 0, 'dev-tools:close' )

call rpcnotify( 0, 'mini-browser:scrollTo', 0, 150)
call rpcnotify( 0, 'mini-browser:scrollTo', 0, 0)

nnoremap Y :call rpcnotify( 0, 'mini-browser:scrollBy', 0, -50)<cr>
nnoremap E :call rpcnotify( 0, 'mini-browser:scrollBy', 0, 50)<cr>

> Run JavaScript
call nyaovim#execute_javascript('console.log("hi nyao")')
call nyaovim#execute_javascript('console.log(document)')

> Get DOM element does not work
call nyaovim#execute_javascript('(function(){ var win1 = require("electron").remote.getCurrentWindow(); console.log("hiii: " + win1); })()')


call nyaovim#execute_javascript('(function(){ var win1 = require("electron").remote.getCurrentWindow(); console.log( win1.document.getElementById("mini-browser-view")); })()')

> Require Electorn API, close DevTools
call nyaovim#execute_javascript('(function(){ var win1 = require("electron").remote.getCurrentWindow(); win1.closeDevTools()})()')

> Call JS function TODO test
call nyaovim#call_javascript_function('fnname', 'arg')
> Browser window - but no fullscreen available
call nyaovim#browser_window('setFullScreen', [v:true])

> Fire a Vim Command from a JS Plugin
click: () => {
  if ((win.webContents as any).isFocused()) {
    // send the command to the nyaovim-app
    win.webContents.send('nyaovim:exec-commands', ['undo']);
  } else {
    // execute the default command
    webContents.getFocusedWebContents().undo();
}

#### Summary 12-2018:
  + fonts align perfectly with alacritty
  - scrolling is a bit jumpy/slow
  - have to use with nvim 0.3.1 - otherwise I get a lot of unhandled 'flush' events


#### Summary 1-2019:
  * Markdown scrolling/autoscrolling works. But the current line is scrolled to the top of the markdown preview. it should instead be centered and highlighted
  * Problem is that Nyaovim lags a bit and the fonts are not as nice as in Alacritty

#### old notes
    > just <leader>ss this line - but this blocks nvim while nyaovim is running
    !npm run app --prefix Documents/NyaoVim
    !npm run app --prefix Documents/NyaoVim -- /Users/andreas.thoelke/.vim/notes/color-scheme-doc.md
    > rather use
    command! OpenInNyanVim exec ':Dispatch' 'npm run app --prefix Documents/NyaoVim --' expand('%:p')
    > this allows to go back and work in nvim and then kill nyaovim by killing the terminal buffer

### Oni
  + the scrollbars I always wanted. Small, proportional in view range, transparent
  + soft scrolling and tab transitions
  + it shows bubble help!
  + markdown preview scrolls in sync!
  + browser works via this command
    - window resize needs another keystroke

oni.commands.executeCommand("browser.openUrl.verticalSplit", "https://github.com/onivim/oni")
call OniCommand('browser.openUrl.verticalSplit', 'http://purescript.org')


### nvim-qt

#### Summary 12-2018:
  + fast - it's C++
  + seems like a terminal/ has all features
  - pale colors

#### Install/ Launch
* install nvim-qt via (outdated?) homebrew tab
  (not sure what that is, but there is an issue in the nvim-qt repo)
  commands to install:
    brew tap gwerbin/tap
    brew install --HEAD gwerbin/tap/neovim-qt
* to start
    cd /usr/local/Cellar/neovim-qt
    nvim-qt
    or actually now moved this into /Applications, so Alfred nvim-qt works

Config: (just <leader>ss these lines)
GuiTabline 0
Guifont SauceCodePro Nerd Font:h11
GuiPopupmenu 1
GuiPopupmenu 0

### VeoNim

[conf](../../.vimrc#%20VeoNim:)

#### Summary 12-2018:
  - setting the font-size was still hacky
  + colors are nice - see comparison with alacritty in screenshot
  - weired resizing of wins when switching tabs
  + autocomplete popup just worked!
  + statusbar made sense, including the small tab display on the right. though not yet scaled with font
  + fast. scrolling, tabswitch, etc
  - some ex-commands like `:ls` don't show - no expanded area below.
    + .. though the display bubble in the center has potential - it's ergonomically better positioned

#### Install/ Launch


## Github
set up the vim-hub plugin
oh-my-zsh github plugin:
* `empty_gh` - Creates a new empty repo (with a `README.md`) and pushes it to GitHub
* `new_gh` - Initializes an existing directory as a repo and pushes it to GitHub
* `exist_gh` - Takes an existing repo and pushes it to GitHub
* `git.io` - Shortens a URL using [git.io](https://git.io)

run interactive shell commands like `history!` in a hidden terminal
example: function! OpenMarkdownPreview() abort

ctrlP typing in buffers selector refers to files name with preference
.. not to some char in the long folderpath!

what are buffertags?
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir']

## Completion
  see nav-containers.md#/Completion

## Unicode symbols
* List of haskell unicode library symbols (use those!)
  - https://www.schoolofhaskell.com/school/to-infinity-and-beyond/pick-of-the-week/guide-to-ghc-extensions/basic-syntax-extensions
* this has some nice unicode conceal suggestions  ~/.vim/plugged/vim-haskellConcealPlus/after/syntax/haskell.vim


## Low priority

a start screen?
https://github.com/mhinz/vim-startify

mudo - autosave sometimes get confused

send meeting invites quickly
  Slack/ FBMessenger integration?
  asana integration?
  send to time manager! (have regular interval events?)
show e.g. a bookmark timebuddy, google search?

code block to Gist: https://github.com/mattn/gist-vim

show browser win at location -

goyo for notes taking?


review:  EXTRACT SIGNATURES:

learn about conceal feature
usecaes:
  * haskell lambda, Integer/String symbols (example plugin)
  * hide quotes?

 related?
 Specific Neovim features: nvim_buf_add_highlight nvim_buf_set_virtual_text

Toggle map for: set foldcolumn=1 set foldcolumn=0 to show markdown foldlevels

move section? `Utility And Example Commands:`
go to the end of pasted text - similar to end of insert - via jumplist - easyclip has a related map
consolidate vim Tips "Tip" is redundant?!
align vim tips to after ":"

Vim Additional Documentation: https://github.com/mhinz/vim-galore

## Todos

general: quickly share urls with Android, mac, other iphone

how are check-lists rendered in markdown?
can I check those or is this implemented in the vim orgmode?


  match(it) "" in markdown syntax to highlight strings


Image quick view feature
below was only for nyaovim
  Popup Tooltip UI
   * Hover over the following line and `localleader-gi`
   /Users/andreas.thoelke/Pictures/download.jpeg

* Cleanup patched plugings
  * fork the original repo, pull it locally
  * run a diff with the version that i'm currently using
  * integrate what I have changed
  * push change to forked github repo
  * github will show changes from original repo, so I can merge them from time to time!!

c-l/c-h should move to non commented lines
<c-l> should only jump to unindented lines (given there is }). (when does ]} work btw? folds?)

should search highlight and visual selection mode have different colors?

* syntax highlighting in :Find search results should somehow set the appropriate syntax (though there may be different files types)
* dim something out (grey) if it is in ()!

navigate .md /markdown files. e.g. next bulletpoint/not bullet point
 * there is the tagbar nav. c-n/p then p to jump file and P to show in preview window


make `rm -r` commands move to trash?

  gitgutter and ale toggles as `yog/a`?

  test out Ctrlp undo, line, dir(!) mode!!
  can I finally navigate down in dir mode?

  load/save tabed session
  load a tab session on top of another session!

  move that desktop screenshot and refer it here

  check intero/fold column width

* new chrome tab should enable vimium
* next tab navigation in google docs
    * vim/vimium navigarion in google docs?

    * `gf` opens file under cursor in a new vertical split
    nnoremap gf :vertical wincmd f<CR>
    → local haskell and PS maps

    grepper maps to collect interesing results via marks (→ markbar usecase?)
    local plugin window maps
    function! s:side_buffer_settings() abort

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
                                                  j
  > change dir of underlying terminal so I can <c-z> - fg in a vim related folder easily
  some start Documents/PS/2/pux-todo/node_modules/anymatch

  * markbar currently only shows the filename. filename - projectfoldername would be useful 
      to destinguish across projects

  AsyncRun plugin may be useful: AsyncRun git push origin master

  i could use a vimscript function text object, it would allow to 'source around function' with blank lines

  vim-subversive allows to rename a variable within a function or what is currently visible of the buffer

## Current Todos

after restart I need several undos until the latest change is undone

going back the changelist via `g;` seems to have these issues (sometimes):
  - sometimes get alert that there are no changes
  - at some point the cursor alternates/gets stuck between two posisions

issue: (fixed!)
  when buffer (e.g. vimrc) is open in another win, then the first win
  is scrolled to the top when reloaded in another window

markbar could hold vimCommentTitles
markbar should autoexpand any accidential folds (because there is marker text in the example text)

Problem: Currently I may not strip whitespace in .vimrc!
         set fillchars sets a space

Feature: create vim-rel link for word under the cursor!
  * could be conceiled?
  * plus map

document chrome-cli.vim usage
  find some useful applications, make extendable

put notes in separate files?
https://github.com/rhysd/vim-notes-cli
https://github.com/rhysd/notes-cli

* scroll indicator https://www.reddit.com/r/vim/comments/6xkjz9/presenting_vimlinenoindicator_see_your_position/

indicate that intero is running

try hasell language server client

don't need a tabline close button on the top right

show num of errors
jump to first error

* Update Readme
  * vim setup focused on
    - Haskell, Purescript development
    - Markdown, Note writing
  * point to nav-container.md?
  * point to release notes? or extract into readme?
  * screenhot
  * some featues

* email https://neomutt.org/distro/homebrew

next/prev through bufferlist where to show?

  * command bar - as it's temp anyway
  * in a horz split win at the top - to keep tabline visible
  * temp switch tabline to bufline

Prob:
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

* add arglist indicator to statusline? → StatuslineArglistIndicator()

* easyclip smaller plugins

  Grepper: Test running in Haskell hello44 vs Homedir
           How to quickly change dir the underlying shell?
           How to get the current folder path into an ex-command?

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


migrate docs from termin1.vim and vimrc

consider using ctrlp to create files/folders? see ctrlp help
        f)  Type the name of a non-existent file and press <c-y> to create it. Mark a
            file with <c-z> to create the new file in the same directory as the marked
            file.

            E.g. Using 'newdir/newfile.txt' will create a directory named 'newdir' as
                 well as a file named 'newfile.txt'.

* DONE - this should not jump the view. jumplist c-o/i should center view

Insert mode is currently hardly noticable - also the cursor in insert mode

push text to the right currently requires two undos

`ga` selects word, maybe gA for selecting big Word?

"m is undefined" error when opening markbar for the first time
  this just did not happen

typing in insert mode sometimes gets jumpy - gone after restart

when uncommenting a line, that lines becomes the most recent visual selection

when reloading with `:e` it seems there is an undo point is set

when `ga` highlight only appears after first `n`

`0` or `^` should go the begin of the text, not start of comment string

## Haskell Todos

Cabal config
/Users/andreas.thoelke/.cabal/config

there is `stack haddock --open lens` to open the local docs of the lib
  https://lexi-lambda.github.io/blog/2018/02/10/an-opinionated-guide-to-haskell-in-2018/
stack test --fast --haddock-deps --file-watch
stack hoogle -- generate --local
stack hoogle -- server --local --port=8080
This actually works and shows my local docs alongside the docs of dependencies:
  http://localhost:8080/?hoogle=maptomaybe
  shows function from TypeClasses/Functortown.hs

HIE config:
  ~/.vim/HIE/settings.json

 haskell-ide-engine
  stack --stack-yaml=stack.yaml exec hoogle generate


auto select rendering/alignment based on type (e.g. [Sting]) 
* is there a haskell tracing lib that tabularizes all [data-type] collections?

consider useful alignments →
  vmap <leader>ta :Tabu /∷\\|→\\|⇒/<cr>

also review: " EXTRACT SIGNATURES:

syntax highlighting in comments
  literal haskell files?
where to put haskell notes?
  save in a learning repo?
  search through this?
  → can now define bookmarked searches through groups of files

test quickfix autoexpand on errors:
  function! QuickfixRefeshStyle()

test effects of vim2hs


* Literate Markdown
    tried out but not yet loading into Intero
    /Users/andreas.thoelke/Documents/Haskell/6/HsTrainingTypeClasses1/src/LiterateHsMarkdown.md
    https://gitlab.haskell.org/ghc/ghc/wikis/literate-markdown

run the current line through typeOf cmd-line prog.
  -- execute ".!typeOf %"
  problem: cabal install does not produce a global executable

change DocsForCursorWord() to hoogle.hackage.org not hackage/hoogle

autodetect HsList or Record and render as lists in a flowting window
use flowting window for PasteListAsLines

* Kinds: how do I get the Kind of a type in Intero? `:kind Maybe` .. not with InteroInfo ..?
* Syntax highlight in InteroRepl?

* Ghci config: configure typical language extensions and disable some warnings via g:intero_ghci_options


* Make repl :typeAt work with a vis-selection
    use this approach?
    vnoremap get :call InsertEvalExpr( ':type ' . Get_visual_selection(), "PasteTypeSig" )<cr>
    to run this?
    :type-at Functortown 87 1 87 4 bo0

* After "Intero open" and then closing the intro split below, the lines are currupted, specifically after inserting
(e.g. via 'get'/\tw). currently opening intero in a separate window

* Test this: command! Run    :call HaskellStackRun()
* related: ghcid

HOOGLE INCLUDE NEW LIBS:
  "hoogle generate base lense" will download and install only the base and
  lense libs.
  open ":e hoogle-defaults" from the root of the project folder, add/delete
  libs, then <backspace> in first line to have everything in one row, and
  copy-paste into terminal
  https://github.com/ndmitchell/hoogle/blob/master/docs/Install.md
  Todo: get hoogle libs from cabal file


## Temp next


Gui=italic now works! use this in syntax highlight?
hi! Underlined2 guifg=#077D67 guibg=#0C0C0C gui=italic

Consistent focus maps
`o` in seach just opens/focuses that line in the other window to the right - it does not close the grep seach window.
however:
 * tagbar has a different map: `p`
 * quickfix error also have a different map
 * markbar?

A string at the beginning of a line in a .hs file is highlighted/concealed as a vim comment

* Hasktags
    open these two files:
      /Users/andreas.thoelke/Documents/Haskell/6/hasktags/src/Hasktags.hs
      /Users/andreas.thoelke/Documents/Haskell/6/hasktags/tags
    run this with get: runFindWithCache

Review Haskell type insert maps `,tw`
  " Type Inserts

douplicating line with \t. then edit and j/go down jumps to the beginning of the line - should stay in the same row

make HsNextSignature motions vis-selection compliant
then use this for the haskell function text object
this could then be used for unicode replace - and rename of vars

operator pending map/motion for vimscript func

easyclip setting causes redundant undo step at insert leave
show quickfix process (1 of 4) in statusbar of inactive quickfix list.
  currently c-g does output the state in the command line

after duplicating a line and then commenting the orig line and moving down with 'j'
  it jumps to the beginning of the line while it should stay in the same column

`dip` dap does not work -> easyclip? d- map


"done" rename these (most important past) haskell repos:
       /Users/andreas.thoelke/Documents/Haskell/4/hello44/**
       /Users/andreas.thoelke/Documents/Haskell/4/abc4/test1/**
     /Users/andreas.thoelke/Documents/Haskell/6/HsTraining1/**
     /Users/andreas.thoelke/Documents/Haskell/6/HsTrainingBook2/**

* trailing whitespace is highlighted in insert mode just left of the cursor. not after restart, but something triggers this

" Todo: start Alacritty with options
" command! Alacritty exec "silent !open -n '/Users/andreas.thoelke/Documents/temp/alacritty/target/release/osx/Alacritty.app/ --option \"window.decoration\" \"none\"'"


## Release notes v1.1.2
* Intero ShowList_asLines() in floating window with column alignment (`gec`, `geC`, `gel`)
* Shortcuts to popular folders <leader>o .. `n` notes, `u` utils, `h` haskell, `c` current

* Indent motions: `,j` `,k` to move to end/start of indent block. IndentBlockEnd() HsMotions
*                 `,J` `,K` to move to the next/prev same level indent
*                `vii` to visually select inside indent block
* Align maps:
    `leader al` + [motion, textobject: e.g. `ii` "inside indent block"]
              + speperatorId (<space>, 2<space>, "," )
* Tabularize 1st and 2nd column of a motion or selected range of lines based on <space>
    `leader at` + [range]

* Repl format: `gew` does just append all repl returned lines
* `gel` "eval list" on a Haskell identifier will insert a resulting list as lines. see PasteListAsLines()
* `get` "eval table": After "eval list", it then aligns the first two columns (column separator is <space>)
* `geT` "tabularizes" the output
* `gek` to inset the `Kind` (visual-sel and word at cursor)
* `\tw` or `\tt` to get the type of the identifier
* `leader hs` creates a haskell top level function stub with a random and indexed name (used for quick tests)
* Use feedkeys to activate modes: e.g. call feedkeys("\<c-v>", 'x') see VisualBlockMode()
* `]b`, `[b` for next/prev binding
* `cib` to change the binding name in consequtive lines
* `<leader>rb` to rename a binding and its occurences
* `iB` "inside buffer" textobject
* `iv` "inside viewable" area in window textobj
* `leader hsi` "Haskell stype imports"
* `<c-x>f` in a file path, in insert mode browses files (vim native!)
* createHeading `\ch`, closeSection `\cs`, delete/strip Heading `\cd`, refreshHeading `\cr`

## Release notes v1.1.1 (2019-04-20)
* Command to search in deleted code: `Fdeleted someString`
* Search in groups of files: `Frepo Fbuffers Fvim Flug Fhask Fnotes Fdeleted`
* restucture vimrc into separate files
* easymotion for paragraph: `<localleader><c-h/l>`
* `,L` `,H` to jump bottom/top of visible area
* `Viv` selects the visual area, `yis` copies the visual area. See Textobjects
* so a regex search then `\r`+`ie``iv``if` to replace matches with prompted text. see ReplaceLastPattern
* `ga` on a word and then `\riv` replaces that word with prompted text
* end of paragraph motion/OpPending `,<c-h/l`
* next/pre arguments movement with `,a`, `,A` - localleader for current arg
* show no-scrollbar-vim in lightline
* set foldtext=DefaultFoldtext()
* SourceVimL Operator function allows e.g.
  * <leader>saf "source around function"
  * <leader>si" "source inside quotes"
* `glt` in dirvish buffers cds new terminal into dirvish folder
* conceal character indicating hs-function foldmarkers
* `<leader>pe` does PasteLastEchoText
* fix bug in easyclip that scrolled buffer to the top
* `c-n/p` jumps to main haskell definitions applying a useful scrolloffset
* `zH` `zL` shifts cursor line to the top/bottom of visible area

## Release notes v1.1.0
* Skip cursor-rest jump if cursor hasn't moved (unfortunate fix)
* add to jumplist on updatetime and ex-command (;/:)
* camelCaseMotion use `,` leader e.g. `v2i,w`, `vi,e`, `v,b,b,b`
* go to insert start at InsertLeave, save insert end to jumplist
* `,ti` to insert type hole to get the type of a do bind. `,tu` to undo
* intero neovim custom functions e.g. `InsertEvalExpressionRes` are now in forked repo

## Release notes v1.0.5
  * close win above, below, left, right with `<c-w>d`: `k/j/h/l`
  * Pinning paragraphs and visual selections with `<leader>wp` (visual-split plugin)
  * Indenting settings
  * CamelCaseMotion plugin. Use e.g. `v2iw`, `vie`, `vbbb`
  * Add every yank position to the jumplist. In EasyClip with tag "AT tweak:"
  * Add start of visual mode (`v`) to jumplist
  * Add line motions to jumplist
  * Only the start of 'select word' `ga` next and search adds to the jumplist
  * line text object `al` `il`

*  (HEAD -> master) Note taking, jumplist, indention                                                                                                          5 hours ago   Andreas Thoelke  [d24bfe4]

## Release notes v1.0.4
* doc vim-targets, substitute motion
* vim-better-whitespace plugin
* easyclip:
  * delete does not change clipboard, but <localleader>d does
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





