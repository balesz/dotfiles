local M = {}

local ok_cmp_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

function M.get_capabilities()
  return ok_cmp_lsp and cmp_nvim_lsp.default_capabilities() or nil
end

return M
