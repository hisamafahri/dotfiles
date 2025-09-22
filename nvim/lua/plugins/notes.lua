return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    ft = "markdown",
    ---@module 'obsidian'
    config = function()
      require("obsidian").setup({
        workspaces = {
          {
            name = "notes",
            path = "~/notes",
          },
        },
        legacy_commands = false,
      })
    end,
  },
  {
    "plasticboy/vim-markdown",
    branch = "master",
    require = { "godlygeek/tabular" },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    -- config = function()
    --   require("render-markdown").setup({})
    -- end,
  },
  -- {
  --   "nvim-orgmode/orgmode",
  --   event = "VeryLazy",
  --   ft = { "org" },
  --   config = function()
  --     require("orgmode").setup({
  --       org_agenda_files = "~/notes/**/*",
  --       org_default_notes_file = "~/notes/inbox.org",
  --       org_startup_folded = "content",
  --       org_todo_keywords = { "TODO", "IN_PROGRESS", "|", "DONE" },
  --       org_capture_templates = {
  --         t = {
  --           description = "Todo",
  --           template = "* TODO %?\n  %u",
  --           target = "~/notes/inbox.org",
  --         },
  --       },
  --     })
  --   end,
  -- },
}
