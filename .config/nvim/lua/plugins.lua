-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
 
  use 'kyazdani42/nvim-web-devicons' 
  use "EdenEast/nightfox.nvim"
  use 'nvim-lualine/lualine.nvim'
end)

require('lualine').setup {
  options = { theme = 'gruvbox' }
}

