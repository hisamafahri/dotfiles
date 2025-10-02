return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile", "BufWritePre" },
    config = function()
      local on_attach = require("plugins.lsp.keymaps").on_attach

      vim.lsp.config("lua_ls", {
        on_attach = on_attach,
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            codeLens = { config = true },
            completion = { callSnippet = "Replace" },
            doc = { privateName = { "^_" } },
            hint = {
              config = true,
              setType = false,
              paramType = true,
              paramName = "Disable",
              semicolon = "Disable",
              arrayIndex = "Disable",
            },
          },
        },
      })

      vim.lsp.config("elixirls", {})
      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            buildFlags = { "-tags=development" },
          },
        },
      })
      vim.lsp.config("eslint", {})
      vim.lsp.config("jsonls", {})
      vim.lsp.config("prismals", {})
      vim.lsp.config("tailwindcss", {})
      vim.lsp.config("ts_ls", {
        on_attach = on_attach,
        init_options = {
          preferences = {
            importModuleSpecifier = "non-relative",
            importModuleSpecifierPreference = "non-relative",
          },
        },
        settings = {
          typescript = {
            preferences = {
              importModuleSpecifier = "non-relative",
              importModuleSpecifierPreference = "non-relative",
            },
          },
        },
      })
    end,
  },
}
