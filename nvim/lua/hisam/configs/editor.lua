-- NOTE: nvim.tree
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

-- configs for nvim.tree
vim.g.netrw_keepdir = 0
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
