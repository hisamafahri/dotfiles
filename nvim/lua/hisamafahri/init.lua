require("hisamafahri/vim")

local vim = vim

vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "hisamafahri.plugins.editor" },
  { import = "hisamafahri.plugins.git" },
  { import = "hisamafahri.plugins.language" },
  { import = "hisamafahri.plugins.lsp" },
  { import = "hisamafahri.plugins.telescope" },
  { import = "hisamafahri.plugins.themes" },
  { import = "hisamafahri.plugins.treesitter" },

  -- Experiments
  { dir = "~/projects/gdocs.nvim" },
})

require("hisamafahri/remap")