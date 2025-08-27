local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  s("meta", {
    t({ "#+TITLE: " }),
    i(1, "Title"),
    t({ "", "#+AUTHOR: Hisam Fahri<iam@hisamafahri.com>", "#+DATE: " }),
    f(function()
      return os.date("%Y-%m-%d")
    end),
    t({ "", "#+FILETAGS: ", "" }),
    i(2),
    t({ "", "" }),
  }),
  s("code", {
    t({ "#+BEGIN_SRC: " }),
    i(1, "language"),
    t({ "", "" }),
    i(2),
    t({ "", "#+END_SRC", "" }),
  }),
}
