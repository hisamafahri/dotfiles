cap() {
  nvim -c "autocmd BufEnter * only" -c "lua require('orgmode').capture:open_template_by_shortcut('t')"
}

# NOTE: theme switcher for alacritty
# alias tdark="ln -fs ~/.config/alacritty/colors/gruvbox.dark.toml ~/.config/alacritty/theme.toml"
# alias tlight="ln -fs ~/.config/alacritty/colors/gruvbox.light.toml ~/.config/alacritty/theme.toml"

pginit() {
  if [[ -z "$1" ]]; then
    echo "Usage: pginit <db_name>"
    return 1
  fi

  local db_name="$1"

  docker run \
    --name "postgres-5432-${db_name}" \
    -e POSTGRES_PASSWORD=postgres \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_DB="${db_name}" \
    -p 5432:5432 \
    -d postgres:latest
}
