setopt correct_all
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
zle_highlight=('paste:none')

# beep is annoying
unsetopt BEEP

#completion
zstyle ':completion:*' menu select
autoload -Uz compinit
compinit
zmodload zsh/complist
# compinit
_comp_options+=(globdots) # Include hidden files too

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# # Prompt
autoload -Uz promptinit; promptinit
prompt pure

source $HOME/.zsh/functions.zsh

# Add prompt
zsh_add_prompt sindresorhus/pure 

# Add file
zsh_add_file autoload.zsh
zsh_add_file private/hana_config.zsh
zsh_add_file path.zsh
zsh_add_file custom-aliases.zsh
zsh_add_file vim-mode.zsh

# Plugins
zsh_add_plugin zsh-users/zsh-syntax-highlighting
zsh_add_plugin zsh-users/zsh-autosuggestions
zsh_add_plugin agkozak/zsh-z


# Setting up multiple git 
eval $(ssh-agent -s) > /dev/null 2>/dev/null
ssh-add -K $HOME/.ssh/id_rsa > /dev/null 2>/dev/null
ssh-add -K $HOME/.ssh/id_rsa_personal > /dev/null 2>/dev/null

# Binding keys
bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down

# FZF setup
#
[ -f $HOME/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_OPTS='--height 40%'
if [[ $s(command -v rg) ]]; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore --follow --glob --color=always'
  export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=dark
  --color=fg:-1,bg:-1,hl:#c678dd,fg+:-1,bg+:-1,hl+:#d858fe
  --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef'
fi

typeset -U path cdpath fpath
cdpath=($HOME $HOME/git $HOME/OneDrive\ -\ SAP\ SE/ $HOME/Desktop/Personal\ Work $HOME/personal_git)

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env
