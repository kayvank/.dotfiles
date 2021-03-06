set +e
set -o vi


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

# ## so we can connect to redshift from emacs
# export PGPORT=5439
# ##
source $HOME/.nix-profile/etc/profile.d/nix.sh

# # NIX_GHC_VERSION=$(ghc --numeric-version)
# # export NIX_GHC="$HOME/.nix-profile/bin/ghc"
# # export NIX_GHCPKG="$HOME/.nix-profile/bin/ghc-pkg"
# # export NIX_GHC_DOCDIR="$HOME/.nix-profile/share/doc/ghc/html"
# # export NIX_GHC_LIBDIR="$HOME/.nix-profile/lib/ghc-${NIX_GHC_VERSION}"


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

# ##
# ##
# ##/usr/bin/setxkbmap -option "ctrl:swapcaps"

# # export FLINK_HOME=~/opt/flink
# # export PATH=$PATH:$FLINK_HOME/bin
# # export SUBSCRIPTION_ID=9f89d026-7c33-41a8-9cb8-4091d400aa7a

export  PATH=$PATH:$HOME/bin
export PATH=$PATH:~/.local/bin:~/.local/share/coursier/bin
# eval "$(direnv hook zsh)"

# fpath=($fpath $HOME/.zsh/completion)

# ## mit-scheme ##
export MITSCHEME_HOME=$HOME/.local/mit-scheme
export PATH=$PATH:$MITSCHEME_HOME/bin
export MITSCHEME_LIBRARY_PATH=$MITSCHEME_HOME/lib/mit-scheme-x86-64

[ -s "/home/kayvan/.jabba/jabba.sh" ] && source "/home/kayvan/.jabba/jabba.sh"

# ## set jdk
jdkversion='openjdk@1.11'
jabba use $jdkversion

## xmondad fix to start idea
export  _JAVA_AWT_WM_NONREPARENTING=1

# ##
# ## doom
# ##
export PATH=$PATH:~/.emacs.d/bin

archey3
