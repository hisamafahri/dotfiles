return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
      default_format_opts = {
        timeout_ms = 3000,
        async = false,
        quiet = false,
        lsp_format = "fallback",
      },
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
      formatters = {
        injected = { options = { ignore_errors = true } },
      },
    },
    config = function(_, opts)
      require("conform").setup(opts)
    end,
  },
}
