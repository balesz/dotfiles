local function config_on_host()
  local wsl_path = "\\\\wsl.localhost\\Ubuntu\\{HOME_DIR}\\.config\\wezterm\\"

  if not package.path:find(wsl_path) then
    package.path = table.concat({
      package.path,
      wsl_path .. "?.lua",
      wsl_path .. "?\\init.lua",
    }, ";")
  end

  return require("wsl")(wsl_path)
end

return function(wsl_path)
  return dofile(wsl_path .. "wezterm.lua")
end
