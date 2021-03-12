

# ##
# ## npm
# ##
export NPM_GLOBAL=~/.npm
npm set prefix $NPM_GLOBAL ## see https://nixos.wiki/wiki/Node.js
export PATH="$NPM_GLOBAL/bin:$PATH"
# ##
# ## haskell & nix
# ##

export  PATH="$HOME/.cabal/bin:$HOME/.local/bin:$PATH"

export SBT_HOME=~/.local/sbt
export PATH=$PATH:$SBT_HOME/bin

# ##
# ## kubernetes & helm
# ##
# export KUBECONFIG="$HOME/.kube/config"


# ##
# ## functions
# ##

 function lld()
 {
  ls -l $1 | grep ^d
 }

 function mkcd()
 {
  mkdir -p $1 && cd $_
 }


export  PATH=$PATH:$HOME/bin
export PATH=$PATH:~/.local/bin:~/.local/share/coursier/bin
# eval "$(direnv hook zsh)"

fpath=($fpath $HOME/.zsh/completion)

# ## set jdk
jdkversion='openjdk@1.11'

## xmondad fix to start idea
export  _JAVA_AWT_WM_NONREPARENTING=1

# ##
# ## doom
# ##
export PATH=$PATH:~/.emacs.d/bin
##set -o vi

