-- ~/.config/wezterm/wezterm.lua

local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- ┏━━━━━━━━━━━━━━━━┓
-- ┃ General Config ┃
-- ┗━━━━━━━━━━━━━━━━┛

-- ┏━━━━━━━━━━━━━━━━━━━━┓
-- ┃ Environment Config ┃
-- ┗━━━━━━━━━━━━━━━━━━━━┛
-- config.term = "xterm-256color"

-- ┏━━━━━━━━━━━┓
-- ┃ UI Config ┃
-- ┗━━━━━━━━━━━┛
function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end

  return "Dark"
end

if get_appearance():find("Dark") then
  config.color_scheme = "GruvboxDarkHard"
  config.colors = {
    background = "#1d2021",
  }
else
  config.color_scheme = "GruvboxLight"
  config.colors = {
    background = "#f9f5d7",
  }
end

config.font = wezterm.font_with_fallback({
  {
    family = "Maple Mono NF",
    weight = "Regular",
  },
})

config.font_size = 15
config.font_rules = {
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

-- ┏━━━━━━━━━━━━━━━┓
-- ┃ Window Config ┃
-- ┗━━━━━━━━━━━━━━━┛
config.window_padding = {
  left = 12,
  right = 12,
  top = 12,
  bottom = 12,
}

config.window_decorations = "RESIZE"
config.send_composed_key_when_left_alt_is_pressed = true
config.enable_tab_bar = false
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
config.keys = {
  -- Command: search in designated folders
  {
    key = "P",
    mods = "SUPER",
    action = wezterm.action.SendString(
      "cd $(fd . -I --absolute-path --min-depth 0 --max-depth 4 -t d --exclude node_modules --exclude .git ~/cakeauth ~/sokratech ~/lms ~/tms ~/revlo ~/locker ~/learn ~/projects ~/work ~/personal ~/vleete ~/sandbox ~/oss ~/arisanin | fzf) && cl \r"
    ),
  },

  -- Command: delete entire line
  {
    key = "Backspace",
    mods = "SUPER",
    action = wezterm.action.SendString("\u{0015}"),
  },

  -- Movement: step 1 word forward
  {
    key = "RightArrow",
    mods = "ALT",
    action = wezterm.action.SendString("\u{001b}f"),
  },

  -- Movement: step 1 word backward
  {
    key = "LeftArrow",
    mods = "ALT",
    action = wezterm.action.SendString("\u{001b}b"),
  },

  -- Movement: jump to the end of line
  {
    key = "RightArrow",
    mods = "SUPER",
    action = wezterm.action.SendString("\u{001b}[F"),
  },

  -- Movement: jump to the beginning of line
  {
    key = "LeftArrow",
    mods = "SUPER",
    action = wezterm.action.SendString("\u{001b}[H"),
  },

  -- Neovim: cmd+enter
  {
    key = "Enter",
    mods = "SUPER",
    action = wezterm.action.SendString("<<<ORG_OPEN_AT_POINT>>>"),
  },

  -- Neovim: delete a word
  {
    key = "Backspace",
    mods = "ALT",
    action = wezterm.action.SendString("\u{0017}"),
  },

  -- Tmux: new session
  {
    key = "t",
    mods = "SUPER",
    action = wezterm.action.SendString("\u{0002}c"),
  },

  -- Tmux: rename window
  {
    key = "r",
    mods = "SUPER",
    action = wezterm.action.SendString("\u{0002},"),
  },

  -- Tmux: close a session
  {
    key = "w",
    mods = "SUPER",
    action = wezterm.action.SendString("\u{0002}&"),
  },

  -- Tmux: split window vertically
  {
    key = "d",
    mods = "SUPER",
    action = wezterm.action.SendString("\u{0002}%"),
  },

  -- Tmux: split window horizontally
  {
    key = "d",
    mods = "SUPER|SHIFT",
    action = wezterm.action.SendString('\u{0002}"'),
  },

  -- Tmux: jump to tmux panes [1-9]
  {
    key = "1",
    mods = "SUPER",
    action = wezterm.action.SendString("\u{0002}1"),
  },
  {
    key = "2",
    mods = "SUPER",
    action = wezterm.action.SendString("\u{0002}2"),
  },
  {
    key = "3",
    mods = "SUPER",
    action = wezterm.action.SendString("\u{0002}3"),
  },
  {
    key = "4",
    mods = "SUPER",
    action = wezterm.action.SendString("\u{0002}4"),
  },
  {
    key = "5",
    mods = "SUPER",
    action = wezterm.action.SendString("\u{0002}5"),
  },
  {
    key = "6",
    mods = "SUPER",
    action = wezterm.action.SendString("\u{0002}6"),
  },
  {
    key = "7",
    mods = "SUPER",
    action = wezterm.action.SendString("\u{0002}7"),
  },
  {
    key = "8",
    mods = "SUPER",
    action = wezterm.action.SendString("\u{0002}8"),
  },
  {
    key = "9",
    mods = "SUPER",
    action = wezterm.action.SendString("\u{0002}9"),
  },
}

return config
