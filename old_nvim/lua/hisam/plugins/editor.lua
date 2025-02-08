return {
  -- Auto pair/close tags
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({})
    end,
  },

  -- Auto comment
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
        pre_hook = require(
          "ts_context_commentstring.integrations.comment_nvim"
        ).create_pre_hook(),
      })
    end,
  },

  -- Buffer line
  -- { "akinsho/bufferline.nvim", version = "v4.*" },

  -- Nvim-tree
  { "nvim-tree/nvim-tree.lua", version = "v1" },

  -- Undo
  { "mbbill/undotree" },

  -- Diagnostics
  {
    "yorickpeterse/nvim-pqf",
    config = function()
      require("pqf").setup({})
    end,
  },

  -- Sublime-like multi cursors
  { "mg979/vim-visual-multi" },

  -- supermaven AI
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<Right>",
        },
      })
    end,
  },
}
