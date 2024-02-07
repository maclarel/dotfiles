#!/bin/bash
set -e
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# List only files/config dirs that should be copied
DOTFILES=".vimrc .zshrc .tmux.conf"
CONFIGDIRS="gh" # limited list since this is only for codespaces at this time

# DOTFILES
for f in $DOTFILES; do
        if [ -f ~/"$f" ]; then
                mkdir -p ~/dotfiles_backups
                echo "Backing up pre-existing $f..."
                mv ~/"$f" ~/dotfiles_backups/"$f"
        fi

        echo "Linking $f"
        ln -s "$SCRIPT_DIR/$f" ~/"$f"
done

# .config dirs
mkdir -p ~/.config
for f in $CONFIGDIRS; do
        if [ -d ~/.config/"$f" ]; then
                mkdir -p ~/dotfiles_backups
                echo "Backing up pre-existing $f..."
                mv ~/.config/"$f" ~/dotfiles_backups/"$f"
        fi

        echo "Linking $f"
        ln -s "$SCRIPT_DIR/.config/$f" ~/.config/
done
