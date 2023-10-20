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

vim.opt.scrolloff = 4
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.undodir")

vim.o.fillchars = [[eob: ,fold: ,foldopen:▼,foldsep: ,foldclose:►]] -- hide fold level number
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.foldnestmax = 1
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- open telescope when neovim starts
-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     vim.cmd("silent! lua require('telescope.builtin').find_files()")
--   end,
-- })

-- Remove ~ sign in the signcolumn section
vim.opt.fillchars:append({ eob = " " })

-- DB
vim.cmd [[
  autocmd BufWritePre * lua vim.lsp.buf.format()

  let g:db_ui_auto_execute_table_helpers = 1
  let g:db_ui_table_helpers = {
  \   'postgresql': {
  \     'List': 'SELECT * FROM "{schema}"."{table}" LIMIT 100 OFFSET 0 * 100'
  \   }
  \ }
]]
