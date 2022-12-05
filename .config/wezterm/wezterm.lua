local wezterm = require("wezterm")

-- wezterm-gui.exe --config-file \\wsl.localhost\{DISTRIBUTION}\home\{USER}\.config\wezterm\wezterm.lua
if wezterm.config_dir:find("wsl.localhost") then
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
  color_scheme = "nord",
  default_cwd = require "defaults".cwd,
  default_domain = require "defaults".domain,
  default_prog = require "defaults".prog,
  exit_behavior = "Close",
  font = require "font".font,
  font_size = require "font".size,
  initial_cols = 120,
  initial_rows = 40,
  keys = require "keymaps",
  ssh_backend = "Ssh2",
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = true,
  window_background_opacity = 0.9,
  window_padding = {
    left = "0cell",
    right = "0cell",
    top = "0cell",
    bottom = "0cell",
  },
}
