local wezterm = require "wezterm";

local font = "JetBrainsMono Nerd Font"
if os.getenv("OS") == "Windows_NT" then
  font = "JetBrainsMono NF"
end

return wezterm.font(font)
