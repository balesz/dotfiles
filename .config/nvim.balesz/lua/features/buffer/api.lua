local M = {}

function M.close()
  vim.cmd [[Bdelete]]
end

return M
