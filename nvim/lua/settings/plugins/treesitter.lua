require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { 
      "go",
      "lua",
      "rust",
      "typescript",
      "javascript",
      "html",
      "dockerfile",
      "json",
      "markdown",
      "prisma",
      "yaml"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    -- `false` will disable the whole extension
    enable = true
  },
}
