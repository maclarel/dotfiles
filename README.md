# Various nix/macOS things

Dotfiles and plists for various apps I use/have used and want to maintain a source of truth for as I work across multiple machines.

- `vimrc`: Config for [vim](https://github.com/vim/vim), my editor of choice
- `zshrc`: Config for the [zsh](https://sourceforge.net/p/zsh/code/ci/master/tree/) shell
- `tmux.conf`: Config for the terminal multiplexer [tmux](https://github.com/tmux/tmux)
- `alacritty.yml|alacritty.toml`: Config for [Alacritty](https://github.com/alacritty/alacritty), current terminal emulator
- `hypr/*`: Configs for Hyprland and related services 
- `i3/*`: Config for i3
- `polybar`: Config for Polybar 
- `waybar`: Config for Waybar
- `rofi`: Config for Rofi

# Prereqs
- Install zsh & set as default shell
```
sudo apt install zsh && sudo usermod --shell /usr/bin/zsh <username>
```
- Install oh-my-zsh
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
- Install zsh-syntax-highlighting
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

# Deprecated configs
- `com.amethyst.Amethyst.plist`: Prefs file (yuck!) for my current tiling window manager, [Ameythyst](https://github.com/ianyh/Amethyst/)
  - Needs to be placed in `~/Library/Preferences/`
- `limelightrc`: Gives me window highlighting with [limelight](https://github.com/koekeishiya/limelight)
- `bash_profile`: Config for the [bash](https://www.gnu.org/software/bash/) shell (no longer used)
- `skhdrc`: Handles keyboard shortcuts for Yabai, via [skhd](https://github.com/koekeishiya/skhd) (no longer used)
- `yabairc`: Config for [yabai](https://github.com/koekeishiya/yabai), a tiling window manager on MacOS (no longer used)
