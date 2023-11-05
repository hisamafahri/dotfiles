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

require("transparent").setup({ -- Optional, you don't have to run setup.
  groups = {                   -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLineNr', 'EndOfBuffer',
  },
  extra_groups = {},   -- table: additional groups that should be cleared
  exclude_groups = {}, -- table: groups you don't want to clear
})

require('Comment').setup({
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
})
