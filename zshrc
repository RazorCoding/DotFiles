export EDITOR=helix

TMOUT=1

TRAPALRM() {
    zle reset-prompt
}
# Zsh to use the same colors as ls
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}  
alias ls='ls --color=auto'
alias hx='helix'
eval "$(starship init zsh)"
