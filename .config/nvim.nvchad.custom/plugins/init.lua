return {

  ["sunjon/shade.nvim"] = {
    disable = false,
    config = function ()
      require'shade'.setup({
        overlay_opacity = 50,
        opacity_step = 1,
        keys = {
          brightness_up    = '<C-Up>',
          brightness_down  = '<C-Down>',
          toggle           = '<Leader>s',
        }
      })
    end
   },

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
    requires = 'nvim-lua/plenary.nvim',
    config = function ()
      require("neogit").setup {}
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

