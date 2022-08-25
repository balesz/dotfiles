return {

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

  ["mfussenegger/nvim-dap"] = {
    config = function()
      require "custom.plugins.dapconfig"
    end
  },

  ["rcarriga/nvim-dap-ui"] = {
    requires = "mfussenegger/nvim-dap",
    config = function ()
      require('dapui').setup {}
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

