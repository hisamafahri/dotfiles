-- autocommands
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- Map the literal sequence to open_at_point.
    -- See terminal config for more info
    vim.keymap.set("", "<<<ORG_OPEN_AT_POINT>>>", function()
      vim.cmd("Archive go_to_link")
    end, { buffer = true, noremap = true, silent = true })
  end,
})

-- open neotree on startup
vim.api.nvim_create_autocmd("VimEnter", {
  command = "set nornu nonu | Neotree toggle",
})
vim.api.nvim_create_autocmd("BufEnter", {
  command = "set rnu nu",
})
