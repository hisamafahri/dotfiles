local vim = vim

return {
  { "morhetz/gruvbox" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Change Neovim theme automatically on system appearance change
  {
    "f-person/auto-dark-mode.nvim",
    config = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option("background", "dark")
        vim.cmd("colorscheme gruvbox")
        -- vim.cmd("colorscheme catppuccin")
      end,
      set_light_mode = function()
        vim.api.nvim_set_option("background", "dark")
        -- vim.api.nvim_set_option("background", "light")
        vim.cmd("colorscheme gruvbox")
        -- vim.cmd("colorscheme catppuccin-latte")
        -- vim.cmd("colorscheme catppuccin")
      end,
    },
  },

  -- Make Neovim background transparent
  -- {
  --   "xiyaowong/transparent.nvim",
  --   config = function()
  --     require("transparent").setup({
  --       extra_groups = {
  --         "NormalFloat",   -- plugins which have float panel such as Lazy, Mason, LspInfo
  --         "FloatBorder",
  --         "NvimTreeNormal" -- NvimTree
  --       },
  --     })
  --   end
  -- },
}

-- ================ OLD COLORS SETTINGS ================

-- ================ WINDOW SETTINGS ================
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })

-- ================ CONFLICT SETTINGS ================
-- vim.cmd("highlight ConflictMarkerBegin guibg=#2f7366")
-- vim.cmd("highlight ConflictMarkerOurs guibg=#2e5049")
-- vim.cmd("highlight ConflictMarkerTheirs guibg=#344f69")
-- vim.cmd("highlight ConflictMarkerEnd guibg=#2f628e")
-- vim.cmd("highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81")

-- ================ DARK MODE SETTINGS ================
-- -- Remove the 'fg' in the 'EndOfBuffer' to show the ~
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg="#121212", fg="#121212" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { bg="#121212", fg="#121212" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { bg="#121212", fg="#121212" })
-- vim.api.nvim_set_hl(0, "Pmenu", { bg="#121212" })
-- vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { bg="#121212", fg="OrangeRed" })
-- vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", { bg="#121212", fg="yellow" })
-- vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo", { bg="#121212", fg="blue" })
-- vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", { bg="#121212", fg="green" })
-- vim.api.nvim_set_hl(0, "Normal", { bg="#121212" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg="#121212" })
-- vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg="#181818" })
-- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg="#181818" })
-- vim.api.nvim_set_hl(0, "TelescopeBorder", { bg="#181818",  fg="#181818" })
--
-- -- -- Colors for Telescope's preview
-- vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg="#151515" })
-- vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg="#151515", fg="#151515" })
-- -- vim.api.nvim_set_hl(0, "NormalFloat", { bg="#18188" })
-- -- vim.api.nvim_set_hl(0, "FloatBorder", { bg="#181818", fg="#181818" })

-- ================ OLD THEME SETTINGS ================

-- Themes
-- vim.o.background = "dark"
-- vim.o.background = "light"
-- vim.g.gruvbox_material_background = 'hard'

-- vim.cmd([[colorscheme catppuccin]])
-- vim.cmd([[colorscheme catppuccin-latte]])
-- require("gruvbox").setup({
-- 	transparent_mode = true,
-- })
-- vim.cmd([[colorscheme gruvbox]])
-- vim.cmd([[colorscheme gruvbox-material]])
