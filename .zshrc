

# $Path is now defined at /etc/paths:
# /Users/andreas.thoelke/.npm/bin
# /Users/andreas.thoelke/.local/bin
# /Users/andreas.thoelke/.cabal/bin
# /Users/andreas.thoelke/.ghcup/bin
# /usr/local/bin
# /usr/bin
# /bin
# /usr/sbin
# /sbin

# To set the system-wide $PATH, run "sudo nvim /etc/paths" and add paths to the beginning of the file to have them
# scanned with priority. This becomes effective after restarting the terminal → ":Alacritty" in vim or "alacritty" in
# the shell - not after "source .zshrc"
# Use this to view the current path
# echo $PATH | tr ':' '
# or alternatively ":Path" in vim

# 07-2019:
# /Users/andreas.thoelke/.cargo/bin
# /Library/Frameworks/Python.framework/Versions/3.6/bin
# /Users/andreas.thoelke/.npm/bin
# /Users/andreas.thoelke/.local/bin
# /Users/andreas.thoelke/.cabal/bin
# /Users/andreas.thoelke/.ghcup/bin
# /usr/local/bin
# /usr/bin
# /bin
# /usr/sbin
# /sbin
# /opt/X11/bin
# /Users/andreas.thoelke/.cargo/bin
# /Library/Frameworks/Python.framework/Versions/3.6/bin

# TODO who enters and then doublicates these lines?
# /Users/andreas.thoelke/.cargo/bin
# /Library/Frameworks/Python.framework/Versions/3.6/bin

# Previous approach and info:
# export PATH=/Users/andreas.thoelke/.local/bin:/Users/andreas.thoelke/Library/Python/3.6/bin:$PATH

# This is where stack/haskell tools (like HIE) are installed to
# path+=('/Users/andreas.thoelke/.local/bin')
# Other Haskell tools?:
# path+=('/Users/andreas.thoelke/.cabal/bin')
# Python apps:
# path+=('/Users/andreas.thoelke/Library/Python/3.6/bin')
# Rust apps:
# path+=('/Users/andreas.thoelke/.cargo/bin')
# Manage versions of ghc:
# path+=('/Users/andreas.thoelke/.ghcup/bin')


# View man pages in vim:
export MANPAGER="nvim -c 'set ft=man' -"

# Path to oh-my-zsh installation. (why is this an env variable?)
export ZSH=/Users/andreas.thoelke/.oh-my-zsh

# TODO When is this used?
export PROJ=/Users/andreas.thoelke/Documents/Haskell/4/

export LANG=en_US.UTF-8
export LC_COLLATE="C"
export EDITOR="nvim"
export VISUAL="nvim"
# Could consider `export EDITOR='vim -u alternate_profile.vim'`
export TERM="xterm-256color"

# Open `man` pages in Chrome (not in less):
# export PAGER="col -b  | open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome -f"
# export PAGER="col -b  | open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome -f"

export VIMCONFIG=~/.vim
export VIMDATA=~/vimtmp

# alias hdevtools='stack exec --no-ghc-package-path --package hdevtools hdevtools -- '

# Kitty is a terminal (similar to Alacritty)
export KITTY_CONFIG_DIRECTORY="/Users/andreas.thoelke/.config/kitty"
export SPOTIFY_API_KEY="BQBS1cU_h47_9uAAWwDS2ZYgttFF7tcqmWv4LPfZ"

alias alacritty="open -n '/Users/andreas.thoelke/Documents/temp/alacritty/target/release/osx/Alacritty.app/'"
# Alacritty config file: .config/alacritty/alacritty.yml

alias npmpath='/Users/andreas.thoelke/.npm/bin'
alias npmp='/Users/andreas.thoelke/.npm/bin'

# export ONI_NEOVIM_PATH="/usr/local/Cellar/neovim/0.3.3/bin/"

alias nvim40="/Users/andreas.thoelke/Documents/vim/nvim-osx64-0.4.0/bin/nvim"
# NVIM v0.4.0-762-g9420a2127
alias nvim4="/Users/andreas.thoelke/Documents/vim/nvim-osx64-0.4.3/bin/nvim"
# NVIM v0.4.3
alias nvim5="/Users/andreas.thoelke/Documents/vim/nvim-osx64-0.5.0/bin/nvim"
# NVIM v0.5.0

# Neovim Remote: ---------------------------------------------------------
alias vi="nvr -l "
# when in terminal mode, use neo-vim-remote to open file in the host
# nvim instance in the previously acitve window.

alias nvim="NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim"
# set an environment variable to nvim's default unix address,
# so neo-vim-remote can send it messages.

alias vicd='nvr -c "cd $(pwd) | pwd"'
# From nvim terminal mode 'vicd' changes vim's current directory
# to the current dir in the terminal
# Neovim Remote: ---------------------------------------------------------

alias svim='nvim -u ~/.SpaceVim/vimrc'

NVIM_TUI_ENABLE_CURSOR_SHAPE=1

# NyaoVim
alias yvim='npm run app --prefix Documents/NyaoVim'


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME=“amuse”
# ZSH_THEME="cobalt2"
# zstyle ':completion:*:builtins' list-colors '=*=1;203;5;142'
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"


# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

function set-title(){
  TITLE="\[\e]2;$*\a\]"
  echo -e ${TITLE}
}

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
   git
   zsh-syntax-highlighting
   # fast-syntax-highlighting
   hub
   copyfile # "copyfile <filename>" to copy text of file into clipboard
   web-search # "google ..", "wiki" "!w"
   vi-mode
   # zsh_reload # use "src" to reload .zshrc in all running shells
   )

