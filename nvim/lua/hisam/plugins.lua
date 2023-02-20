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
    -- Themes
    { "ellisonleao/gruvbox.nvim" },
    { "catppuccin/nvim", name = "catppuccin" },
    { 'rose-pine/neovim', name = 'rose-pine' },

    -- General
    {
        "nvim-telescope/telescope.nvim", version = "0.1.0",
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
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require('Comment').setup()
        end
    },
    {
        "windwp/nvim-ts-autotag",
        config = function ()
            require('nvim-ts-autotag').setup()
        end
    },

    -- Debugger
    -- use { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"} }

    -- Git
    { "lewis6991/gitsigns.nvim" },
    { "tpope/vim-fugitive" },
    { "kdheepak/lazygit.nvim" },

    -- Bufferline
    { "akinsho/bufferline.nvim", version = "v3.*" },
})
