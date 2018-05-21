#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

PROMPT="%n:%~"$'\n$ '

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

alias tw='function _fun(){ nohup streamlink --player mpv twitch.tv/$1 best &! };_fun'
alias yt='function _fun(){ youtube-viewer --video-player mpv $1 };_fun'
