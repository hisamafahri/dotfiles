cap() {
  nvim -c "autocmd BufEnter * only" -c "lua require('orgmode').capture:open_template_by_shortcut('t')"
}
