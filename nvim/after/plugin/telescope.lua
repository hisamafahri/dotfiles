require('telescope').load_extension("opener")
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>p', builtin.find_files, {})
vim.keymap.set('n', '<leader>f', builtin.live_grep, {})
vim.keymap.set('n', '<leader><leader>', builtin.buffers, {})
vim.keymap.set('n', '<leader>o', function() require('telescope').extensions.opener.opener {
    hidden=false,
    respect_gitignore=true,
    root_dir="~/work",
} end, {})
