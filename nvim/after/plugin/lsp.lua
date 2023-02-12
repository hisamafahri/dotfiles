local lsp = require("lsp-zero")
local ok_cmp, cmp = pcall(require, "cmp")
local select_opts = {behavior = "select"}
local util = require "lspconfig.util"
local s = {}

if ok_cmp then
    select_opts = {behavior = cmp.SelectBehavior.Select}
end

lsp.preset("recommended")

-- Fix Undefined global "vim"
lsp.configure("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        },
    }
})
lsp.configure("cssls", {
    settings = {
        css = {
            lint = {
                unknownAtRules = "ignore",
            },
        },
    }
})

lsp.configure("tailwindcss", {
    settings = {
        tailwindCSS = {
            experimental = {
                classRegex = {
                    "cva\\(([^)]*)\\)",
                    "[\"'`]([^\"'`]*).*?[\"'`]",
                },
            },
        },
    },
})

local cmd = (
vim.fn.has "win32" == 1 and { "cmd.exe", "/C", "dart", "language-server", "--protocol=lsp" }
or { "dart", "language-server", "--protocol=lsp" }
)

lsp.configure("dartls", {
    cmd = cmd,
    filetypes = { "dart" },
    root_dir = util.root_pattern "pubspec.yaml",
    init_options = {
        onlyAnalyzeProjectsWithOpenFiles = true,
        suggestFromUnimportedLibraries = true,
        closingLabels = true,
        outline = true,
        flutterOutline = true,
    },
    settings = {
        dart = {
            completeFunctionCalls = true,
            showTodos = true,
        },
    },
    docs = {
        description = [[
        https://github.com/dart-lang/sdk/tree/master/pkg/analysis_server/tool/lsp_spec
        Language server for dart.
        ]],
        default_config = {
            root_dir = [[root_pattern("pubspec.yaml")]],
        },
    },
})

lsp.ensure_installed({
    "tsserver",
    "eslint",
    "lua_ls",
})

lsp.setup_nvim_cmp({
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }),
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        -- confirm selection
        ["<CR>"] = cmp.mapping.confirm({select = false}),
        ["<C-y>"] = cmp.mapping.confirm({select = false}),

        -- navigate items on the list
        ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
        ["<Down>"] = cmp.mapping.select_next_item(select_opts),
        ["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
        ["<C-n>"] = cmp.mapping.select_next_item(select_opts),

        -- toggle completion
        ["<C-e>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.abort()
            else
                cmp.complete()
            end
        end),

        -- when menu is visible, navigate to next item
        -- when line is empty, insert a tab character
        -- else, activate completion
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item(select_opts)
            elseif s.check_back_space() then
                fallback()
            else
                cmp.complete()
            end
        end, {"i", "s"}),

        -- when menu is visible, navigate to previous item on list
        -- else, revert to default behavior
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item(select_opts)
            else
                fallback()
            end
        end, {"i", "s"}),
    })
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
})
