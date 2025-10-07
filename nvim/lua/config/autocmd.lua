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

vim.api.nvim_create_user_command("Code", function()
  local filepath = vim.api.nvim_buf_get_name(0)
  if filepath == "" then
    print("No file in current buffer")
    return
  end
  -- Open the file with VS Code
  vim.fn.system({ "code", filepath })
end, {})

-- NOTE: it messed up the got to line in telescope
-- open neotree on startup
--
-- vim.api.nvim_create_autocmd("VimEnter", {
--   command = "set nornu nonu | Neotree toggle",
-- })
-- vim.api.nvim_create_autocmd("BufEnter", {
--   command = "set rnu nu",
-- })
