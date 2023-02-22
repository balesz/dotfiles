local M = {}

function M.hot_reload()
  require("dap").sessions()[1]:request("hotReload", nil, nil)
end

return M