source $ZSH/oh-my-zsh.sh


# Zsh highlight colors config:
# Docs: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

ZSH_HIGHLIGHT_STYLES[path]='fg=#42606B,bg=#0E0E0E'
# ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=white'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#A22E44,bg=#030303'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#3C6B7C,bg=#030303'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#76E0D9'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#008EB8'
ZSH_HIGHLIGHT_STYLES[function]='fg=#008EB8'
ZSH_HIGHLIGHT_STYLES[command]='fg=#008EB8'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#008EB8'
ZSH_HIGHLIGHT_STYLES[default]='fg=#BECACD'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#983B4D'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#983B4D'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#077D67'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#077D67'

# User configuration --------------------------------------------------



# Activate vim bindings
bindkey -v

# Prevent accidential overwriting using redireaction, e.g. `echo "test" > willbeereased.txt`. Can still use `echo "Start new" >! file.txt`
set -o noclobber

# Key maps for Zsh vi mode: https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/vi-mode/README.md


# Note Taking: {{{ -------------------------------------------------------

# A Scratchpad
alias vnote='nvim5 ~/notes/note-$(date +"%m-%d-%Y-%T")'

notes() {
  if [ -n "$1" ]; then
    echo $@ >> "$HOME/notes.md"
  else
    # detect if we're in a tty or a pipe
    if [ -t 0 ]; then
      nvim "$HOME/notes.md"
    else
      cat - >> "$HOME/notes.md"
    fi
  fi
}
# Allows doing `uptime | notes`
# And heredoc multiline: `notes <<SOMEID
#                         first line
#                         second line
#                         SOMEID

# }}} Note Taking: -------------------------------------------------------



# Enable copy/paste from and into the system clipboard in vi-mode using 'y' and 'p'
function vi-yank-pbcopy {
  zle vi-yank
  echo "$CUTBUFFER" | pbcopy
}
zle -N vi-yank-pbcopy
bindkey -M vicmd 'y' vi-yank-pbcopy

function vi-put-after-pbcopy {
  CUTBUFFER=$(pbpaste)
  zle vi-put-after
}
zle -N vi-put-after-pbcopy
bindkey -M vicmd 'p' vi-put-after-pbcopy

function vi-put-before-pbcopy {
  CUTBUFFER=$(pbpaste)
  zle vi-put-before
}
zle -N vi-put-before-pbcopy
bindkey -M vicmd 'P' vi-put-before-pbcopy


# ~/.vim/notes

export KEYTIMEOUT=1

# `v` is already mapped to visual mode, so we need to use a different key to
# open Vim
# defined in vim-mode plugin:
# bindkey -M vicmd "^V" edit-command-line

# -- Vim Mode Indicator ----------
vim_ins_mode="I"
vim_cmd_mode="N"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  __promptline
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

function TRAPINT() {
  vim_mode=$vim_ins_mode
  return $(( 128 + $1 ))
}
# -- Vim Mode Indicator ----------

# Shell prompt style showing vim modes and git branch
# Shell prompt config created by promptline.vim
# This is used instead of a 'theme'?
source ~/.promptline.sh



unsetopt correct_all
unsetopt correct

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias sourcez="source ~/.zshrc"
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

# App aliases:
# /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chromedebug="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222 --no-first-run --no-default-browser-check --user-data-dir=$(mktemp -d -t 'chrome-remote_data_dir')"

alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"
# Tested examples:
# /Applications/Chromium.app/Contents/MacOS/Chromium --window-size=200,500 --window-position=0,20
# chromium --window-size=800,400 --window-position=222,222

# Git aliases: ---------------------------------------------------------
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit -m '
alias gd='git diff'
alias go='git checkout '
alias gitk='gitk --all&'
alias gitx='gitx --all'

# Git aliases: ---------------------------------------------------------


alias ls='exa --sort=type --level=2 --all'
alias lst='exa --sort=type --level=2 --all -T'
# Note you can type "ls -T" to see a depth-limited tree
# https://the.exa.website/docs/command-line-options

function chpwd() {
    emulate -L zsh
    ls -a
}

# Use MacOS Preview app to view man pages:
function pman() {
    man -t ${@} | open -f -a /Applications/Preview.app/
}

# TIP: Quickly create and delete folders: "mkcd test2" - "rmcurdir"
#      Or rather just the classic way: "mkdir test3 && cd $_", "echo "test" > test3", "rm *", "cd ..", "rmdir test3"
# Make dir and change into it
function mkcd ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

alias rmcurdir='rmdir `pwd` && cd ..'

# Setup ANSI colors (see https://jonasjacek.github.io/colors/)
# as "ls" and completion tools don't seem to support full RGB?
fileTypeColors='di=38;5;73:'
fileTypeColors+='*md=38;5;159:'
fileTypeColors+='.*=38;5;244:'

# export LS_COLORS="di=38;5;11:*.md=38;5;13"
export LS_COLORS=$fileTypeColors


# between quotation marks is the tool output for LS_COLORS
# export LS_COLORS="di=31;41:ln=31;41:so=31;41:pi=31;41:ex=31;41:bd=31;41:cd=31;41:su=31;41:sg=31;41:tw=31;41:ow=31;41:"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Use pyenv to manage Python installations:
# https://opensource.com/article/19/5/python-3-default-mac#what-to-do
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi


# this seems to control the nodejs version!
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/andreas.thoelke/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/andreas.thoelke/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/andreas.thoelke/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/andreas.thoelke/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

