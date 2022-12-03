local M = {}

local ok_lsp, lspconfig = pcall(require, "lspconfig")
local ok_navic, navic = pcall(require, "nvim-navic")
local utils = require "languages/utils"

function M.setup(_)
  --
  -- https://github.com/golang/tools/tree/master/gopls
  --
  local _ = ok_lsp and lspconfig.gopls.setup {
    capabilities = utils.get_capabilities(),
    on_attach = function(client, bufnr)
      local _ = ok_navic and navic.attach(client, bufnr)
    end,
  }
end

return M
