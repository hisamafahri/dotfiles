local M = {}
local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")
local telescope_themes = require("telescope.themes")

function M.map(keys, func, mode)
  mode = mode or "n"
  vim.keymap.set(mode, keys, func)
end

-- LSP
M.map("gd", require("telescope.builtin").lsp_definitions)
M.map("gr", require("telescope.builtin").lsp_references)
M.map("gI", require("telescope.builtin").lsp_implementations)
M.map("<leader>D", require("telescope.builtin").lsp_type_definitions)
M.map("<F2>", vim.lsp.buf.rename)
M.map("<leader>ca", vim.lsp.buf.code_action, { "n", "x" })
M.map("gD", vim.lsp.buf.declaration)

-- Native
M.map("<Tab>", ":bn <CR>")
M.map("<S-Tab>", ":bp <CR>")
M.map("<leader>b", ":Neotree position=current reveal=true<CR>")

-- Window
M.map("<leader>w", ":bp|bd # <CR>")
M.map("<leader>q", ":bd! <CR>")
M.map(";", "<C-w><C-w>")
M.map("<leader>n", vim.cmd.enew)
M.map("<leader>N", vim.cmd.vnew)
M.map("<leader>v", vim.cmd.vsplit)
M.map("<leader>h", vim.cmd.split)

-- NOTE: Keep things in the middle
M.map("<C-d>", "<C-d>zz")
M.map("<C-u>", "<C-u>zz")
M.map("n", "nzzzv")
M.map("N", "Nzzzv")

-- Move Lines
M.map("J", ":m '>+1<CR>gv=gv", "v")
M.map("K", ":m '<-2<CR>gv=gv", "v")
M.map("<Tab>", ">gv", "v")
M.map("<S-Tab>", "<gv", "v")

-- Copy/Paste
M.map("<leader>y", [["+y]], { "n", "v" })
M.map("<leader>Y", [["+Y]])
M.map("<leader>P", [["_dP]], "x")

-- Diagnostics
M.map("]d", vim.diagnostic.goto_next)
M.map("[d", vim.diagnostic.goto_prev)
M.map("<leader>e", vim.diagnostic.open_float)

-- LSP
M.map("<leader>lr", ":LspRestart<CR>")

-- Search and Format
M.map("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
M.map("<esc>", ":noh <CR>")

-- map enter to ciw
M.map("<CR>", "ciw")
M.map("H", "^", { "n", "v" })
M.map("L", "$", { "n", "v" })

-- Git
M.map("<leader>gg", ":LazyGit <CR>")

-- General
M.map("<s-space>", "<space>", "t")
M.map("<leader>u", vim.cmd.UndotreeToggle)

-- Telescope
M.map("<leader>p", function()
  telescope_builtin.find_files(telescope_themes.get_ivy({}))
end)

M.map("<leader>f", function()
  telescope.extensions.live_grep_args.live_grep_args(
    telescope_themes.get_ivy({})
  )
end)

M.map("<leader>r", function()
  telescope_builtin.resume(telescope_themes.get_ivy({}))
end)

M.map("<leader><leader>", function()
  telescope_builtin.buffers(telescope_themes.get_ivy({}))
end)

return M
