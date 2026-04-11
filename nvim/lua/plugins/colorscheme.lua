return {
  -- {
  --   "sainnhe/gruvbox-material",
  --   lazy = false,
  --   priority = 1000,
  -- },
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
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
        vim.cmd.colorscheme("zenbones")

        -- vim.g.gruvbox_material_background = "hard"
        -- vim.g.gruvbox_material_enable_italic = true
        -- vim.cmd.colorscheme("gruvbox-material")

        -- -- Gruvbox gray
        -- vim.cmd([[highlight LineNr guifg=#7c6f64]])
        -- -- Gruvbox yellow
        -- vim.cmd([[highlight CursorLineNr guifg=#d8a657 gui=bold]])
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value("background", "light", {})
        vim.cmd.colorscheme("zenbones")

        -- vim.g.gruvbox_material_background = "hard"
        -- vim.g.gruvbox_material_enable_italic = true
        -- vim.cmd.colorscheme("gruvbox-material")

        -- -- Gruvbox gray (light)
        -- vim.cmd([[highlight LineNr guifg=#928374]])
        -- -- Gruvbox yellow (light)
        -- vim.cmd([[highlight CursorLineNr guifg=#b57614 gui=bold]])
      end,
    },
  },
}
