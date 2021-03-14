Deprecating this repo as I started using [home-manager](https://github.com/nix-community/home-manager)
===
My dotfiles
====

A solutions for storing dotfiles that requires no extra tooling, and no symlinks. 

The technique consists in storing a Git bare repository in a "side" folder (like $HOME/.dotfiles) using a specially crafted alias:

``` sh
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```
## Detail
For complete detail see:
- [dotfiles tutorial](https://www.atlassian.com/git/tutorials/dotfiles)
- [archlinux wiki](https://wiki.archlinux.org/index.php/Dotfiles)
- [Hack news](https://news.ycombinator.com/item?id=11070797)

