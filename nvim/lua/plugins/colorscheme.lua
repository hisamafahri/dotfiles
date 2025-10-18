return {
  {
    "sainnhe/gruvbox-material",
    opts = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_enable_italic = true
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  -- {
  --   "f-person/auto-dark-mode.nvim",
  --   opts = {},
  -- },
}
