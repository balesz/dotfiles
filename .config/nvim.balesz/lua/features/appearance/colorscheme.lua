local M = {}

function M.setup(use)
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

if pcall(require, 'nightfox') then
  vim.cmd 'colorscheme nordfox'
end

return M
