local wezterm = require "wezterm"

local M = { cwd = "~", domain = "local", prog = { "zsh" } }

if wezterm.config_dir:find("wsl.localhost") then
  local distrib = wezterm.config_dir:gsub("\\\\wsl.localhost\\(%a*)\\.*", "%1")
  for _, dom in ipairs(wezterm.default_wsl_domains()) do
    if dom.name == "WSL:" .. distrib then
      dom.default_cwd = M.cwd
      dom.default_prog = M.prog
      M.domain = dom.name
    end
  end
end

return M
