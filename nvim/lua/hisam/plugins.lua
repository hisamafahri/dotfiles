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
    { "ellisonleao/gruvbox.nvim" },
    { "catppuccin/nvim", name = "catppuccin" },
    { 'rose-pine/neovim', name = 'rose-pine' },

    -- General
    {
        "nvim-telescope/telescope.nvim", version = "*",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-live-grep-args.nvim" }
    },
    { 'nvim-treesitter/nvim-treesitter',  build = ':TSUpdate' },
    { "mbbill/undotree" },
    { "willthbill/opener.nvim" },
    { "folke/trouble.nvim" },

    -- LSP
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        }
    },
    { "akinsho/flutter-tools.nvim", dependencies = "nvim-lua/plenary.nvim" },

    -- Utilities
    { "sbdchd/neoformat" },
    { "windwp/nvim-autopairs" },
    { "numToStr/Comment.nvim" },
    { "windwp/nvim-ts-autotag" },

    -- Debugger
    -- use { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"} }

    -- Git
    { "lewis6991/gitsigns.nvim" },
    { "tpope/vim-fugitive" },
    { "kdheepak/lazygit.nvim" },

    -- Bufferline
    { "akinsho/bufferline.nvim", version = "v3.*" },

    -- Filetree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        }
    }
})
