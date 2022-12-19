vim.g.mapleader = " "

vim.keymap.set("n", "<leader>b", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.bd)
vim.keymap.set("n", "<leader>q", ":bd! <CR>")
vim.keymap.set("n", "<Tab>", "<C-W><C-W>")
vim.keymap.set("n", "<leader>n", vim.cmd.enew)
vim.keymap.set("n", "<leader>N", vim.cmd.vnew)
vim.keymap.set("n", "<leader>v", vim.cmd.vsplit)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "Ï", ":Neoformat <CR>")
