local M = {}

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

  override = {
    ["nvim-telescope/telescope.nvim"] = {
      extensions_list = { "themes", "terms", "file_browser" },
      extensions = {
        file_browser = {},
      },
    },
  },
}

M.mappings = require "custom.mappings"

return M

