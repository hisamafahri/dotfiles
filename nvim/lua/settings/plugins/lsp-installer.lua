local servers = {
    "cssls",
    "dockerls",
    "gopls",
    "html",
    "jsonls",
    "tsserver",
    "sumneko_lua",
    "marksman",
    "prismals",
    "rust_analyzer",
    "tailwindcss",
    "yamlls"
}

require("nvim-lsp-installer").setup {
    ensure_installed = servers,
    automatic_installation = true,
}

local lspconfig = require 'lspconfig'
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end
