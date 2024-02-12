local vim = vim

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local opts = { buffer = event.buf }

    -- these will be buffer-local keybindings
    -- because they only work if you have an active language server

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)

    -- NOTE: Rarely used
    -- vim.keymap.set(
    --   "n",
    --   "go",
    --   "<cmd>lua vim.lsp.buf.type_definition()<cr>",
    --   opts
    -- )
    -- vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
    -- vim.keymap.set(
    --   { "n", "x" },
    --   "<F3>",
    --   "<cmd>lua vim.lsp.buf.format({async = true})<cr>",
    --   opts
    -- )
  end,
})

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local default_setup = function(server)
  require("lspconfig")[server].setup({
    capabilities = lsp_capabilities,
  })
end

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = { "tsserver", "rust_analyzer", "gopls", "eslint" },
  handlers = {
    default_setup,
  },
})

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  sources = {
    -- { name = "path" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip", keyword_length = 2 },
    { name = "buffer", keyword_length = 3 },
  },
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ["<CR>"] = cmp.mapping.confirm({ select = false }),

    -- Ctrl+Space to trigger completion menu
    ["<C-Space>"] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
        -- this will auto complete if our cursor in next to a word and we press tab
        -- elseif has_words_before() then
        --     cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
})
