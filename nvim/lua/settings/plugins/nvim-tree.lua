require("nvim-tree").setup {
    filters = { custom = { ".git$" } },
    renderer = {
        indent_markers = {
            enable = true,
            icons = {
                corner = "└ ",
                edge = "│ ",
                item = "│ ",
                none = "  ",
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = false,
                folder = false,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                git = {
                    unstaged = "*",
                    staged = "✓",
                    renamed = "^",
                    untracked = "^",
                    ignored = " ",
                },
            },
        },
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    },
}
