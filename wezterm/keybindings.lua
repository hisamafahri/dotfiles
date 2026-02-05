local wezterm = require("wezterm")
local workspace_plugin =
  wezterm.plugin.require("/Users/hisam/app/smart_workspace_switcher.wezterm")
local M = {}

M = {
  {
    key = "r",
    mods = "CMD|SHIFT",
    action = wezterm.action.ReloadConfiguration,
  },
  -- Command: search in designated folders
  {
    key = "p",
    mods = "SUPER",
    action = wezterm.action.SendString(
      "cd $(fd . -I --absolute-path --min-depth 0 --max-depth 4 -t d --exclude node_modules --exclude .git ~/cakeauth ~/sokratech ~/lms ~/tms ~/revlo ~/locker ~/learn ~/projects ~/work ~/personal ~/vleete ~/sandbox ~/oss ~/arisanin | fzf) && cl \r"
    ),
  },
  {
    key = "o",
    mods = "SUPER",
    action = workspace_plugin.switch_workspace(),
  },
  {
    key = "o",
    mods = "SUPER|SHIFT",
    action = wezterm.action.PromptInputLine({
      description = "Enter name for new workspace",
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:perform_action(
            wezterm.action.SwitchToWorkspace({ name = line }),
            pane
          )
        end
      end),
    }),
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
    action = wezterm.action.DisableDefaultAssignment,
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
    action = wezterm.action.DisableDefaultAssignment,
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
    action = wezterm.action.SpawnTab("CurrentPaneDomain"),
  },

  {
    key = "w",
    mods = "SUPER",
    action = wezterm.action.CloseCurrentPane({ confirm = false }),
  },

  {
    key = "d",
    mods = "SUPER",
    action = wezterm.action.SplitPane({
      direction = "Right",
      size = { Percent = 50 },
    }),
  },

  {
    key = "d",
    mods = "SUPER|SHIFT",
    action = wezterm.action.SplitPane({
      direction = "Down",
      size = { Percent = 50 },
    }),
  },

  {
    key = "h",
    mods = "SUPER",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },

  {
    key = "l",
    mods = "SUPER",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },

  {
    key = "k",
    mods = "SUPER",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },

  {
    key = "j",
    mods = "SUPER",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
}

return M
