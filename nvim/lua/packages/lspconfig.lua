local config = require("config.lspconfig")

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Useful status updates for LSP.
      { "j-hui/fidget.nvim", opts = {} },

      -- Allows extra capabilities provided by nvim-cmp
      { "hrsh7th/cmp-nvim-lsp" },
    },
    config = config.lspconfig,
  },
}
