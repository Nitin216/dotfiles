dune() {
  if [[ -d "$HOME/.opam/opam-init/init.zsh" ]]; then
    source "$HOME/.opam/opam-iniit/init.zsh"
  fi
}


autoload -Uz compinit
if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
  compinit
else
  compinit -C
fi
