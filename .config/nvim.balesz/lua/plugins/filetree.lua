local M = {}

M.setup = function(use)
  --
  -- https://github.com/nvim-neo-tree/neo-tree.nvim
  --
  use {
    'nvim-neo-tree/neo-tree.nvim',
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require('neo-tree').setup {} 
    end
  }
end

return M
