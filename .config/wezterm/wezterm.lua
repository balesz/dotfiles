local wezterm = require "wezterm";
local action = wezterm.action

local default_prog = nil
local font = "JetBrainsMono Nerd Font"

if os.getenv("OS") == "Windows_NT" then
  default_prog = { "wsl", "-d", "Ubuntu", "--cd", "~" }
  font = "JetBrainsMono NF"
end

local function override_in_shell(lhs, rhs)
  return {
    key = lhs.key,
    mods = lhs.mods,
    action = wezterm.action_callback(function(win, pane)
      local proc_name = pane:get_foreground_process_name()
      if proc_name:find("zsh") then
        win:perform_action(action.SendKey {
          mods = rhs.mods, key = rhs.key
        }, pane)
      else
        win:perform_action(action.SendKey {
          mods = lhs.mods, key = lhs.key
        }, pane)
      end
    end),
  }
end

return {
  color_scheme = "Operator Mono Dark",
  default_prog = default_prog,
  exit_behavior = "Close",
  font = wezterm.font(font),
  font_size = 11,
  initial_cols = 120,
  initial_rows = 40,
  use_fancy_tab_bar = true,
  tab_bar_at_bottom = true,
  window_background_opacity = 0.9,
  window_padding = {
    left = "0cell",
    right = "0cell",
    top = "0cell",
    bottom = "0cell",
  },
  launch_menu = {
    { args = { "powershell" } },
    { args = { "top" } },
    { args = { "lazygit" } },
  },
  keys = {
    override_in_shell({ key = "h", mods = "ALT" }, { key = "LeftArrow" }),
    override_in_shell({ key = "j", mods = "ALT" }, { key = "a", mods = "CTRL" }),
    override_in_shell({ key = "k", mods = "ALT" }, { key = "e", mods = "CTRL" }),
    override_in_shell({ key = "l", mods = "ALT" }, { key = "RightArrow" }),
    override_in_shell({ key = "j", mods = "CTRL" }, { key = "DownArrow" }),
    override_in_shell({ key = "k", mods = "CTRL" }, { key = "UpArrow" }),
  },
}
