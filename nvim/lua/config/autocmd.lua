-- autocommands
local notes_dir = vim.fn.expand("~") .. "/notes"
if vim.loop.cwd() == notes_dir then
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
      vim.keymap.set("", "<<<ORG_OPEN_AT_POINT>>>", function()
        vim.cmd("Archive go_to_link")
      end, { buffer = true, noremap = true, silent = true })
    end,
  })
end

-- open neotree on startup
vim.api.nvim_create_autocmd("VimEnter", {
  command = "set nornu nonu | Neotree toggle",
})
vim.api.nvim_create_autocmd("BufEnter", {
  command = "set rnu nu",
})
