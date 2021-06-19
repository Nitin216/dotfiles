# git aliases
alias gc="git add . && git commit -m" # + commit message
alias gp="git push"
alias gpo="git push origin"
alias glo="git pull origin"
alias ghide="git update-index --skip-worktree"
alias gunhide="git update-index --no-skip-worktree"
alias ghidden="git ls-files -v . | grep ^S"
alias gsl="git stash list"
alias gs="git status"
alias gd="git diff"
alias glog="git log --oneline --color"

# common ones
alias e=exit
alias q=exit
alias vim=nvim
alias c=clear
alias grep='grep --color=auto'

# node  things
alias nps="npm run start"
alias npc="npm run clean"

# using exa instead of ls
alias ls="exa --icons"

# confirm before doing something
alias mv="mv -i"
alias cp="cp -i"
alias rm='rm -i'
