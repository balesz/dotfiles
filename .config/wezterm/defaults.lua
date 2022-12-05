local wezterm = require "wezterm"

local M = { cwd = "~", domain = "local", prog = { "zsh" } }

if wezterm.config_dir:find("wsl.localhost") then
  local distrib = wezterm.config_dir:gsub("\\\\wsl.localhost\\(%a*)\\.*", "%1")
  M.prog = { "wsl", "-d", distrib, "--cd", "~" }
  --M.domain = "WSL:" .. distrib
end

return M
