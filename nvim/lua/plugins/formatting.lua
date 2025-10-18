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
        css = { "biome", "biome-organize-imports" },
        graphql = { "biome", "biome-organize-imports" },
        javascript = { "biome", "biome-organize-imports" },
        javascriptreact = { "biome", "biome-organize-imports" },
        json = { "biome", "biome-organize-imports" },
        lua = { "stylua" },
        odin = { "odinfmt" },
        python = { "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
        svelte = { "prettier" },
        typescript = { "biome", "biome-organize-imports" },
        typescriptreact = { "biome", "biome-organize-imports" },
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
