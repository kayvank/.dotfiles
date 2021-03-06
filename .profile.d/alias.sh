set +e

##
## alias
##

##
## dotfiles related
##
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias sysuser='systemctl --user '
alias vim='/usr/bin/nvim'
alias ll='ls -l'
alias tmx='tmux new-session -s $USER-`date +%s`'
alias tma='tmux attach'
##
## kubectl
##
alias k='kubectl'
alias ksys='kubectl -n kube-system'
alias kl='kubectl logs '

alias pbcopy='xclip -in -selection clipboard'
alias pbpaste='xsel --clipboard'

alias wproto='cd ~/dev/workspaces/workspace-proto/'
alias whaskell='cd ~/dev/workspaces/workspace-haskell/'
alias wtools='cd ~/dev/workspaces/workspace-tools/'

alias wbook='cd ~/Documents/ebooks/'

##
## nix-stuff
##
alias cbl2nix='nix-shell --packages cabal2nix --run "cabal2nix ." > default.nix'

alias emc="nohup emacsclient -c &> /dev/null &"
alias emd="emacs --daemon"

## 
## haskell & ghci 
## 
alias ghci="stack exec -- ghci"
alias ghc="stack exec -- ghc"
