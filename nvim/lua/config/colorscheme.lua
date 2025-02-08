local M = {}

local border_chars = {
  { "┌", "FloatBorder" },
  { "─", "FloatBorder" },
  { "┐", "FloatBorder" },
  { "│", "FloatBorder" },
  { "┘", "FloatBorder" },
  { "─", "FloatBorder" },
  { "└", "FloatBorder" },
  { "│", "FloatBorder" },
}
local border_padding = {
  top = 1,
  bottom = 1,
  left = 2,
  right = 2,
}

local function general_settings()
  -- Comment color for 'TODO'
  vim.api.nvim_set_hl(0, "@comment.todo", { bg = "#FFFFFF", fg = "#000000" })
  -- Border color
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#292929" })

  vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(vim.lsp.handlers.hover, {
      border = border_chars,
      padding = border_padding,
    })
  vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = border_chars,
      padding = border_padding,
    })
  vim.diagnostic.config({
    float = { border = border_chars, padding = border_padding },
  })
end

local function set_color_themes(theme)
  if theme == "light" then
    vim.api.nvim_set_option("background", "light")
    vim.cmd.colorscheme("catppuccin-latte")
  else
    vim.api.nvim_set_option("background", "dark")
    vim.cmd.colorscheme("catppuccin-mocha")
  end
end

function M.on_light_mode()
  set_color_themes("light")
  general_settings()
end

function M.on_dark_mode()
  set_color_themes("dark")
  general_settings()
end

return M

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
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg="#18188" })
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
