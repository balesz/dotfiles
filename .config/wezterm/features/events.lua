local wezterm = require "wezterm";

local function get_title(pane)
  local title = pane.foreground_process_name:gsub("/.*/(.*)", "%1")
  if title == "nvim" then
    local dir = pane.current_working_dir
    title = dir:gsub("file://.*/(.+)", "%1")
  end
  return title
end

wezterm.on(
  "format-tab-title",
  function(tab)
    local result = {}
    if tab.is_active then
      table.insert(result, { Background = { Color = "brown" } })
    end
    local title = get_title(tab.active_pane)
    table.insert(result, { Text = " " .. title .. " " })
    return result
  end
)

wezterm.on(
  "format-window-title",
  function(tab)
    local title = get_title(tab.active_pane)
    return title
  end
)
