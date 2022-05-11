local Plug = vim.fn['plug#']
local set = vim.opt
local key = vim.keymap

-- PLUG SERIES__________

vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'Mofiqul/dracula.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
vim.call('plug#end')

-- COLORSCHEME SERIES__________
vim.cmd "colorscheme dracula"

-- SET SERIES__________

-- tabs/indentaion
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smartindent = true

-- number
set.relativenumber = true
set.number = true

-- search
set.hlsearch = false
set.incsearch = true

-- files/buffer
set.hidden = true
set.undofile = true
set.undodir = "~/.nvim/undodir"
set.backup = false
set.swapfile = false

-- window
set.splitbelow = true
set.splitright = true
set.scrolloff = 8
set.sidescrolloff = 8
set.wrap = false
set.showmode = false
set.mouse = "n"
set.termguicolors = true
set.background = "dark"
-- set.signcolumn = "yes"

-- input/completion
set.completeopt = "menuone,noinsert,noselect"


-- KEYMAPPINGS SET__________
vim.g.mapleader = ' '

-- Telescope
key.set('n', '<Leader>ff', ':Telescope find_files hidden=true<CR>')
key.set('n', '<Leader>fg', ':Telescope live_grep<CR>')
key.set('n', '<Leader>fb', ':Telescope buffers<CR>')

-- Split
key.set('n', '<Leader>vn', ':vnew <CR>')
key.set('n', '<Leader>hn', ':new <CR>')
key.set('n', '<Leader>v', ':vsplit <CR>')
key.set('n', '<Leader>h', ':split <CR>')


-- todo
-- 1) completion
