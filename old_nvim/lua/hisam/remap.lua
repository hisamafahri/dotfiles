local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")
local telescope_themes = require("telescope.themes")

-- Native
vim.keymap.set("n", "<Tab>", ":bn <CR>")
vim.keymap.set("n", "<S-Tab>", ":bp <CR>")
-- vim.keymap.set("n", "<leader>b", vim.cmd.Ex)
vim.keymap.set("n", "<leader>b", ":NvimTreeFocus<CR>")

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
-- vim.keymap.set("n", "j", "jzz")
-- vim.keymap.set("n", "k", "kzz")
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

-- Diagnostics
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

-- LSP
vim.keymap.set("n", "<leader>lr", ":LspRestart<CR>")

-- Search and Format
vim.keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]
)
vim.keymap.set("n", "<esc>", ":noh <CR>")

-- map enter to ciw
vim.keymap.set("n", "<CR>", "ciw")
vim.keymap.set({ "n", "v" }, "H", "^")
vim.keymap.set({ "n", "v" }, "L", "$")

-- Git
vim.keymap.set("n", "<leader>gg", ":LazyGit <CR>")

-- General
vim.keymap.set("t", "<s-space>", "<space>")
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Telescope
vim.keymap.set("n", "<leader>p", function()
  telescope_builtin.find_files(telescope_themes.get_ivy({}))
end, {})
vim.keymap.set("n", "<leader>f", function()
  telescope.extensions.live_grep_args.live_grep_args(
    telescope_themes.get_ivy({})
  )
end, {})
vim.keymap.set("n", "<leader>r", function()
  telescope_builtin.resume(telescope_themes.get_ivy({}))
end, {})
vim.keymap.set("n", "<leader><leader>", function()
  telescope_builtin.buffers(telescope_themes.get_ivy({}))
end, {})

vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)

-- Database
vim.keymap.set("n", "<leader>db", ":DBUI <CR>")

-- ## NOTE: Archive
-- Split line with X
-- vim.keymap.set("n", "X", ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>", { silent = true })

-- Nvim-tree ===========================================

-- local current_directory = os.getenv("PWD") or io.popen("cd"):read()
-- local nvim_tree_api = require("nvim-tree.api")

-- Explorer ===========================================
-- vim.keymap.set("n", "<leader>b", function()
--   if current_directory == "/Users/hisam/personal/db" then
--     vim.cmd("DBUI")
--   else
--     nvim_tree_api.tree.open()
--   end
-- end)

-- Fuzzy ===========================================
-- vim.keymap.set("n", "<leader>/", function()
--   -- You can pass additional configuration to telescope to change theme, layout, etc.
--   require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
--     -- winblend = 10,
--     previewer = false,
--   }))
-- end, { desc = "[/] Fuzzily search in current buffer" })

-- Git: conflict resolutions ===========================
-- vim.keymap.set("n", "<leader>gt", ":Git <CR>")
-- vim.keymap.set("n", "<leader>gd", ":DiffviewOpen <CR>")
-- vim.keymap.set("n", "<leader>gc", ":DiffviewClose <CR>")
-- vim.keymap.set("n", "gh", ":diffget //2<CR>")
-- vim.keymap.set("n", "gl", ":diffget //3<CR>")

-- Git: workspace =======================================
-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder)
-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder)
-- vim.keymap.set('n', '<space>wl', function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end)
-- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename)

-- Navigate tmux window ==============================
-- vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
-- vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
-- vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
-- vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
