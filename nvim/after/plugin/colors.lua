vim.opt.termguicolors = true

-- Themes
vim.opt.background = "dark"
-- vim.o.background = "light"
vim.g.gruvbox_material_background = 'hard'

-- vim.cmd([[colorscheme catppuccin]])
-- vim.cmd([[colorscheme catppuccin-latte]])
vim.cmd([[colorscheme gruvbox-material]])

-- vim.g.lightline = { colorscheme = 'rose-pine' }
-- vim.g.lightline = { colorscheme = 'catppuccin' }

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
