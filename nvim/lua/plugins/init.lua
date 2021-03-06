return require('packer').startup(function(use)
    -- Packer
    use 'wbthomason/packer.nvim'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'pantharshit00/vim-prisma' -- Spearate syntax highlighting for prisma

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'ziglang/zig.vim'

    -- Autocomplete
    use { 'hrsh7th/nvim-cmp', requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline'
    } }

    -- Snippet
    use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }

    -- Icons (required by several plugins below)
    use 'kyazdani42/nvim-web-devicons'

    -- NvimTree
    use { 'kyazdani42/nvim-tree.lua', tag = 'nightly' }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Lualine
    use 'nvim-lualine/lualine.nvim'

    -- Buffer Tabs
    use 'romgrk/barbar.nvim'

    -- Built-in Terminal
    use { "akinsho/toggleterm.nvim", branch = 'main' }

    -- Git Signs
    use 'lewis6991/gitsigns.nvim'

    -- Git DiffView
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- Comments
    use 'numToStr/Comment.nvim'
    use { 'folke/todo-comments.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- Autopairs
    use 'jiangmiao/auto-pairs'

    -- Indent guide
    use 'lukas-reineke/indent-blankline.nvim'

    -- Formatter
    use 'sbdchd/neoformat'

    -- Sorrounds
    use 'kylechui/nvim-surround'

    -- Hop
    use 'phaazon/hop.nvim'

    -- Themes
    use 'morhetz/gruvbox' -- Gruvbox theme
    use 'challenger-deep-theme/vim' -- Challenger deep theme
    use 'ajmwagar/vim-deus' -- Vim deus theme
end)
