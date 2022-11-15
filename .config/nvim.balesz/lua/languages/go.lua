local M = {}

local ok_lsp, lspconfig = pcall(require, "lspconfig")
local ok_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

local function get_capabilities()
  return ok_cmp_nvim_lsp and cmp_nvim_lsp.default_capabilities() or nil
end

function M.setup(_)
  --
  -- https://github.com/golang/tools/tree/master/gopls
  --
  local _ = ok_lsp and lspconfig.gopls.setup {
    capabilities = get_capabilities(),
  }
end

return M
