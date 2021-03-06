#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
. ~/.profile
[ -s "/home/kayvan/.jabba/jabba.sh" ] && source "/home/kayvan/.jabba/jabba.sh"

complete -C /home/kayvan/bin/terraform terraform
source "$HOME/.cargo/env"
