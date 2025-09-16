return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 && cmake --build build --config=Release && cmake --install build",
      },
    },
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case" or "smart_case"
          },
        },
        defaults = {
          file_ignore_patterns = {
            ".git/",
            "node_modules/",
            ".svelte-kit/",
            "package/",
            "build/",
            "coverage/",
            ".next/",
            ".turbo/",
          },
        },
        pickers = {
          find_files = {
            hidden = true,
            disable_devicons = true,
            -- Hide "./" sign on search result
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
          },
          buffers = {
            sort_lastused = true,
            sorter = require("telescope.sorters").get_substr_matcher(),
          },
        },
      })
      telescope.load_extension("fzf")
      telescope.load_extension("live_grep_args")
    end,
  },
}
