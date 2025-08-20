require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    rust = { "rustfmt", lsp_format = "fallback" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    graphql = { "prettier" },
    json = { "prettier" },
    css = { "prettier" },
  },
})

vim.api.nvim_create_user_command("Path", function()
  local cwd = vim.fn.getcwd()
  local bufname = vim.api.nvim_buf_get_name(0)
  print(cwd .. "/" .. vim.fn.fnamemodify(bufname, ":t"))
end, {})

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "auto",
  },
})
