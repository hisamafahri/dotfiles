-- example file i.e lua/custom/init.lua

-- MAPPINGS
local map = nvchad.map

map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")
map("n", "<C-P>", "gg=G <CR>")

map("n", "<leader>vn", ":vnew <CR>")
map("n", "<leader>hn", ":new <CR>")

map("n", "<leader>v", ":vsplit <CR>")
map("n", "<leader>h", ":split <CR>")
-- require("my autocmds file") or just declare them here
