-- ~/.config/wezterm/wezterm.lua

local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- ┏━━━━━━━━━━━━━━━━┓
-- ┃ General Config ┃
-- ┗━━━━━━━━━━━━━━━━┛

-- ┏━━━━━━━━━━━━━━━━━━━━┓
-- ┃ Environment Config ┃
-- ┗━━━━━━━━━━━━━━━━━━━━┛
config.set_environment_variables = {
  TERM = "xterm-256color",
}

-- ┏━━━━━━━━━━━┓
-- ┃ UI Config ┃
-- ┗━━━━━━━━━━━┛
config.color_scheme = 'GruvboxDarkHard'

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
    mods = "CMD",
    action = wezterm.action.SendString("cd $(fd . -I --absolute-path --min-depth 0 --max-depth 4 -t d --exclude node_modules --exclude .git ~/cakeauth ~/sokratech ~/lms ~/tms ~/revlo ~/locker ~/learn ~/projects ~/work ~/personal ~/vleete ~/sandbox ~/oss ~/arisanin | fzf) && cl \r"),
  },

  -- Command: delete entire line
  {
    key = "Backspace",
    mods = "CMD",
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
    mods = "CMD",
    action = wezterm.action.SendString("\u{001b}[F"),
  },

  -- Movement: jump to the beginning of line
  {
    key = "LeftArrow",
    mods = "CMD",
    action = wezterm.action.SendString("\u{001b}[H"),
  },

  -- Neovim: cmd+enter
  {
    key = "Enter",
    mods = "CMD",
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
    key = "T",
    mods = "CMD",
    action = wezterm.action.SendString("\u{0002}c"),
  },

  -- Tmux: rename window
  {
    key = "R",
    mods = "CMD",
    action = wezterm.action.SendString("\u{0002},"),
  },

  -- Tmux: close a session
  {
    key = "W",
    mods = "CMD",
    action = wezterm.action.SendString("\u{0002}&"),
  },

  -- Tmux: split window vertically
  {
    key = "D",
    mods = "CMD",
    action = wezterm.action.SendString("\u{0002}%"),
  },

  -- Tmux: split window horizontally
  {
    key = "D",
    mods = "CMD|SHIFT",
    action = wezterm.action.SendString('\u{0002}"'),
  },

  -- Tmux: jump to tmux panes [1-9]
  {
    key = "1",
    mods = "CMD",
    action = wezterm.action.SendString("\u{0002}1"),
  },
  {
    key = "2",
    mods = "CMD",
    action = wezterm.action.SendString("\u{0002}2"),
  },
  {
    key = "3",
    mods = "CMD",
    action = wezterm.action.SendString("\u{0002}3"),
  },
  {
    key = "4",
    mods = "CMD",
    action = wezterm.action.SendString("\u{0002}4"),
  },
  {
    key = "5",
    mods = "CMD",
    action = wezterm.action.SendString("\u{0002}5"),
  },
  {
    key = "6",
    mods = "CMD",
    action = wezterm.action.SendString("\u{0002}6"),
  },
  {
    key = "7",
    mods = "CMD",
    action = wezterm.action.SendString("\u{0002}7"),
  },
  {
    key = "8",
    mods = "CMD",
    action = wezterm.action.SendString("\u{0002}8"),
  },
  {
    key = "9",
    mods = "CMD",
    action = wezterm.action.SendString("\u{0002}9"),
  },
}

return config
