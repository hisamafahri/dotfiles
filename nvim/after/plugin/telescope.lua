local telescope = require("telescope")
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
            ".next/",
            ".turbo/"
        },
    },
    pickers = {
        find_files = {
            hidden = true,
            disable_devicons = true,
            -- Hide "./" sign on search result
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
        },
        buffers = {
            sort_lastused = true,
            sorter = require"telescope.sorters".get_substr_matcher()
        },
    }
}

