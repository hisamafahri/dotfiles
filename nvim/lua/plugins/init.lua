return require('packer').startup(function(use)
    -- Packer
    use 'wbthomason/packer.nvim'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- LSP
    use 'neovim/nvim-lspconfig'
    use "williamboman/nvim-lsp-installer"

    -- Autocomplete
    use { 'hrsh7th/nvim-cmp', requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline'
    } }

    -- Snippet
    use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }

    -- NvimTree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
        tag = 'nightly'
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

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
    use 'tpope/vim-surround'

    -- Themes
    use 'morhetz/gruvbox' -- Gruvbox theme
    use 'Mofiqul/dracula.nvim' -- Dracula theme
    use 'joshdick/onedark.vim' -- Onedark theme
end)
