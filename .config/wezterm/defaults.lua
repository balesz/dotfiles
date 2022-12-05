local wezterm = require "wezterm"

local M = { cwd = "~", domain = "local", }

if wezterm.config_dir:find("wsl.localhost") then
  local distrib = wezterm.config_dir:gsub("\\\\wsl.localhost\\(%a*)\\.*", "%1")
  M.wsl_domains = wezterm.default_wsl_domains()
  for _, dom in ipairs(M.wsl_domains) do
    if dom.name == "WSL:" .. distrib then
      dom.default_cwd = M.cwd
      M.domain = dom.name
    end
  end
end

return M
