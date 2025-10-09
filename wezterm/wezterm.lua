-- ~/.config/wezterm/wezterm.lua

local wezterm = require("wezterm")
local config = wezterm.config_builder()
local keybindings = require("keybindings")
local font = require("font")

-- ┏━━━━━━━━━━━━━━━━┓
-- ┃ Base Config    ┃
-- ┗━━━━━━━━━━━━━━━━┛

-- ┏━━━━━━━━━━━┓
-- ┃ UI Config ┃
-- ┗━━━━━━━━━━━┛
config.font = font.font
config.font_size = font.font_size
config.font_rules = font.font_rules

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end

  return "Dark"
end

if get_appearance():find("Dark") then
  config.color_scheme = "GruvboxDarkHard"
  config.colors = {
    background = "#1d2021",
    -- tab
    tab_bar = {
      inactive_tab_edge = "#1d2021",
      inactive_tab = {
        bg_color = "#1d2021",
        fg_color = "#808080",
      },
    },
  }
  -- tab bar
  config.window_frame = {
    font = wezterm.font { family = "Maple Mono NF", weight = "Bold" },
    font_size = 15.0,
    active_titlebar_bg = "#1d2021",
    inactive_titlebar_bg = "#1d2021",
  }
else
  config.color_scheme = "GruvboxLight"
  config.colors = {
    background = "#f9f5d7",
    -- tab
    tab_bar = {
      inactive_tab_edge = "#f9f5d7",
      inactive_tab = {
        bg_color = "#f9f5d7",
        fg_color = "#808080",
      },
      active_tab = {
        bg_color = "#F1DFB2",
        fg_color = "#533726",
      },
    },
  }
  -- tab bar
  config.window_frame = {
    font = wezterm.font { family = "Maple Mono NF", weight = "Bold" },
    font_size = 15.0,
    active_titlebar_bg = "#f9f5d7",
    inactive_titlebar_bg = "#f9f5d7",
  }
end

-- ┏━━━━━━━━━━━━━━━┓
-- ┃ Window Config ┃
-- ┗━━━━━━━━━━━━━━━┛
config.window_padding = {
  left = 20,
  right = 20,
  top = 0,
  bottom = 20,
}

config.show_new_tab_button_in_tab_bar = false

config.window_decorations = "RESIZE"
config.send_composed_key_when_left_alt_is_pressed = true
config.enable_tab_bar = true
-- config.window_background_opacity = 0.8
-- config.macos_window_background_blur = 20

-- ┏━━━━━━━━━━━━━━━━━━┓
-- ┃ Scrolling Config ┃
-- ┗━━━━━━━━━━━━━━━━━━┛
config.scrollback_lines = 50000

-- ┏━━━━━━━━━━━━━━━━━┓
-- ┃ Terminal Config ┃
-- ┗━━━━━━━━━━━━━━━━━┛
config.enable_csi_u_key_encoding = true
config.default_prog = { "/bin/zsh" }

-- ┏━━━━━━━━━━━━━━━━━━━━┓
-- ┃ Keyboard Bindings  ┃
-- ┗━━━━━━━━━━━━━━━━━━━━┛
config.keys = keybindings

return config
