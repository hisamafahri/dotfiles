local remap = require("config.remap")
local map = remap.map
local M = {}
local vim = vim

function M.lspconfig()
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup(
      "kickstart-lsp-attach",
      { clear = true }
    ),
    callback = function(event)
      local client = vim.lsp.get_client_by_id(event.data.client_id)

      map("<M-S-o>", function()
        require("conform").format({
          async = true,
          lsp_fallback = true,
          bufnr = event.buf,
        })
      end, { desc = "Format buffer" })

      if
        client
        and client.supports_method(
          vim.lsp.protocol.Methods.textDocument_documentHighlight
        )
      then
        local highlight_augroup = vim.api.nvim_create_augroup(
          "kickstart-lsp-highlight",
          { clear = false }
        )
        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
          buffer = event.buf,
          group = highlight_augroup,
          callback = vim.lsp.buf.clear_references,
        })

        vim.api.nvim_create_autocmd("LspDetach", {
          group = vim.api.nvim_create_augroup(
            "kickstart-lsp-detach",
            { clear = true }
          ),
          callback = function(event2)
            vim.lsp.buf.clear_references()
            vim.api.nvim_clear_autocmds({
              group = "kickstart-lsp-highlight",
              buffer = event2.buf,
            })
          end,
        })
      end

      if
        client
        and client.supports_method(
          vim.lsp.protocol.Methods.textDocument_inlayHint
        )
      then
        map("<leader>th", function()
          vim.lsp.inlay_hint.enable(
            not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })
          )
        end)
      end
    end,
  })

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = vim.tbl_deep_extend(
    "force",
    capabilities,
    require("cmp_nvim_lsp").default_capabilities()
  )

  local servers = {
    clangd = {},
    jsonls = {},
    tailwindcss = {},
    prismals = {},
    ts_ls = {
      init_options = {
        preferences = {
          importModuleSpecifier = "non-relative",
          importModuleSpecifierPreference = "non-relative",
        },
      },
    },
    pylsp = {},
    gopls = {
      settings = {
        gopls = {
          buildFlags = { "-tags=development" },
        },
      },
    },

    lua_ls = {
      settings = {
        Lua = {
          completion = { callSnippet = "Replace" },
          diagnostics = {
            globals = { "vim", "require" },
          },
        },
      },
    },

    -- gleam = {
    --   cmd = { "gleam", "lsp" },
    -- },
  }

  local ensure_installed = vim.tbl_keys(servers or {})
  vim.list_extend(ensure_installed, {
    "stylua", -- Used to format Lua code
  })
  require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

  require("mason-lspconfig").setup({
    handlers = {
      function(server_name)
        local server = servers[server_name] or {}
        server.capabilities = vim.tbl_deep_extend(
          "force",
          {},
          capabilities,
          server.capabilities or {}
        )
        require("lspconfig")[server_name].setup(server)
      end,
    },
  })
end

return M
