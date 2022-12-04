local wezterm = require("wezterm")

-- wezterm-gui.exe --config-file \\wsl.localhost\Ubuntu\{HOME_DIR}\.config\wezterm\wezterm.lua
if os.getenv("OS") == "Windows_NT" then
  local wsl_path = wezterm.config_dir
  if not package.path:find(wsl_path) then
    package.path = table.concat({
      package.path,
      wsl_path .. "\\?.lua",
      wsl_path .. "\\?\\init.lua",
    }, ";")
  end
end

require "title"

return {
  default_prog = require "default_prog",
  color_scheme = "nord",
  keys = require "keymaps",
  font = require "font",
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
