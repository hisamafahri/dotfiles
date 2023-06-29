local vim = vim;
local telescope = require("telescope")
local builtin = require("telescope.builtin")

-- Explorer
vim.keymap.set("n", "<leader>b", ":NvimTreeFocus <CR>")
-- vim.keymap.set("n", "<leader>b", vim.cmd.Ex)
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext <CR>")
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev <CR>")

-- Window
vim.keymap.set("n", "<leader>w", ":bp|bd # <CR>")
vim.keymap.set("n", "<leader>q", ":bd! <CR>")
vim.keymap.set("n", ";", "<C-w><C-w>")
vim.keymap.set("n", "<leader>n", vim.cmd.enew)
vim.keymap.set("n", "<leader>N", vim.cmd.vnew)
vim.keymap.set("n", "<leader>v", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>h", vim.cmd.split)
-- NOTE: Keep things in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "k", "kzz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move Lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- Copy/Paste
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("x", "<leader>P", [["_dP]])

-- LSP
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition)
vim.keymap.set('n', '<F2>', vim.lsp.buf.rename)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder)
-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder)
-- vim.keymap.set('n', '<space>wl', function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end)
-- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename)

-- Search and Format
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<A-S-f>", ":Neoformat <CR>")

-- map enter to ciw
vim.keymap.set("n", "<CR>", "ciw")

-- Debugging & Errors
vim.keymap.set("n", "<leader>db", function () require('dap').toggle_breakpoint() end)
vim.keymap.set("n", "<leader>dc", function () require('dap').continue() end)
vim.keymap.set("n", "<leader>do", function () require('dap').step_over() end)
vim.keymap.set("n", "<leader>di", function () require('dap').step_into() end)
vim.keymap.set("n", "<leader>dd", function () require("dapui").toggle() end)
vim.keymap.set("n", "<leader>dr", function () require ('dapui').open({ reset = true }) end)
vim.keymap.set("n", "<leader>x", ":TroubleToggle<CR>")

-- Git
-- vim.keymap.set("n", "<leader>gt", ":Git <CR>")
vim.keymap.set("n", "<leader>gg", ":LazyGit <CR>")
vim.keymap.set("n", "<leader>gd", ":DiffviewOpen <CR>")
vim.keymap.set("n", "<leader>gc", ":DiffviewClose <CR>")
-- vim.keymap.set("n", "gh", ":diffget //2<CR>")
-- vim.keymap.set("n", "gl", ":diffget //3<CR>")

-- General
vim.keymap.set("t", "<s-space>", "<space>")
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Telescope
vim.keymap.set("n", "<leader>p", builtin.find_files, {})
vim.keymap.set("n", "<leader>r", builtin.resume, {})
vim.keymap.set("n", "<leader>f", telescope.extensions.live_grep_args.live_grep_args, {})
vim.keymap.set("n", "<leader><leader>", builtin.buffers, {})
vim.keymap.set("n", "<leader>o", function() require("telescope").extensions.opener.opener {
    hidden=false,
    respect_gitignore=true,
    root_dir="~/work",
} end, {})

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
