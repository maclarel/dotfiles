#!/bin/bash
exit 0 # Adding so this doesn't get called by Codespaces while in development
set -e

# List only files/config dirs that should be copied
dotfiles=".vimrc .zshrc .tmux.conf"
configdirs=".config/i3 .config/i3status .config/gh"

# Dotfiles
if [ -f ~/"$f" ]; then
        echo "Backing up pre-existing $f..."
        mv ~/"$f" ~/"$f".orig
fi

for f in $dotfiles; do
        echo "Copying $f to ~/"
        cp "$f" ~/"$f"
done

# Config dirs
if [ -d ~/.config ]; then
        echo "Backing up pre-existing ~/.config..."
        cp -R ~/.config ~/.config.orig
fi

for f in $configdirs; do
        echo "Copying $f to ~/"
        cp -R "$f" ~/"$f"
done

# Vim
if [ -d ~/.vim ]; then
        echo "Backing up existing .vim dir"
        cp -R ~/.vim ~/.vim.old
        echo "Copying .vim for .vim"
        cp -R .vim ~/.vim
fi

# Neovim
if [ ! -f /usr/bin/nvim ]; then
	sudo apt update && sudo apt install -y neovim
fi

if [ ! -f ~/.config/nvim/init.vim ]; then
	mkdir -p ~/.config/nvim
	ln -s ~/.vimrc ~/.config/nvim/init.vim
fi

# zsh plugins
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi
