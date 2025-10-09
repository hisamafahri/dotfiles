local wezterm = require("wezterm")
local M = {}

M = {
  -- Command: search in designated folders
  {
    key = "p",
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
    action = wezterm.action.SendString("\x1bf"),
  },
  {
    key = "Tab",
    action = wezterm.action.SendString("\x1bf"),
  },

  -- Movement: step 1 word backward
  {
    key = "LeftArrow",
    mods = "ALT",
    action = wezterm.action.SendString("\x1bb"),
  },
  {
    key = "Tab",
    mods = "SHIFT",
    action = wezterm.action.SendString("\x1bb"),
  },

  -- Movement: jump to the end of line
  {
    key = "RightArrow",
    mods = "SUPER",
    action = wezterm.action.SendString("\x05"),
  },

  -- Movement: jump to the beginning of line
  {
    key = "LeftArrow",
    mods = "SUPER",
    action = wezterm.action.SendString("\x01"),
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
    action = wezterm.action.SpawnTab "CurrentPaneDomain"
  },

  {
    key = "w",
    mods = "SUPER",
    action = wezterm.action.CloseCurrentPane { confirm = false }
  },

  {
    key = "d",
    mods = "SUPER",
    action = wezterm.action.SplitPane {
      direction = "Right",
      size = { Percent = 50 },
    },
  },

  {
    key = "d",
    mods = "SUPER|SHIFT",
    action = wezterm.action.SplitPane {
      direction = "Down",
      size = { Percent = 50 },
    },
  },
}

return M
