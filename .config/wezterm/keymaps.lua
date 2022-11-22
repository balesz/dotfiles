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
  override_in_shell({ key = "h", mods = "ALT" }, { key = "LeftArrow" }),
  override_in_shell({ key = "j", mods = "ALT" }, { key = "a", mods = "CTRL" }),
  override_in_shell({ key = "k", mods = "ALT" }, { key = "e", mods = "CTRL" }),
  override_in_shell({ key = "l", mods = "ALT" }, { key = "RightArrow" }),
  override_in_shell({ key = "j", mods = "CTRL" }, { key = "DownArrow" }),
  override_in_shell({ key = "k", mods = "CTRL" }, { key = "UpArrow" }),
}
