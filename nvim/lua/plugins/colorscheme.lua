return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
  },
  {
    "f-person/auto-dark-mode.nvim",
    lazy = false,
    priority = 999,
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option_value("background", "dark", {})
        vim.g.gruvbox_material_background = "hard"
        vim.g.gruvbox_material_enable_italic = true
        vim.cmd.colorscheme("gruvbox-material")
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value("background", "light", {})
        vim.g.gruvbox_material_background = "hard"
        vim.g.gruvbox_material_enable_italic = true
        vim.cmd.colorscheme("gruvbox-material")
      end,
    },
  },
}
