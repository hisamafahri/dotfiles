local M = {}

M._keys = nil

local lsp_keymaps = {
  {
    "<leader>cl",
    function()
      vim.cmd("LspInfo")
    end,
    desc = "Lsp Info",
  },
  { "gd", vim.lsp.buf.definition, desc = "Goto Definition" },
  { "gr", vim.lsp.buf.references, desc = "References" },
  { "gI", vim.lsp.buf.implementation, desc = "Goto Implementation" },
  { "gy", vim.lsp.buf.type_definition, desc = "Goto Type Definition" },
  { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
  { "K", vim.lsp.buf.hover, desc = "Hover" },
  { "gK", vim.lsp.buf.signature_help, desc = "Signature Help" },
  { "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help" },
  {
    "<leader>ca",
    vim.lsp.buf.code_action,
    desc = "Code Action",
    mode = { "n", "v" },
  },
  { "<leader>cr", vim.lsp.buf.rename, desc = "Rename" },
}

function M.on_attach(_, bufnr)
  for _, map in ipairs(lsp_keymaps) do
    local mode = map.mode or "n"
    local opts = { buffer = bufnr, desc = map.desc, silent = true }
    vim.keymap.set(mode, map[1], map[2], opts)
  end
end

return M
