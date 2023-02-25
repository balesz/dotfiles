local M = {}

function M.on_attach(client, bufnr)
  require("nvim-navic").attach(client, bufnr)
end

return M