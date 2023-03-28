local wezterm = require "wezterm";
local action = wezterm.action

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
  override_in_shell({ key = "h", mods = "CTRL|ALT" }, { key = "LeftArrow" }),
  override_in_shell({ key = "j", mods = "CTRL|ALT" }, { key = "DownArrow" }),
  override_in_shell({ key = "k", mods = "CTRL|ALT" }, { key = "UpArrow" }),
  override_in_shell({ key = "l", mods = "CTRL|ALT" }, { key = "RightArrow" }),
  override_in_shell({ key = "h", mods = "CTRL|SHIFT" }, { key = "Home" }),
  override_in_shell({ key = "j", mods = "CTRL|SHIFT" }, { key = "PageDown" }),
  override_in_shell({ key = "k", mods = "CTRL|SHIFT" }, { key = "PageUp" }),
  override_in_shell({ key = "l", mods = "CTRL|SHIFT" }, { key = "End" }),
}
