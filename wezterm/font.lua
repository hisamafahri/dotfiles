local wezterm = require("wezterm")
local M = {}

M.font = wezterm.font_with_fallback({
  {
    family = "Maple Mono NF",
    weight = "Regular",
  },
})

M.font_size = 15
M.font_rules = {
  -- Bold
  {
    intensity = "Bold",
    font = wezterm.font({
      family = "Maple Mono NF",
      weight = "Bold",
    }),
  },
  -- Italic
  {
    italic = true,
    font = wezterm.font({
      family = "Maple Mono NF",
      style = "Italic",
    }),
  },
  -- Bold Italic
  {
    italic = true,
    intensity = "Bold",
    font = wezterm.font({
      family = "Maple Mono NF",
      weight = "Bold",
      style = "Italic",
    }),
  },
}

return M
