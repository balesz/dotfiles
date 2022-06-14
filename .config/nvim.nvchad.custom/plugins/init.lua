local disableFlutterTools = true

return {
 ['stevearc/dressing.nvim'] = {
    config = function ()
      require('dressing').setup {}
    end
  },

  ['folke/trouble.nvim'] = {
    requires = "kyazdani42/nvim-web-devicons",
    config = function ()
      require('trouble').setup {}
    end
  },

  ['NTBBloodbath/rest.nvim'] = {
    requires = { 'nvim-lua/plenary.nvim' },
    config = function ()
      require('rest-nvim').setup(require 'custom.plugins.rest-nvim')
    end
  },

  ['dart-lang/dart-vim-plugin'] = { disable = not disableFlutterTools },
  ['thosakwe/vim-flutter'] = { disable = not disableFlutterTools },
  ['akinsho/flutter-tools.nvim'] = {
    disable = disableFlutterTools,
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('flutter-tools').setup {}
    end
  }
}

