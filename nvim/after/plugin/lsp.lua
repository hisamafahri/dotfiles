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
lsp.setup()


vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
})
