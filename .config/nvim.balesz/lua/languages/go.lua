local M = {}

local ok_lsp, lspconfig = pcall(require, "lspconfig")
local utils = require "languages/utils"

function M.setup(_)
  --
  -- https://github.com/golang/tools/tree/master/gopls
  --
  local _ = ok_lsp and lspconfig.gopls.setup {
    capabilities = utils.get_capabilities(),
  }
end

return M
