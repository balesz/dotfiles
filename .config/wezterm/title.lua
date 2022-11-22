local wezterm = require "wezterm";

wezterm.on(
  "format-tab-title",
  function(tab)
    local result = {}
    if tab.is_active then
      table.insert(result, { Background = { Color = "brown" } })
    end
    table.insert(result, { Text = tab.active_pane.title })
    return result
  end
)

wezterm.on(
  "format-window-title",
  function(tab)
    local title = tab.active_pane.title
    return title
  end
)
