# helix
rm -rf ~/.config/helix/config.toml ~/.config/helix/languages.toml ~/.config/helix/themes
ln -s ~/dotfiles/helix/config.toml ~/.config/helix/config.toml
ln -s ~/dotfiles/helix/languages.toml ~/.config/helix/languages.toml
ln -s ~/dotfiles/helix/themes ~/.config/helix/themes

# wezterm
# note that we add a dot prefix when symlinking
rm -f ~/.wezterm.lua
ln -s ~/dotfiles/wezterm/wezterm.lua ~/.wezterm.lua
