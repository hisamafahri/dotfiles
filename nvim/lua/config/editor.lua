require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    rust = { "rustfmt", lsp_format = "fallback" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    graphql = { "prettier" },
    json = { "prettier" },
    css = { "prettier" },
  },
})
