local M = {}

local override = require "custom.override"

M.ui = {
  theme = "chadtain",
  theme_toggle = { 'chadtain', 'one_light' },
  hl_override = {
    LspCodeLens = { link = 'Comment' }
  },
}

M.plugins = {
  user = require 'custom.plugins',

  options = {
    lspconfig = {
      setup_lspconf = 'custom.plugins.lspconfig',
    }
  },

  override = {
    ['ray-x/lsp_signature.nvim'] = override.signature,
  }
}

return M

