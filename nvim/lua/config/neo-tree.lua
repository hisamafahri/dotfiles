require("neo-tree").setup({
  default_component_configs = {
    git_status = {
      symbols = {
        added = "A", -- Added files
        modified = "M", -- Modified files
        deleted = "D", -- Deleted files
        renamed = "R", -- Renamed files
        untracked = "?", -- Untracked files (keeping ? as it's standard)
        ignored = "I", -- Ignored files
        unstaged = "U", -- Unstaged changes
        staged = "S", -- Staged changes
        conflict = "!", -- Conflicts
      },
    },
  },
})
