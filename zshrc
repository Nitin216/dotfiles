#zmodload zsh/zprof
#
# Global
#

# Create a hash table for globally stashing variables without polluting main
# scope with a bunch of identifiers.
typeset -A __NC

__NC[ITALIC_ON]=$'\e[3m'
__NC[ITALIC_OFF]=$'\e[23m'

#
# Tex H4xx
#
if [ "$(uname)" = "Darwin" ]; then
	if [ -e /usr/local/share/zsh/site-functions/_git ]; then
    mv -f /usr/local/share/zsh/site-functions/{,disabled.}_git
  fi
fi

# If you come from bash you might have to change your $PATH.
export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/Users/i339130/Documents/cliclick:/Applications/Charles.app/Contents/MacOS:/Applications/sap/hdbclient:/usr/local/Cellar/maven/3.6.0/bin:/Applications/p4merge.app/Contents/MacOS:/Users/i339130/.opam/default/bin:/Users/i339130/opt/anaconda3/bin:/Users/i339130/opt/anaconda3/condabin:/Users/i339130/bin:/:/Users/i339130/Documents/cliclick:/Users/i339130/.npm-global/bin:/Library/Frameworks/Python.framework/Versions/3.7/bin:/anaconda3/bin:/usr/bin/python:/bin:/usr/sbin:/sbin:/Users/i339130/xmake-0.9.3-33/bin:/Users/i339130/sapjvm_8/bin:/Users/i339130/Documents/cliclick:/Users/i339130/Library/Python/2.7/bin:/Applications/sap/hdbclient:/usr/local/Cellar/maven/3.6.0/bin:/Users/i339130/scripts:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/opt/node@10/bin"

export MYVIMRC="~/.vimrc"


source ~/.zsh/private/hana_config.zshrc

if which type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi


fpath=($HOME/.zsh/completion $fpath)
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C


# Setup to always use 
# Personal Setup Adding ssh keys to agent
eval $(ssh-agent -s) > /dev/null 2>/dev/null
ssh-add -K ~/.ssh/id_rsa > /dev/null 2>/dev/null
ssh-add -K ~/.ssh/id_rsa_personal > /dev/null 2>/dev/null

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "agnoster","cypher" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting ) 
# Custom Plugin settings
VIM_MODE_VICMD_KEY='jk' # Mapping Esc to jk in vimmode
source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh
# Setting correct highlight color for zsh-autosuggestion
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=245'
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# opam configuration
#test -r $HOME/.opam/opam-init/init.zsh && . $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('$HOME/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "$HOME/opt/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "$HOME/opt/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="$HOME/opt/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<
#eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40%'
#zprof
#

# 
# Hooks
#

autoload -U colors
colors

autoload -U add-zsh-hook

function auto-ls-after-cd() {
	emulate -L zsh
	# Only in response to a user initiated `cd`, not indirectly (eg. via another
	# function).
	if [ "$ZSH_EVAL_CONTEXT" = "toplevel:shfunc" ]; then
		ls -a
	fi
}

add-zsh-hook chpwd auto-ls-after-cd

CDPATH=.:~:~/git:~/OneDrive\ -\ SAP\ SE/SearchToInsight:~/Desktop/Personal\ Work

source $HOME/.zsh/colors

function tmux() {
  emulate -L zsh

  # Make sure even pre-existing tmux sessions use the latest SSH_AUTH_SOCK.
  # (Inspired by: https://gist.github.com/lann/6771001)
  if [[ -n "$@" ]]; then
    env tmux "$@"
    return
  fi

  # Check for .tmux file (poor man's Tmuxinator).
  if [ -x .tmux ]; then
    # Prompt the first time we see a given .tmux file before running it.
	
    local DIGEST="$(openssl sha1 -sha512 .tmux)"
    if ! grep -q "$DIGEST" ~/..tmux.digests 2> /dev/null; then
      cat .tmux
      read -k 1 -r \
        'REPLY?Trust (and run) this .tmux file? (t = trust, otherwise = skip) '
      echo
      if [[ $REPLY =~ ^[Tt]$ ]]; then
        echo "$DIGEST" >> ~/..tmux.digests
        ./.tmux
        return
      fi
    else
      ./.tmux
      return
    fi
  fi

  # Attach to existing session, or create one, based on current directory.
  SESSION_NAME=$(basename "$(pwd)")
  env tmux new -A -s "$SESSION_NAME"
}
