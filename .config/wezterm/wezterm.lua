require "features/events"

local default_prog = nil
if os.getenv("OS") == "Windows_NT" then
  default_prog = { "wsl", "-d", "Ubuntu", "--cd", "~" }
end

return {
  default_prog = default_prog,
  color_scheme = "nord",
  keys = require "features/keymaps",
  font = require "features/font",
  font_size = 11,
  exit_behavior = "Close",
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
}
