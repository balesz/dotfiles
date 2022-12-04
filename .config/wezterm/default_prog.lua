local wezterm = require "wezterm"

if wezterm.config_dir:find("wsl.localhost") then
  local distrib = wezterm.config_dir:gsub("\\\\wsl.localhost\\(.*)\\.*", "%1")
  return { "wsl", "-d", distrib, "--cd", "~" }
end

return { "zsh" }
