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

ZSH_THEME="spaceship"

# ZSH_THEME_RANDOM_CANDIDATES=( "agnoster","cypher" )
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# DISABLE_UPDATE_PROMPT="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_MAGIC_FUNCTIONS=true
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting ) 

# Custom Plugin settings

VIM_MODE_VICMD_KEY='jk' # Mapping Esc to jk in vimmode
source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh
# Setting correct highlight color for zsh-autosuggestion
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=245'


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

# opam configuration
test -r /Users/i339130/.opam/opam-init/init.zsh && . /Users/i339130/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
