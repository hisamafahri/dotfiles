local themes = require("config.colorscheme")

return {
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      set_dark_mode = function()
        themes.on_dark_mode()
      end,
      set_light_mode = function()
        themes.on_light_mode()
      end,
    },
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
}
