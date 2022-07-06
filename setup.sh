#!/bin/bash
set -e

dotfiles=".vimrc .zshrc .tmux.conf"
configfiles=".config/i3/config .config/i3status/config .config/gh/config.yml"

# Dotfiles
for f in $dotfiles; do
        if [ -f ~/"$f" ]; then
                echo "Backing up pre-existing $f..."
                mv ~/"$f" ~/"$f".orig
        fi
        echo "Creating symlink for $f"
        ln -s "$f" ~/"$f"
done

# Config files
for f in $configfiles; do
        if [ -f ~/"$f" ]; then
                echo "Backing up pre-existing $f..."
                mv ~/"$f" ~/"$f".orig
        fi
        echo "Creating symlink for $f"
        ln -s "$f" ~/"$f"
done

# Vim
if [ -d ~/.vim ]; then
        echo "Backing up existing .vim dir"
        mv ~/.vim ~/.vim.old
        echo "Creating symlink for .vim"
        ln -s .vim ~/.vim
fi

