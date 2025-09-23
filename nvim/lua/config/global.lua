-- Ref: https://raw.githubusercontent.com/hisamafahri/dotfiles/a7df6a0d42c1425946e85b0f00094db1c7475440/nvim/lua/config/vim.lua
-- Set 2 spaces for indentation
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Fill · in space
vim.opt.list = true
vim.cmd("set lcs+=space:·")

-- Undo
vim.opt.undofile = true
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.undodir")

-- UI
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"

-- remove ~ in signcolumn
vim.opt.fillchars = { eob = " " }
