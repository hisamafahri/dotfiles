-- Keymaps configuration
local M = {}

-- Helper
function M.map(keys, func, mode)
  mode = mode or "n"
  vim.keymap.set(mode, keys, func)
end

-- === Plugin Requires ===
local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")
local telescope_themes = require("telescope.themes")

-- === LSP Keymaps ===
M.map("gd", telescope_builtin.lsp_definitions)
M.map("gr", telescope_builtin.lsp_references)
M.map("gI", telescope_builtin.lsp_implementations)
M.map("<leader>D", telescope_builtin.lsp_type_definitions)
M.map("<F2>", vim.lsp.buf.rename)
M.map("<leader>ca", vim.lsp.buf.code_action, { "n", "x" })
M.map("gD", vim.lsp.buf.declaration)
M.map("]d", vim.diagnostic.goto_next)
M.map("[d", vim.diagnostic.goto_prev)
M.map("<leader>e", vim.diagnostic.open_float)
M.map("<leader>lr", ":LspRestart<CR>")

-- === Formatting ===
M.map("Ø", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { "n", "x" })

-- === Window/Buffer Management ===
M.map("<Tab>", ":bn <CR>")
M.map("<S-Tab>", ":bp <CR>")
M.map("<leader>b", ":Neotree focus reveal=true<CR>")
M.map("<leader>w", ":bp|bd # <CR>")
M.map("<leader>q", ":bd! <CR>")
M.map(";", "<C-w><C-w>")
M.map("<leader>n", vim.cmd.enew)
M.map("<leader>N", vim.cmd.vnew)
M.map("<leader>v", vim.cmd.vsplit)
M.map("<leader>h", vim.cmd.split)

-- === Navigation Enhancements ===
M.map("<C-d>", "<C-d>zz")
M.map("<C-u>", "<C-u>zz")
M.map("n", "nzzzv")
M.map("N", "Nzzzv")
M.map("H", "^", { "n", "v" })
M.map("L", "$", { "n", "v" })

-- === Move Lines (Visual Mode) ===
M.map("J", ":m '>+1<CR>gv=gv", "v")
M.map("K", ":m '<-2<CR>gv=gv", "v")
M.map("<Tab>", ">gv", "v")
M.map("<S-Tab>", "<gv", "v")

-- === Copy/Paste ===
M.map("<leader>y", [["+y]], { "n", "v" })
M.map("<leader>Y", [["+Y]])
M.map("<leader>P", [["_dP]], "x")

-- Copy file path with line numbers to clipboard (Visual mode)
local copy_path_with_lines = function()
  local start_line = vim.fn.line("v")
  local end_line = vim.fn.line(".")

  -- Ensure start_line <= end_line
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end

  -- Get file path relative to project root
  local filepath = vim.fn.expand("%:p")
  local root = vim.fn.getcwd()
  local relative_path = vim.fn.fnamemodify(filepath, ":~:.")

  -- If path starts with root, make it relative
  if filepath:find(root, 1, true) == 1 then
    relative_path = filepath:sub(#root + 2) -- +2 to skip the trailing slash
  end

  -- Format: @path L123-L456 or @path L123 (for single line)
  local result
  if start_line == end_line then
    result = string.format("@%s L%d", relative_path, start_line)
  else
    result = string.format("@%s L%d-L%d", relative_path, start_line, end_line)
  end

  -- Copy to system clipboard
  vim.fn.setreg("+", result)
  print("Copied: " .. result)

  -- Exit visual mode
  vim.cmd("normal! gv")
  vim.api.nvim_feedkeys(
    vim.api.nvim_replace_termcodes("<Esc>", true, false, true),
    "n",
    false
  )
end

M.map("<leader>l", copy_path_with_lines, "v")
M.map("?", copy_path_with_lines, "v")

-- === Search/Replace & Misc ===
M.map("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
M.map("<esc>", ":noh <CR>")
M.map("<CR>", "ciw")

-- === General Utilities ===
M.map("<s-space>", "<space>", "t")
M.map("<leader>an", ":Archive new<CR>")

-- === Telescope ===
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

-- === hop.nvim ===
local hop = require("hop")
local directions = require("hop.hint").HintDirection

M.map("s", function()
  hop.hint_char1({
    direction = directions.AFTER_CURSOR,
    current_line_only = false,
  })
end, { "n", "x", "o" })

M.map("S", function()
  hop.hint_char1({
    direction = directions.BEFORE_CURSOR,
    current_line_only = false,
  })
end, { "n", "x", "o" })
-- M.map("s", "<Plug>(leap)", { "n", "x", "o" })
-- M.map("S", "<Plug>(leap-from-window)", { "n" })

return M
