#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PROMPT="%n:%~"$'\n'"%# "

autoload -Uz compinit
compinit

alias sudo='sudo '
alias ls='ls --color=auto'
alias la='ls -al'
alias p='pacman'
alias pS='sudo pacman -S'
alias pSy='sudo pacman -Sy'
alias pSyu='sudo pacman -Syu'
alias pR='sudo pacman -R'
alias pRsun='sudo pacman -Rsun'
alias pSs='pacman -Ss'
