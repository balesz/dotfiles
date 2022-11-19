local M = {}

local ok_lsp, lspconfig = pcall(require, "lspconfig")
local utils = require "languages/utils"

function M.setup(_)
  --
  -- https://github.com/rcjsuen/dockerfile-language-server-nodejs
  --
  local _ = ok_lsp and lspconfig.dockerls.setup {
    capabilities = utils.get_capabilities(),
  }
end

return M
