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

      -- Ref: https://raw.githubusercontent.com/hisamafahri/dotfiles/a7df6a0d42c1425946e85b0f00094db1c7475440/nvim/lua/config/lspconfig.lua
      lspconfig.ts_ls.setup({
        on_attach = on_attach,
        init_options = {
          preferences = {
            importModuleSpecifier = "non-relative",
            importModuleSpecifierPreference = "non-relative",
          },
        },
      })
      lspconfig.jsonls.setup({})
      lspconfig.gopls.setup({
        settings = {
          gopls = {
            buildFlags = { "-tags=development" },
          },
        },
      })
    end,
  },
}
