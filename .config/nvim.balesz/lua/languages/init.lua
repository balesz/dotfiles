local M = {}

function M.on_attach(client, bufnr)
  require("features/editor/api").on_attach(client, bufnr)
end

return M