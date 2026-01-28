return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      -- Recommended for `ask()` and `select()`.
      -- Required for `snacks` provider.
      ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
      {
        "folke/snacks.nvim",
        opts = { input = {}, picker = {}, terminal = {} },
      },
    },
    config = function()
      -- Required for `opts.events.reload`.
      vim.o.autoread = true

      vim.keymap.set({ "n", "x" }, "?", function()
        require("opencode").ask("@this: ", { submit = true })
      end, { desc = "Ask opencode…" })
    end,
  },
  {
    "github/copilot.vim",
  },
}
