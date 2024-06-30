local wezterm = require 'wezterm'
local act = wezterm.action

local config = wezterm.config_builder()

-- Configs

-- config.font = wezterm.font 'JetBrains Mono'
config.font = wezterm.font 'Input Mono'
config.color_scheme = 'Gruvbox dark, hard (base16)'

-- Windows
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

-- keybindings
config.keys = {
  -- command: search in designated folders
  {
    key = 'p',
    mods = 'CMD',
    action = act.SendString 'cd $(fd . -I --absolute-path --min-depth 0 --max-depth 4 -t d --exclude node_modules --exclude .git ~/projects ~/work ~/personal ~/vleete ~/sandbox ~/oss ~/arisanin ~/.personal | fzf) && cl \r'
  },
  -- command: delete entire line
  {
    key = 'Backspace',
    mods = 'CMD',
    action = act.SendKey { mods = "CTRL", key = "u" }
  },
  -- movement: step 1 word forward
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = act.SendKey { key = 'f', mods = 'ALT' },
  },
  -- movement: step 1 word backward
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = act.SendKey {
      key = 'b',
      mods = 'ALT',
    },
  },
  -- movement: jump to the end of line
  {
    key = 'RightArrow',
    mods = 'CMD',
    action = act.SendKey {
      key = 'e',
      mods = 'CTRL',
    },
  },
  -- movement: jump to the beginning of line
  {
    key = 'LeftArrow',
    mods = 'CMD',
    action = act.SendKey {
      key = 'a',
      mods = 'CTRL',
    },
  },

  -- neovim: shift+enter -> cmd+enter
  -- ref: https://stackoverflow.com/a/42461580
  {
    key = 'Enter',
    mods = 'CMD',
    action = act.SendString '\x1b[13;5u',
  },

  -- neovim: delete a word
  {
    key = 'Backspace',
    mods = 'OPT',
    action = act.SendKey {
      key = 'W',
      mods = 'CTRL',
    },
  },

  -- neovim: format (option+shift+f)
  {
    key = 'f',
    mods = 'OPT|SHIFT',
    action = act.SendString 'Ï'
  },

  -- tmux: new session
  {
    key = 't',
    mods = 'CMD',
    action = act.Multiple {
      act.SendKey { mods = 'CTRL', key = 'b' },
      act.SendKey { key = 'c' },
    }
  },
  -- tmux: close a session
  {
    key = 'w',
    mods = 'CMD',
    action = act.Multiple {
      act.SendKey { mods = 'CTRL', key = 'b' },
      act.SendKey { key = '&' },
    }
  },
  -- tmux: split window vertically
  {
    key = 'd',
    mods = 'CMD',
    action = act.Multiple {
      act.SendKey { mods = 'CTRL', key = 'b' },
      act.SendKey { key = '%' },
    }
  },
  -- tmux: split window horizontally
  {
    key = 'd',
    mods = 'CMD|SHIFT',
    action = act.Multiple {
      act.SendKey { mods = 'CTRL', key = 'b' },
      act.SendKey { key = '"' },
    }
  },

  -- tmux: jump to a tmux pane[index]
  {
    key = '1',
    mods = 'CMD',
    action = act.Multiple {
      act.SendKey { mods = 'CTRL', key = 'b' },
      act.SendKey { key = '1' },
    }
  },
  {
    key = '2',
    mods = 'CMD',
    action = act.Multiple {
      act.SendKey { mods = 'CTRL', key = 'b' },
      act.SendKey { key = '2' },
    }
  },
  {
    key = '3',
    mods = 'CMD',
    action = act.Multiple {
      act.SendKey { mods = 'CTRL', key = 'b' },
      act.SendKey { key = '3' },
    }
  },
  {
    key = '4',
    mods = 'CMD',
    action = act.Multiple {
      act.SendKey { mods = 'CTRL', key = 'b' },
      act.SendKey { key = '4' },
    }
  },
  {
    key = '5',
    mods = 'CMD',
    action = act.Multiple {
      act.SendKey { mods = 'CTRL', key = 'b' },
      act.SendKey { key = '5' },
    }
  },
  {
    key = '6',
    mods = 'CMD',
    action = act.Multiple {
      act.SendKey { mods = 'CTRL', key = 'b' },
      act.SendKey { key = '6' },
    }
  },
  {
    key = '7',
    mods = 'CMD',
    action = act.Multiple {
      act.SendKey { mods = 'CTRL', key = 'b' },
      act.SendKey { key = '7' },
    }
  },
  {
    key = '8',
    mods = 'CMD',
    action = act.Multiple {
      act.SendKey { mods = 'CTRL', key = 'b' },
      act.SendKey { key = '8' },
    }
  },
  {
    key = '9',
    mods = 'CMD',
    action = act.Multiple {
      act.SendKey { mods = 'CTRL', key = 'b' },
      act.SendKey { key = '9' },
    }
  },
}

return config
