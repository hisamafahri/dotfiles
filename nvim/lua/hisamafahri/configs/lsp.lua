local cmp = require("cmp")
local lsp_zero = require("lsp-zero")
local lspconfig = require("lspconfig")

local lsp = lsp_zero.preset({})
local cmp_action = lsp_zero.cmp_action()

lsp.setup()
lspconfig.lua_ls.setup({})

cmp.setup({
  -- sources = {
  --   { name = "nvim_lsp" },
  -- },
  -- snippet = {
  --   expand = function(args)
  --     require("luasnip").lsp_expand(args.body)
  --   end,
  -- },
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ["<CR>"] = cmp.mapping.confirm({ select = false }),

    -- Ctrl+Space to trigger completion menu
    ["<C-Space>"] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ["<C-f>"] = cmp_action.luasnip_jump_forward(),
    ["<C-b>"] = cmp_action.luasnip_jump_backward(),
    ["<Tab>"] = cmp_action.luasnip_supertab(),
    ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
  }),
})
