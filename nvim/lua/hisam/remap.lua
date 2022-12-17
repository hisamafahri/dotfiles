vim.g.mapleader = " "

vim.keymap.set("n", "<leader>b", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.bd)
vim.keymap.set("n", "<leader>q", ":bd! <CR>")
vim.keymap.set("n", "<leader>n", vim.cmd.enew)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
