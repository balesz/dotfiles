local wezterm = require "wezterm";

local function get_icon(pane)
  if pane.foreground_process_name:find("nvim") then
    return "  | "
  elseif pane.foreground_process_name:find("ssh") then
    return "  | "
  end
  return " "
end

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
    local icon = get_icon(tab.active_pane)
    local title = get_title(tab.active_pane)
    table.insert(result, { Text = icon .. title })
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
