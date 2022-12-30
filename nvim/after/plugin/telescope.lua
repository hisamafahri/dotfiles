local telescope = require('telescope')
telescope.load_extension("live_grep_args")
telescope.load_extension("opener")
telescope.setup{
    defaults = {
        file_ignore_patterns = {
            ".git/",
            "node_modules/",
            ".svelte-kit/",
            "package/",
            "build/",
            "coverage/",
            ".next/"
        },
    },
    pickers = {
        find_files = {
            hidden = true,
            -- Hide './' sign on search result
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
        },
        buffers = {
            sort_lastused = true,
            sorter = require'telescope.sorters'.get_substr_matcher()
        },
    }
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>p', builtin.find_files, {})
vim.keymap.set('n', '<leader>f', telescope.extensions.live_grep_args.live_grep_args, {})
vim.keymap.set('n', '<leader><leader>', builtin.buffers, {})
vim.keymap.set('n', '<leader>o', function() require('telescope').extensions.opener.opener {
    hidden=false,
    respect_gitignore=true,
    root_dir="~/work",
} end, {})
