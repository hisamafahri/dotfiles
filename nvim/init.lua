local set = vim.opt
local key = vim.keymap

-- COLORSCHEME SERIES__________
vim.cmd "colorscheme dracula"

-- SET SERIES__________

-- tabs/indentaion
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smartindent = true

-- number
set.relativenumber = true
set.number = true

-- search
set.hlsearch = false
set.incsearch = true

-- files/buffer
set.hidden = true
set.undofile = true
set.undodir = "~/.nvim/undodir"
set.backup = false
set.swapfile = false

-- window
set.splitbelow = true
set.splitright = true
set.scrolloff = 8
set.sidescrolloff = 8
set.wrap = false
set.showmode = false
set.mouse = "n"
set.termguicolors = true
set.background = "dark"
set.signcolumn = "yes"

-- input/completion
set.completeopt = "menuone,noinsert,noselect"

-- treesitter fold
-- set.foldmethod = "expr"
-- set.foldexpr = "nvim_treesitter#foldexpr()"

-- KEYMAPPINGS SET__________
vim.g.mapleader = ' '

-- Telescope
key.set('n', '<Leader>ff', ':Telescope find_files<CR>')
key.set('n', '<Leader>fg', ':Telescope live_grep<CR>')
key.set('n', '<Leader>fb', ':Telescope buffers<CR>')

-- Window
key.set('n', '<Leader>vn', ':vnew <CR>')
key.set('n', '<Leader>hn', ':new <CR>')
key.set('n', '<Leader>v', ':vsplit <CR>')
key.set('n', '<Leader>h', ':split <CR>')
key.set('n', '<Leader>n', ':enew <CR>')
key.set('n', '<Leader>w', ':bd <CR>')
key.set('n', '<c-j>', '<c-w>j <CR>')
key.set('n', '<c-k>', '<c-w>k <CR>')
key.set('n', '<c-l>', '<c-w>l <CR>')
key.set('n', '<c-h>', '<c-w>h <CR>')

-- Files/buffers
key.set('n', '<Tab>', ':bnext <CR>')
key.set('n', '<S-Tab>', ':bprevious <CR>')

-- LSP
key.set('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
key.set('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
key.set('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
key.set('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')
key.set('n', 'gw', ':lua vim.lsp.buf.workspace_symbol()<CR>')
key.set('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
key.set('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
key.set('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
-- key.set('n', '<c-K>', ':lua vim.lsp.buf.signature_help()<CR>')
key.set('n', '<Leader>af', ':lua vim.lsp.buf.code_action()<CR>')
key.set('n', '<Leader>rn', ':lua vim.lsp.buf.rename()<CR>')

-- Autoclose
key.set('i', '(', '()<Left>')
key.set('i', '()', '()')
key.set('i', '(<BS>', '<NOP>')

key.set('i', '[', '[]<Left>')
key.set('i', '[]', '[]')
key.set('i', '[<BS>', '<NOP>')

key.set('i', '<', '<><Left>')
key.set('i', '<>', '<>')
key.set('i', '<<BS>', '<NOP>')

key.set('i', '{', '{}<Left>')
key.set('i', '{}', '{}<Left>')
key.set('i', '{<BS>', '<NOP>')
key.set('i', '{<CR>', '{<CR>}<C-o>O')

key.set('i', '\'', '\'\'<Left>')
key.set('i', '\'\'', '\'\'<Left>')
key.set('i', '\'<BS>', '<NOP>')

key.set('i', '"', '""<Left>')
key.set('i', '""', '""<Left>')
key.set('i', '"<BS>', '<NOP>')

key.set('i', '`', '``<Left>')
key.set('i', '``', '``<Left>')
key.set('i', '`<BS>', '<NOP>')

-- Indentation
key.set('n', '<c-]>', ':> <CR>')
key.set('n', '<c-[>', ':< <CR>')

-- Clipboard
key.set('n', '<Leader>yy', '"+yy')
key.set('v', '<Leader>y', '"+y')

-- PACKER SET__________
require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Colorscheme
    use 'joshdick/onedark.vim'
    use 'Mofiqul/dracula.nvim'
    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Commenting
    use '/terrortylor/nvim-comment'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    -- Autocomplete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'

    -- Telescope
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    -- Git Diff
    use {
      'lewis6991/gitsigns.nvim',
      -- tag = 'release' -- To use the latest release
    }

    -- Bufferline
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
end)


-- CONFIG SET__________
require('nvim_comment').setup()
require('gitsigns').setup()
require("bufferline").setup{}

-- Treesitter
local configs = require'nvim-treesitter.configs'
configs.setup {
    ensure_installed = {"rust", "javascript", "typescript", "go"},
    highlight = { -- enable highlighting
        enable = true, 
    },
    indent = {
        enable = true, -- default is disabled anyways
    },
}

-- LSP
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}
    server:setup(opts)
end)

-- Autocomplete
-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, {
            { name = 'buffer' },
        })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
            { name = 'buffer' },
        })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
            { name = 'cmdline' }
        })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = {'rust_analyzer', 'tsserver', 'gopls'}
for _, lsp in ipairs(servers) do
require('lspconfig')[lsp].setup {
    capabilities = capabilities
}
end
