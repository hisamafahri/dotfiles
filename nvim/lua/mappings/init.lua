local vim = vim
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local bufopts = { noremap = true, silent = true, buffer = bufnr }

-- Set <space> as a leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

map('n', '<leader>bb', ':NvimTreeToggle <CR>', opts) -- NvimTree
map('n', '<leader>bv', ':NvimTreeFocus <CR>', opts) -- NvimTree
map('n', '<leader>n', ':enew <CR>', opts) -- New buffer
map('n', '<leader>q', ':bd <CR>', opts) -- Close current buffer
map('n', '<leader>fq', ':bd! <CR>', opts) -- Force close current buffer
map('n', '<C-P>', ':Neoformat<CR>', opts) -- Prettier formatter
map('i', '<M-BS>', '<C-w>') -- Delete whole word

-- Move line
map('n', '<M-Up>', ':m .-2<CR>==')
map('n', '<M-Down>', ':m .+1<CR>==')
map('v', '<M-Up>', ':m \'<-2<CR>gv=gv')
map('v', '<M-Down>', ':m \'>+1<CR>gv=gv')

-- Split
map('n', '<leader>v', ':vnew <CR>', opts) -- New buffer
map('n', '<leader>h', ':new <CR>', opts) -- New buffer

-- Git DiffView
map('n', '<leader>go', ':DiffviewOpen <CR>', opts)
map('n', '<leader>gc', ':DiffviewClose <CR>', opts)

-- Copy/paste to/from system clipboard
map('v', '<leader>y', '"+y <CR>', opts) -- Yank to system clipboard
map('n', '<leader>p', '"+p <CR>', opts) -- Paste from system clipboard

-- Telescope
map('n', '<leader>sf', require('telescope.builtin').find_files, opts)
map('n', '<leader>sp', require('telescope.builtin').live_grep, opts)
map('n', '<leader><leader>', require('telescope.builtin').buffers, opts)

-- LSP
map('n', '<space>e', vim.diagnostic.open_float, opts)
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)
map('n', 'gD', vim.lsp.buf.declaration, bufopts)
map('n', 'gd', vim.lsp.buf.definition, bufopts)
map('n', 'gr', vim.lsp.buf.references, bufopts)
map('n', 'gi', vim.lsp.buf.implementation, bufopts)
map('n', 'K', vim.lsp.buf.hover, bufopts)
map('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
map('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
map('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
map('n', '<leader>f', vim.lsp.buf.formatting, bufopts)

-- Hop
map('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>", opts)
map('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>", opts)
map('n', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })<cr>", opts)
map('n', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })<cr>", opts)

-- LazyGit Terminal
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    float_opts = {
        border = 'curved'
    }
})

function _lazygit_toggle()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
