local wezterm = require "wezterm";

local M = {}

local font = "JetBrainsMono Nerd Font"
if os.getenv("OS") == "Windows_NT" then
  font = "JetBrainsMono NF"
end

M.font = wezterm.font(font)
M.size = 11

return M
