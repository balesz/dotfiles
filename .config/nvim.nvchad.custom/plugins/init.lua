local disableFlutterTools = true

vim.g['flutter_hot_reload_on_save'] = 1
vim.g['flutter_show_log_on_run'] = 'hidden'
vim.g['flutter_show_log_on_attach'] = 'hidden'
vim.g['flutter_autoscroll'] = 1
vim.g['flutter_use_last_run_option'] = 1
vim.g['flutter_use_last_attach_option'] = 1

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

  ['dart-lang/dart-vim-plugin'] = {
    disable = not disableFlutterTools,
  },

  ['thosakwe/vim-flutter'] = {
    disable = not disableFlutterTools,
  },

  ['akinsho/flutter-tools.nvim'] = {
    disable = disableFlutterTools,
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('flutter-tools').setup {}
    end
  }
}

