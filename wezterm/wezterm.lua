-- ~/.config/wezterm/wezterm.lua

local wezterm = require("wezterm")
local config = wezterm.config_builder()
local font = require("font")
local keybindings = require("keybindings")
local color = require("color")

-- ┏━━━━━━━━━━━━━━━━┓
-- ┃ Base Config    ┃
-- ┗━━━━━━━━━━━━━━━━┛

-- ┏━━━━━━━━━━━━━━━━┓
-- ┃ Plugins        ┃
-- ┗━━━━━━━━━━━━━━━━┛
local workspace_plugin =
  wezterm.plugin.require("/Users/hisam/app/smart_workspace_switcher.wezterm")
workspace_plugin.apply_to_config(config)
config.default_workspace = "config"

-- ┏━━━━━━━━━━━┓
-- ┃ UI Config ┃
-- ┗━━━━━━━━━━━┛
config.font = font.font
config.font_size = font.font_size
config.font_rules = font.font_rules

config.color_scheme = "GruvboxDarkHard"
config.colors = {
  background = color.bg_color,
  -- tab
  tab_bar = {
    inactive_tab_edge = color.bg_color,
    inactive_tab = {
      bg_color = color.bg_color,
      fg_color = color.fg_color,
    },
  },
}
-- tab bar
config.window_frame = {
  font = font.default_font,
  font_size = font.font_size,
  active_titlebar_bg = color.bg_color,
  inactive_titlebar_bg = color.bg_color,
}

-- ┏━━━━━━━━━━━━━━━┓
-- ┃ Window Config ┃
-- ┗━━━━━━━━━━━━━━━┛
config.window_padding = {
  left = 20,
  right = 20,
  top = 20,
  bottom = 0,
}

-- tab
config.show_close_tab_button_in_tabs = false -- requires Nightly builds
config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = true

config.window_decorations = "RESIZE"
config.send_composed_key_when_left_alt_is_pressed = true
config.enable_tab_bar = true
-- config.window_background_opacity = 0.8
-- config.macos_window_background_blur = 20

config.inactive_pane_hsb = {
  saturation = 1,
  brightness = 1,
}

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
