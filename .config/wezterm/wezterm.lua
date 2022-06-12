local wezterm = require 'wezterm';

local default_prog = nil
if os.getenv('OS') == 'Windows_NT' then
  default_prog = { 'wsl', '-d', 'Ubuntu' }
end

return {
  font = wezterm.font('JetBrainsMono Nerd Font'),
  font_size = 11,
  initial_cols = 120,
  initial_rows = 40,
  default_prog = default_prog,
}
