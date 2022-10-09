local M = {}

M.setup = function(use)
  --
  -- https://github.com/nvim-lualine/lualine.nvim
  --
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = { theme = 'nord' }
      }
    end
  }
end

return M
