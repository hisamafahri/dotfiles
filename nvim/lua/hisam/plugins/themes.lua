local theme_configs = require("hisam.configs.themes")

return {
  -- Themes[1]: catppuccin
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- Themes[2]: modus
  { "miikanissi/modus-themes.nvim" },

  -- Change Neovim theme automatically on system appearance change
  {
    "f-person/auto-dark-mode.nvim",
    config = {
      update_interval = 1000,
      set_dark_mode = function()
        theme_configs.on_dark_mode()
      end,
      set_light_mode = function()
        theme_configs.on_light_mode()
      end,
    },
  },

  -- Make Neovim background transparent
  -- {
  --   "xiyaowong/transparent.nvim",
  --   config = function()
  --     require("transparent").setup({
  --       extra_groups = {
  --         "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
  --         "FloatBorder",
  --         "NvimTreeNormal", -- NvimTree
  --       },
  --     })
  --   end,
  -- },
}
