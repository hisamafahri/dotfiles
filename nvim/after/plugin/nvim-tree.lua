require("nvim-tree").setup({
  renderer = {
    indent_markers = {
      enable = true,
    },
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
      },
    },
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  view = {
    width = 50,
  },
})
