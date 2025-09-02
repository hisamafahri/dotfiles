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
  sections = {
    lualine_c = {
      {
        "filename",
        file_status = true,
        path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
      },
    },
  },
})

require("orgmode").setup({
  org_agenda_files = "~/notes/**/*",
  org_default_notes_file = "~/notes/inbox.org",
  org_startup_folded = "content",
  org_capture_templates = {
    t = {
      description = "Todo",
      template = "* TODO %?\n  %u",
      target = "~/notes/inbox.org",
    },
  },
})
