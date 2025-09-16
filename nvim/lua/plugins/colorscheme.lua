return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = function()
      require("gruvbox").setup({
        contrast = "hard",
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },
}
