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

      vim.lsp.config("basedpyright", {})
      vim.lsp.config("elixirls", {})
      vim.lsp.config("gopls", {
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        handlers = {
          ["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
            -- Filter out "interface{} can be replaced by any" diagnostic
            -- gopls doesn't respect analyses.useany=false, so we filter client-side
            if result and result.diagnostics then
              result.diagnostics = vim.tbl_filter(function(diagnostic)
                return not (diagnostic.message and diagnostic.message:match("interface.*can be replaced by any"))
              end, result.diagnostics)
            end
            vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
          end,
        },
        settings = {
          gopls = {
            buildFlags = { "-tags=development" },
          },
        },
      })
      vim.lsp.config("dartls", {})
      vim.lsp.config("eslint", {})
      vim.lsp.config("jsonls", {})
      vim.lsp.config("ols", {})
      vim.lsp.config("prismals", {})
      vim.lsp.config("sqls", {
        filetypes = { "sql", "mysql", "postgresql", "sqlite" },
      })
      vim.lsp.config("svelte", {})
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
