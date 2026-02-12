-- Ref: https://raw.githubusercontent.com/hisamafahri/dotfiles/61cefc714fa07b89b725da49605e82be43eaa4f4/nvim/lua/plugins/notes.lua
return {
  {
    dir = "~/sandbox/archive.nvim",
    -- "hisamafahri/archive.nvim",
    name = "archive.nvim",
    config = function()
      require("archive").setup({
        workspace = "~/notes/",
        backlinks = {
          enabled = true,
          virtual_text = true,
        },
      })
    end,
  },
}
