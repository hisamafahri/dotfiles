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

  -- Info line
  { "akinsho/bufferline.nvim", version = "v3.*" },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
  },

  -- Undo
  { "mbbill/undotree" },

  -- AI completion
  {
    "Exafunction/codeium.vim",
    commit = "a1c3d6b369a18514d656dac149de807becacbdf7",
  },

  -- Diagnostics
  {
    "yorickpeterse/nvim-pqf",
    config = function()
      require("pqf").setup({})
    end,
  },
}
