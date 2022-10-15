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
  --
  -- https://github.com/catppuccin/nvim
  --
  use {
    'catppuccin/nvim',
    as = 'catppuccin',
    config = function()
      require('catppuccin').setup {}
    end
  }
end

if pcall(require, 'nightfox') then
  vim.cmd 'colorscheme nordfox'
elseif pcall(require, 'catppuccin') then
  vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha 
  vim.cmd "colorscheme catppuccin"
end

return M
