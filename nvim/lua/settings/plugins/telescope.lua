require('telescope').setup{
    defaults = {
        file_ignore_patterns = {
            ".git/",
            "node_modules/",
            ".svelte-kit/",
            "package/",
            "build/"
        }
    },
    pickers = {
        find_files = {
            hidden = true,
            -- Hide './' sign on search result
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
        }
    }
}
