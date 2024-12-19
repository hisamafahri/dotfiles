vim.g.mapleader = " "

-- Note: required first
require("hisam/lazy")
require("hisam/vim")
require("hisam/remap")

require("hisam.configs.editor")
require("hisam.configs.git")
require("hisam.configs.lsp")
require("hisam.configs.telescope")
require("hisam.configs.treesitter")
