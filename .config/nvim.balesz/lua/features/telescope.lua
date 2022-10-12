local M = {}

function M.setup(use)
  --
  -- https://github.com/nvim-telescope/telescope.nvim
  --
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup {}
    end
  }
end

return M
