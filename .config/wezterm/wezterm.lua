local wezterm = require 'wezterm';

local default_prog = nil
local font = 'JetBrainsMono Nerd Font'

if os.getenv('OS') == 'Windows_NT' then
  default_prog = { 'wsl', '-d', 'Ubuntu', '--cd', '~' }
  font = 'JetBrainsMono NF'
end

return {
  default_prog = default_prog,
  font = wezterm.font(font),
  font_size = 11,
  initial_cols = 120,
  initial_rows = 40,
  window_background_opacity = 0.9,
  window_padding = {
    left = '0cell',
    right = '0cell',
    top = '0cell',
    bottom = '0cell',
  }
}

