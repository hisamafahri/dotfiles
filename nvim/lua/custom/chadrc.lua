-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.options = {
  user = function()
    vim.opt.relativenumber = true
  end,
}

M.plugins = {
  override = {
    ["NvChad/nvterm"] = {
      mappings = {
        new = {
          horizontal = "<C-`>",
          vertical = "<C-~>"
        }
     },
   }
 },
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },
}

M.ui = {
   theme = "radium",
}

return M
