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
  { import = "hisam.plugins.editor" },
  { import = "hisam.plugins.formatter" },
  { import = "hisam.plugins.git" },
  { import = "hisam.plugins.language" },
  { import = "hisam.plugins.lsp" },
  { import = "hisam.plugins.movement" },
  { import = "hisam.plugins.telescope" },
  { import = "hisam.plugins.themes" },
  { import = "hisam.plugins.treesitter" },
  { import = "hisam.plugins.ufo" },

  -- Experiments
  { dir = "~/projects/gdocs.nvim" },
})
