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
    ["NvChad/ui"] = {
      tabufline = {
        lazyload = false
      }
    },
    ["NvChad/nvterm"] = {
      terminals = {
        type_opts = {
          float = {
            relative = "editor",
            row = 0.05,
            col = 0.1,
            width = 0.8,
            height = 0.8,
            border = "single",
          },
          horizontal = { location = "rightbelow", split_ratio = 0.4 },
          vertical = { location = "rightbelow", split_ratio = 0.5 },
        }
      }
    },
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

