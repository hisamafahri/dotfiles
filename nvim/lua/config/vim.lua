-- Prevent continue comment on new line
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  command = [[setlocal formatoptions-=c formatoptions-=r formatoptions-=o]],
})

vim.g.diagnostics_active = true
vim.diagnostic.config({
  virtual_text = true,
})
vim.opt.list = true
vim.cmd("set lcs+=space:·")
vim.opt.cursorline = true

-- # Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 16
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.undodir")

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 3

-- vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- Remove ~ sign in the signcolumn section
-- vim.opt.fillchars:append({ eob = " " })

-- configs for nvim.tree
vim.g.netrw_keepdir = 0
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
