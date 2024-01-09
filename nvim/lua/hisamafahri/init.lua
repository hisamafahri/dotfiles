local vim = vim

vim.g.mapleader = " "

-- Note: required first
require("hisamafahri/lazy")
require("hisamafahri/vim")
require("hisamafahri/remap")

require("hisamafahri.configs.bufferline")
require("hisamafahri.configs.formatter")
require("hisamafahri.configs.gitsigns")
require("hisamafahri.configs.lsp")
require("hisamafahri.configs.lualine")
require("hisamafahri.configs.nvim-tree")
require("hisamafahri.configs.telescope")
require("hisamafahri.configs.treesitter")
require("hisamafahri.configs.ufo")

