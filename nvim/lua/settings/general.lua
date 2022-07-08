local set = vim.opt

set.relativenumber = true -- Use relative number
set.number = true -- Show current line number
set.mouse = 'a' -- Enable mouse mode
set.colorcolumn = '80' -- Set color column at 80th character
set.cursorline = true -- Display cursor line
set.signcolumn = 'yes' -- Display sign column
set.scrolloff = 8 -- Add spaces on scroll
set.completeopt = 'menuone,noselect' -- Completion

-- File changes and history
set.updatetime = 250
set.undofile = true
set.swapfile = false

-- Split
set.splitright = true
set.splitbelow = true

-- Search
set.hlsearch = false
set.ignorecase = true
set.smartcase = true

-- Tabs and indentation
set.tabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smartindent = true
set.breakindent = true
