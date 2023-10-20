require("nvim-autopairs").setup()
require("Comment").setup()
require("nvim-ts-autotag").setup()
require("pqf").setup()
require("auto-dark-mode").init()
require 'treesitter-context'.setup {
  enable = true,           -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0,           -- How many lines the window should span. Values <= 0 mean no limit.
  multiline_threshold = 1, -- Maximum number of lines to show for a single context
}
