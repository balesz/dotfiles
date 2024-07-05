local wezterm = require "wezterm";

local M = {}

local font = ""
font = "FiraCode Nerd Font"
font = "JetBrainsMono Nerd Font"
if os.getenv("OS") == "Windows_NT" then
  font = font:gsub("Nerd Font", "NF")
end

M.font = wezterm.font(font)
M.size = 12

return M
