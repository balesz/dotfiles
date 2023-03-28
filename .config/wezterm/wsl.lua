-- wezterm-gui.exe --config-file \\wsl.localhost\{DISTRIBUTION}\home\{USER}\.config\wezterm\wezterm.lua

local wezterm = require "wezterm"

if not wezterm.config_dir:find("wsl.localhost") then
  return {}
end

local wsl_path = wezterm.config_dir
if not package.path:find(wsl_path) then
  package.path = table.concat({
    package.path,
    wsl_path .. "\\?.lua",
    wsl_path .. "\\?\\init.lua",
  }, ";")
end

local domain, wsl_domains = nil, nil

local distrib = wezterm.config_dir:gsub("\\\\wsl.localhost\\(%a*)\\.*", "%1")
wsl_domains = wezterm.default_wsl_domains()
for _, dom in ipairs(wsl_domains) do
  if dom.name == "WSL:" .. distrib then
    dom.default_cwd = "~"
    domain = dom.name
    break
  end
end

return {
  default_cwd = "~",
  default_domain = domain,
  wsl_domains = wsl_domains,
}