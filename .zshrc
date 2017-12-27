
# export PATH=/Users/andreas.thoelke/.local/bin:/Users/andreas.thoelke/Library/Python/3.6/bin:$PATH

path+=('/Users/andreas.thoelke/.local/bin')
path+=('/Users/andreas.thoelke/Library/Python/3.6/bin')

# Path to oh-my-zsh installation.
export ZSH=/Users/andreas.thoelke/.oh-my-zsh

export PROJ=/Users/andreas.thoelke/Documents/Haskell/4/

export LANG=en_US.UTF-8
export LC_COLLATE="C"
export EDITOR="nvim"
export VISUAL="nvim"
export TERM="xterm-256color"

export VIMCONFIG=~/.vim
export VIMDATA=~/vimtmp

# alias hdevtools='stack exec --no-ghc-package-path --package hdevtools hdevtools -- '


# Neovim Remote: ---------------------------------------------------------
alias vi="nvr -l "
# when in terminal mode, use neo-vim-remote to open file in the host
# nvim instance in the previously acitve window.

alias nvim="NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim"
# set an environment variable to nvim's default unix address, 
# so neo-vim-remote can send it messages.

alias vicd='nvr -c "cd $(pwd) | pwd"'
# Neovim Remote: ---------------------------------------------------------


NVIM_TUI_ENABLE_CURSOR_SHAPE=1

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME=“amuse”
# ZSH_THEME="cobalt2"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"


function chpwd() {
    emulate -L zsh
    ls -a
}



