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
        css = { "prettier" },
        go = { "gofumpt" },
        graphql = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        json = { "prettier" },
        lua = { "stylua" },
        odin = { "odinfmt" },
        python = { "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
        svelte = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
      },
      formatters = {
        injected = { options = { ignore_errors = true } },
        odinfmt = {
          command = "odinfmt",
          args = { "-stdin" },
          stdin = true,
        },
      },
    },
    config = function(_, opts)
      require("conform").setup(opts)
    end,
  },
}
