local config = require("config.lspconfig")

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      -- Mason must be loaded before its dependents so we need to set it up here.
      -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
      { "williamboman/mason.nvim", opts = {}, tag = "v1.11.0" },
      { "williamboman/mason-lspconfig.nvim", tag = "v1.32.0" },
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },

      -- Useful status updates for LSP.
      { "j-hui/fidget.nvim", opts = {} },

      -- Allows extra capabilities provided by nvim-cmp
      { "hrsh7th/cmp-nvim-lsp" },
    },
    config = config.lspconfig,
  },
}
