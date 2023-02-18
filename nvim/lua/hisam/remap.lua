vim.g.mapleader = " "

-- Explorer
vim.keymap.set("n", "<leader>b", vim.cmd.Ex)
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext <CR>")
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev <CR>")

-- Window
vim.keymap.set("n", "<leader>w", ":bp|bd # <CR>")
vim.keymap.set("n", "<leader>q", ":bd! <CR>")
vim.keymap.set("n", "<C-Tab>", "<C-W><C-W>")
vim.keymap.set("n", "<leader>n", vim.cmd.enew)
vim.keymap.set("n", "<leader>N", vim.cmd.vnew)
vim.keymap.set("n", "<leader>v", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>h", vim.cmd.split)
-- NOTE: Keep things in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
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
vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition)
-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder)
-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder)
-- vim.keymap.set('n', '<space>wl', function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end)
-- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename)

-- Search and Format
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "Ï", ":Neoformat <CR>")

-- Debugging
vim.keymap.set("n", "<F9>", ":lua require'dap'.toggle_breakpoint() <CR>")
vim.keymap.set("n", "<F5>", ":lua require'dap'.continue() <CR>")
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over() <CR>")
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_over() <CR>")
vim.keymap.set("n", "<leader>d", function () require("dapui").toggle() end)

-- Git
vim.keymap.set("n", "<leader>gt", ":Git <CR>")
vim.keymap.set("n", "<leader>gg", ":LazyGit <CR>")
vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit! <CR>")

-- Terminal
vim.keymap.set("t", "<s-space>", "<space>")
