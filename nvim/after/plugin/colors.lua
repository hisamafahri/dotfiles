vim.opt.termguicolors = true

-- Themes
vim.opt.background = "dark"
-- vim.o.background = "light"

-- vim.cmd([[colorscheme catppuccin]])
-- vim.cmd([[colorscheme catppuccin-latte]])
vim.cmd([[colorscheme gruvbox]])

-- vim.g.lightline = { colorscheme = 'rose-pine' }
-- vim.g.lightline = { colorscheme = 'catppuccin' }

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

