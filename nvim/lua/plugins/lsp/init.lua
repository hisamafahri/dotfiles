return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile", "BufWritePre" },
    config = function()
      local lspconfig = require("lspconfig")
      local on_attach = require("plugins.lsp.keymaps").on_attach

      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            codeLens = { enable = true },
            completion = { callSnippet = "Replace" },
            doc = { privateName = { "^_" } },
            hint = {
              enable = true,
              setType = false,
              paramType = true,
              paramName = "Disable",
              semicolon = "Disable",
              arrayIndex = "Disable",
            },
          },
        },
      })

      -- Add more server setups as needed
      -- lspconfig.tsserver.setup({})
      -- lspconfig.jsonls.setup({})
    end,
  },
}
