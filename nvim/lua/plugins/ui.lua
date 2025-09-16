return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = function()
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
    end,
  },
}
