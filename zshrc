# zmodload zsh/zprof
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

source ~/.zsh/path.zsh
source ~/.zsh/private/hana_config.zsh
source ~/.zsh/autoload.zsh

if which type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi


# fpath=($HOME/.zsh/completion $fpath)
# autoload -Uz compinit
# for dump in ~/.zcompdump(N.mh+24); do
#   compinit
# done
# compinit -C


# Setup to always use 
# Personal Setup Adding ssh keys to agent
eval $(ssh-agent -s) > /dev/null 2>/dev/null
ssh-add -K ~/.ssh/id_rsa > /dev/null 2>/dev/null
ssh-add -K ~/.ssh/id_rsa_personal > /dev/null 2>/dev/null

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="pure"

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
# DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting ) 
# Custom Plugin settings
# VIM_MODE_VICMD_KEY='jk' # Mapping Esc to jk in vimmode
source $ZSH/oh-my-zsh.sh
# source $ZSH_CUSTOM/plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh
# Setting correct highlight color for zsh-autosuggestion
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=245'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40%'
if [[ $s(command -v rg) ]]; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore --follow --glob "!.git/*"'
fi

autoload -U promptinit; promptinit
prompt pure

#zprof
#

# 
# Hooks
#

autoload -U colors
colors

autoload -U add-zsh-hook

# function auto-ls-after-cd() {
# 	emulate -L zsh
# 	# Only in response to a user initiated `cd`, not indirectly (eg. via another
# 	# function).
# 	if [ "$ZSH_EVAL_CONTEXT" = "toplevel:shfunc" ]; then
# 		ls -a
# 	fi
# }

# add-zsh-hook chpwd auto-ls-after-cd

CDPATH=.:~:~/git:~/OneDrive\ -\ SAP\ SE/:~/Desktop/Personal\ Work:~/personal_git

source $HOME/.zsh/colors.zsh

# opam configuration
# test -r $HOME/.opam/opam-init/init.zsh && . $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

# Execute code in the background to not affect the current session
{
  # Compile zcompdump, if modified, to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!


# Function to compile cpp files
function clcomp() {
  output_file=$(echo $1 | cut -d'.' -f 1)
  if clang++ -std=c++17 -Wshadow -Wall -o "$output_file" "$1" -O2 -Wno-unused-result; then
    ./$output_file
  fi
}

## Launching neofetch
pfetch
