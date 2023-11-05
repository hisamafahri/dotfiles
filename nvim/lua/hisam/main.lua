local vim = vim

vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
  -- NOTE: First, some plugins that doesn't require the configuration
  -- Themes
  { "morhetz/gruvbox" },
  { "rebelot/kanagawa.nvim",       priority = 1000 },

  -- Change Neovim theme automatically on system appearance change
  { "f-person/auto-dark-mode.nvim" },

  -- LSP
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      {
        -- Optional
        "williamboman/mason.nvim",
        build = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
      },
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },     -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "L3MON4D3/LuaSnip" },     -- Required
    },
  },
  { "kevinhwang91/nvim-ufo",     dependencies = "kevinhwang91/promise-async" },
  -- { "akinsho/flutter-tools.nvim", dependencies = "nvim-lua/plenary.nvim" },

  -- Utilities
  { "mhartington/formatter.nvim" },
  { "windwp/nvim-autopairs" },
  { "numToStr/Comment.nvim" },
  { "windwp/nvim-ts-autotag" },
  { "akinsho/bufferline.nvim",   version = "v3.*" },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
  },
  { "alexghergh/nvim-tmux-navigation" },
  { "xiyaowong/transparent.nvim" },

  -- Diagnostics
  { "yorickpeterse/nvim-pqf" },
  { "folke/trouble.nvim" },

  -- Debugger
  -- { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },

  -- Git
  { "lewis6991/gitsigns.nvim" },
  { "tpope/vim-fugitive" },
  { "kdheepak/lazygit.nvim" },
  { "rhysd/conflict-marker.vim" },
  { "rbong/vim-flog" },

  -- Database
  { "tpope/vim-dadbod" },
  { "kristijanhusak/vim-dadbod-ui" },
  { "kristijanhusak/vim-dadbod-completion" },

  -- Discovery
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-live-grep-args.nvim" },
  },
  { "nvim-telescope/telescope-fzf-native.nvim",   build = "make" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    }
  },
  { "nvim-treesitter/nvim-treesitter-context" },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "mbbill/undotree" },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
})
