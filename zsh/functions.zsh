cap() {
  nvim -c "autocmd BufEnter * only" -c "lua require('orgmode').capture:open_template_by_shortcut('t')"
}

alias tdark="ln -fs ~/.config/alacritty/colors/gruvbox.dark.toml ~/.config/alacritty/theme.toml"
alias tlight="ln -fs ~/.config/alacritty/colors/gruvbox.light.toml ~/.config/alacritty/theme.toml"
