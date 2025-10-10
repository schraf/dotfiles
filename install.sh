#!/bin/bash
mkdir -p ~/.vim/backup ~/.vim/swap ~/.vim/undo ~/.vim/colors
mkdir -p ~/.config/fish
mkdir -p ~/.fzf/plugin

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

cp vimrc ~/.vimrc
cp tmux.conf ~/.tmux.conf
cp config.fish ~/.config/fish
cp -R base16/base16-shell ~/.config/base16-shell
cp base16/base16-vim/colors/*.vim ~/.vim/colors
cp fzf.vim ~/.fzf/plugin

