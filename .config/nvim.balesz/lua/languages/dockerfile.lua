local M = {}

local ok_lsp, lspconfig = pcall(require, "lspconfig")
local utils = require "languages/utils"

function M.setup()
  --
  -- https://github.com/rcjsuen/dockerfile-language-server-nodejs
  --
  if not ok_lsp then return end
  lspconfig.dockerls.setup {
    capabilities = utils.get_capabilities(),
  }
end

return M
