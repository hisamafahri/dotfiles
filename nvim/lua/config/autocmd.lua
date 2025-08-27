-- Prevent continue comment on new line
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "*",
--   command = [[setlocal formatoptions-=c formatoptions-=r formatoptions-=o]],
-- })

-- Only map <CR> to 'ciw' in normal mode if not in 'qf' filetype
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype ~= "qf" then
      vim.keymap.set("n", "<CR>", "ciw", { buffer = true })
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "org",
  callback = function()
    -- Map the literal sequence to open_at_point
    -- See terminal config
    vim.keymap.set("", "<<<ORG_OPEN_AT_POINT>>>", function()
      require("orgmode").action("org_mappings.open_at_point")
    end, { buffer = true, noremap = true, silent = true })
  end,
})
