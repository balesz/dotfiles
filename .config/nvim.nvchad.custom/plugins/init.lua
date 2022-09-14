return {

  ["kyazdani42/nvim-tree.lua"] = {
    override_options = {
      view = {
        adaptive_size = false,
        side = "left",
        width = 45,
        hide_root_folder = true,
      },
    }
  },

  ["NvChad/ui"] = {
    override_options = {
      tabufline = {
        lazyload = false
      }
    },
  },

  ["NvChad/nvterm"] = {
    override_options = {
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
          horizontal = { location = "rightbelow", split_ratio = 0.25 },
          vertical = { location = "rightbelow", split_ratio = 0.5 },
        }
      }
    }
  },

  ["nvim-telescope/telescope.nvim"] = {
    override_options = {
      extensions_list = { "themes", "terms", "file_browser" },
      extensions = {
        file_browser = {},
      },
    }
  },

  ["marklcrns/vim-smartq"] = {
    disable = false,
  },

  ["NvChad/nvim-colorizer.lua"] = {
    disable = true,
  },

  ["lambdalisue/lista.nvim"] = {},

  ["MunifTanjim/exrc.nvim"] = {
    config = function ()
      require("exrc").setup {}
    end
  },

  ["is0n/jaq-nvim"] = {
    config = function ()
      require("jaq-nvim").setup {}
    end
  },

  ["TimUntersberger/neogit"] = {
    requires = "nvim-lua/plenary.nvim",
    config = function ()
      require("neogit").setup {}
    end
  },

  ["sindrets/diffview.nvim"] = {
    --requires = "nvim-lua/plenary.nvim",
    config = function ()
      require("diffview").setup {}
    end
  },

  ["kevinhwang91/nvim-ufo"] = {
    disable = true,
    requires = "kevinhwang91/promise-async",
    config = function ()
     require("ufo").setup {}
    end
  },

  ["nvim-treesitter/nvim-treesitter-context"] = {
    disable = false,
    config = function ()
      require("treesitter-context").setup {}
    end
  },

  ["nvim-telescope/telescope-file-browser.nvim"] = {
    disable = false,
  },

  ["folke/which-key.nvim"] = {
    disable = false,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  ["rcarriga/nvim-dap-ui"] = {
    requires = "mfussenegger/nvim-dap",
    config = function ()
      require("dapui").setup {}
    end
  },

  ["mfussenegger/nvim-dap"] = {
    config = function()
      require "custom.plugins.dapconfig"
    end
  },

  ["stevearc/dressing.nvim"] = {
    config = function ()
      require('dressing').setup {}
    end
  },

  ["folke/trouble.nvim"] = {
    requires = "kyazdani42/nvim-web-devicons",
    config = function ()
      require('trouble').setup {}
    end
  },

  ["NTBBloodbath/rest.nvim"] = {
    requires = { 'nvim-lua/plenary.nvim' },
    config = function ()
      require('rest-nvim').setup(require 'custom.plugins.rest-nvim')
    end
  },

  ["dart-lang/dart-vim-plugin"] = {
    disable = false,
  },

  ["thosakwe/vim-flutter"] = {
    disable = false,
  },

  ["akinsho/flutter-tools.nvim"] = {
    disable = true,
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('flutter-tools').setup {
        decorations = {
          statusline = {
            app_version = true,
            device = true,
          },
        },
        debugger = {
          enabled = true,
          run_via_dap = true,
        },
     }
    end
  }
}
