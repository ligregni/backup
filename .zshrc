# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
unsetopt autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ligregni/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# tcsh style word moving
my-backward-delete-word()
{
    local WORDCHARS=${WORDCHARS/\//}
    zle backward-delete-word
}
zle -N my-backward-delete-word
bindkey '^W' my-backward-delete-word

my-forward-delete-word()
{
    local WORDCHARS=${WORDCHARS/\//}
    zle forward-delete-word
}
zle -N my-forward-delete-word
bindkey '^[W' my-forward-delete-word

my-backward-word()
{
    local WORDCHARS=${WORDCHARS/\//}
    zle backward-word
}
zle -N my-backward-word
bindkey '^[b' my-backward-word

my-forward-word()
{
    local WORDCHARS=${WORDCHARS/\//}
    zle forward-word
}
zle -N my-forward-word
bindkey '^[f' my-forward-word

# Shell navigation
# bindkey "^P" up-line-or-search
# bindkey "^N" down-line-or-search
# bindkey '^R' history-incremental-search-backward

# Utility aliases
mkcd() { dir=$1; mkdir -p $dir && cd $dir }

alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias h=history

ttw() {
  text=$1
  PROMPT="$text %~%# "
}
alias tte='ttw "============================================================="'

panic()
{
  echo "ERROR!!!"
  return 1
}

export EDITOR=vim
export PROMPT='%m:%3/%# '

