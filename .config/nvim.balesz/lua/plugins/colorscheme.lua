local M = {}

M.setup = function(use)
  --
  -- https://github.com/EdenEast/nightfox.nvim
  --
  use {
    'EdenEast/nightfox.nvim',
    config = function()
      require('nightfox').setup {}
    end
  }
end

return M
