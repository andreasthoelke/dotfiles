abc
Remote control Neovim processes.

If no process is found, a new one will be started.

    $ nvr --remote-send 'iabc<cr><esc>'
    $ nvr --remote-expr 'map([1,2,3], "v:val + 1")'

Any arguments not consumed by options will be fed to --remote-silent:

    $ nvr --remote-silent file1 file2
    $ nvr file1 file2

All --remote options take optional commands.
Exception: --remote-expr, --remote-send.

    $ nvr +10 file
    $ nvr +'echomsg "foo" | echomsg "bar"' file
    $ nvr --remote- tab - wait +'set bufhidden=delete' file

Open files in a new window from a terminal buffer:

    $ nvr -cc split file1 file2

Use nvr from git to edit commit messages:

    $ git config --global core.editor 'nvr --remote-wait-silent'

optional arguments:
  -h, --help            show this help message and exit
  --remote [<file> [<file> ...]]
                        Use :edit to open files. If no process is found, throw
                        an error and start a new one.
  --remote-wait [<file> [<file> ...]]
                        Like --remote, but block until all buffers opened by
                        this option get deleted or the process exits.
  --remote-silent [<file> [<file> ...]]
                        Like --remote, but throw no error if no process is
                        found.
  --remote-wait-silent [<file> [<file> ...]]
                        Combines --remote-wait and --remote-silent.
  --remote-tab [<file> [<file> ...]]
                        Like --remote, but use :tabedit.
  --remote-tab-wait [<file> [<file> ...]]
                        Like --remote-wait, but use :tabedit.
  --remote-tab-silent [<file> [<file> ...]]
                        Like --remote-silent, but use :tabedit.
  --remote-tab-wait-silent [<file> [<file> ...]]
                        Like --remote-wait-silent, but use :tabedit.
  --remote-send <keys>  Send key presses.
  --remote-expr <expr>  Evaluate expression and print result in shell.
  --servername <addr>   Set the address to be used. This overrides the default
                        "/tmp/nvimsocket" and $NVIM_LISTEN_ADDRESS.
  --serverlist          Print the TCPv4 and Unix domain socket addresses of
                        all nvim processes.
  -cc <cmd>             Execute a command before every other option.
  -c <cmd>              Execute a command after every other option.
  -l                    Change to previous window via ":wincmd p".
  -o <file> [<file> ...]
                        Open files via ":split".
  -O <file> [<file> ...]
                        Open files via ":vsplit".
  -p <file> [<file> ...]
                        Open files via ":tabedit".
  -q <errorfile>        Read errorfile into quickfix list and display first
                        error.
  -s                    Silence "no server found" message.
  -t <tag>              Jump to file and position of given tag.
  --nostart             If no process is found, do not start a new one.

