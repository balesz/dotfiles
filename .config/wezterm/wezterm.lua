local wezterm = require "wezterm"
local wsl = require "wsl"

require "title"
local font = require "font"

local M = {
  color_scheme = "tokyonight-storm",
  exit_behavior = "Close",
  font = font.font,
  font_size = font.size,
  initial_cols = 120,
  initial_rows = 40,
  ssh_backend = "Ssh2",
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = true,
  -- window_background_opacity = 0.9,
  window_padding = {
    left = "0cell",
    right = "0cell",
    top = "0cell",
    bottom = "0cell",
  },
}

if wsl.wsl_domains ~= nil then
  M.wsl_domains = wsl.wsl_domains
  M.default_cwd = wsl.default_cwd
  M.default_domain = wsl.default_domain
end

return M
