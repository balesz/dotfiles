local M = {}

function M.setup(use)
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

vim.opt.laststatus = 3
vim.opt.showmode = false

return M
