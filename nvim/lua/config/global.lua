-- Ref: https://raw.githubusercontent.com/hisamafahri/dotfiles/a7df6a0d42c1425946e85b0f00094db1c7475440/nvim/lua/config/vim.lua
vim.opt.list = true
vim.cmd("set lcs+=space:·")
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.fillchars = { eob = " " } -- remove ~ in signcolumn
