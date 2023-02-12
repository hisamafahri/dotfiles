vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    use { "wbthomason/packer.nvim" }
    -- Themes
    use { "ellisonleao/gruvbox.nvim" }
    use { "catppuccin/nvim", as = "catppuccin" }

    -- General
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.0",
        requires = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-live-grep-args.nvim" }
    }
    use { 'nvim-treesitter/nvim-treesitter',  run = ':TSUpdate' }
    use { "mbbill/undotree" }
    use { "willthbill/opener.nvim" }

    -- LSP
    use {
        "VonHeikemen/lsp-zero.nvim",
        requires = {
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
    }
    use {"akinsho/flutter-tools.nvim", requires = "nvim-lua/plenary.nvim"}

    -- Utilities
    use { "sbdchd/neoformat" }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {
        "numToStr/Comment.nvim",
        config = function()
            require('Comment').setup()
        end
    }
    use {
        "windwp/nvim-ts-autotag",
        config = function ()
            require('nvim-ts-autotag').setup()
        end
    }

    -- Debugger
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

    -- Git
    use { "lewis6991/gitsigns.nvim" }
    use { "tpope/vim-fugitive" }
    use { "kdheepak/lazygit.nvim" }

    -- Bufferline
    use { "akinsho/bufferline.nvim", tag = "v3.*" }
end)
