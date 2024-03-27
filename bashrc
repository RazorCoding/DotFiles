#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fetch='rate-mirrors --allow-root --protocol https arch | sudo tee /etc/pacman.d/mirrorlist'
PS1='[\u@\h \W]\$ '

source /usr/share/nvm/init-nvm.sh
