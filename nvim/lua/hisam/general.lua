vim.g.diagnostics_active = true
vim.diagnostic.config({
  virtual_text = true
})
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
-- vim.opt.guicursor= "i:hor20-Cursor"
vim.g.netrw_keepdir = 0
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.undodir')
