#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

[ -s "/home/kayvan/.jabba/jabba.sh" ] && source "/home/kayvan/.jabba/jabba.sh"
if [ -e /home/kayvan/.nix-profile/etc/profile.d/nix.sh ]; then . /home/kayvan/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
source "$HOME/.cargo/env"
