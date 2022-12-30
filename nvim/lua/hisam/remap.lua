vim.g.mapleader = " "

-- Explorer
vim.keymap.set("n", "<leader>b", vim.cmd.Ex)

-- Window
vim.keymap.set("n", "<leader>w", vim.cmd.bd)
vim.keymap.set("n", "<leader>q", ":bd! <CR>")
vim.keymap.set("n", "<Tab>", "<C-W><C-W>")
vim.keymap.set("n", "<leader>n", vim.cmd.enew)
vim.keymap.set("n", "<leader>N", vim.cmd.vnew)
vim.keymap.set("n", "<leader>v", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>h", vim.cmd.split)

-- Move Lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Copy/Paste
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Diagnostic
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

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
vim.keymap.set("n", "<leader>gg", ":Git <CR>")
vim.keymap.set("n", "<leader>gd", ":Gdiffsplit <CR>")
