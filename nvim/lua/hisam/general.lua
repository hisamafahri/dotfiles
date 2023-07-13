local vim = vim

-- Prevent continue comment on new line
vim.api.nvim_create_autocmd(
	"FileType",
	{ pattern = "*", command = [[setlocal formatoptions-=c formatoptions-=r formatoptions-=o]] }
)

vim.g.diagnostics_active = true
vim.diagnostic.config({
	virtual_text = true,
})
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
-- vim.opt.guicursor= "i:hor20-Cursor"
vim.g.netrw_keepdir = 0
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.undodir")

vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]] -- hide fold level number
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.foldnestmax = 1

-- open telescope when neovim starts
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("silent! lua require('telescope.builtin').find_files()")
	end,
})

-- Remove ~ sing in the signcolumn section
vim.opt.fillchars:append({ eob = " " })
