local wezterm = require("wezterm")
local M = {}

local family = "Comic Mono"

M.default_font = wezterm.font({ family = family, weight = "Regular" })

M.font = wezterm.font_with_fallback({
  {
    family = family,
    weight = "Regular",
  },
})

M.font_size = 15
M.font_rules = {
  -- Bold
  {
    intensity = "Bold",
    font = wezterm.font({
      family = family,
      weight = "Bold",
    }),
  },
  -- Italic
  {
    italic = true,
    font = wezterm.font({
      family = family,
      style = "Italic",
    }),
  },
  -- Bold Italic
  {
    italic = true,
    intensity = "Bold",
    font = wezterm.font({
      family = family,
      weight = "Bold",
      style = "Italic",
    }),
  },
}

return M
