local M = {}

vim.g.everforest_background = "hard"
vim.g.material_style = "lighter"

local function general_settings()
  -- Comment color for 'TODO'
  vim.api.nvim_set_hl(0, "@comment.todo", { bg = "#FFFFFF", fg = "#000000" })
end

local function set_color_themes(theme)
  if theme == "light" then
    vim.api.nvim_set_option("background", "light")
    -- vim.cmd.colorscheme("catppuccin-latte")
    -- vim.cmd.colorscheme("everforest")
    vim.cmd.colorscheme("material")
  else
    vim.api.nvim_set_option("background", "dark")
    -- vim.cmd.colorscheme("catppuccin-mocha")
    -- vim.cmd.colorscheme("everforest")
    vim.cmd.colorscheme("vesper")
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
