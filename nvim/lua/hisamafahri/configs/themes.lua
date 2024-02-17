local vim = vim
local M = {}

-- Define the border characters
local border_chars = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

-- Define the padding
local border_padding = {
  top = 1,
  bottom = 1,
  left = 2,
  right = 2,
}

local function general_settings()
  vim.api.nvim_set_hl(0, "@comment.todo", { bg = "#FFFFFF", fg = "#000000" })
  vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(vim.lsp.handlers.hover, {
      border = border_chars,
      padding = border_padding,
    })
  vim.diagnostic.config({
    float = { border = border_chars, padding = border_padding },
  })
end

local function light_theme_settings()
  vim.api.nvim_set_option("background", "dark")

  vim.g.gruvbox_material_transparent_background = 0
  vim.g.gruvbox_material_foreground = "mix"
  vim.g.gruvbox_material_background = "hard" -- soft, medium, hard
  vim.g.gruvbox_material_ui_contrast = "high" -- The contrast of line numbers, indent lines, etc.
  vim.g.gruvbox_material_float_style = "bright" -- Background of floating windows
  vim.g.gruvbox_material_statusline_style = "material"
  vim.g.gruvbox_material_visual = "reverse"

  vim.cmd.colorscheme("gruvbox-material")
end

local function dark_theme_settings()
  vim.api.nvim_set_option("background", "dark")

  vim.g.gruvbox_material_transparent_background = 0
  vim.g.gruvbox_material_foreground = "mix"
  vim.g.gruvbox_material_background = "hard" -- soft, medium, hard
  vim.g.gruvbox_material_ui_contrast = "high" -- The contrast of line numbers, indent lines, etc.
  vim.g.gruvbox_material_float_style = "bright" -- Background of floating windows
  vim.g.gruvbox_material_statusline_style = "material"
  vim.g.gruvbox_material_visual = "reverse"

  vim.cmd.colorscheme("gruvbox-material")
end

function M.on_light_mode()
  light_theme_settings()
  general_settings()
end

function M.on_dark_mode()
  dark_theme_settings()
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
