local lsp = require('lsp-zero')

lsp.preset('recommended')

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        },
    }
})
lsp.configure('cssls', {
    settings = {
        css = {
            lint = {
                unknownAtRules = 'ignore',
            },
        },
    }
})

lsp.configure('tailwindcss', {
    settings = {
        tailwindCSS = {
            experimental = {
                classRegex = {
                    "cva\\(([^)]*)\\)",
                    "[\"'`]([^\"'`]*).*?[\"'`]",
                },
            },
        },
    },
})

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'sumneko_lua'
})

local cmp = require('cmp')

lsp.setup_nvim_cmp({
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    })
})

lsp.setup()


vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
})
