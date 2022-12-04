local wezterm = require "wezterm"

local M = { domain = "local", prog = { "zsh" } }

if wezterm.config_dir:find("wsl.localhost") then
  local distrib = wezterm.config_dir:gsub("\\\\wsl.localhost\\(.*)\\.*", "%1")
  M.domain = distrib
end

return M
