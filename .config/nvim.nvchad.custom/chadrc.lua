local M = {}

local override = require "custom.override"

M.ui = {
  theme = "chadtain",
  theme_toggle = { 'chadtain', 'one_light' },
  hl_add = {
    LspCodeLens = { link = 'Comment' }
  },
}

M.plugins = {
  user = require 'custom.plugins',

  options = {
    lspconfig = {
      setup_lspconf = 'custom.plugins.lspconfig',
    },
  },
}

return M

