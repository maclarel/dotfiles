#!/bin/bash
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
        cp ~/.config ~/.config.orig
fi

for f in $configdirs; do
        echo "Copying .config to ~/"
        cp -R "$f" ~/.config/"$f"
done

# Vim
if [ -d ~/.vim ]; then
        echo "Backing up existing .vim dir"
        mv ~/.vim ~/.vim.old
        echo "Creating symlink for .vim"
        cp -R .vim ~/.vim
fi

