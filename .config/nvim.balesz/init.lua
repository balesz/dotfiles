local hasPacker = pcall(require, 'packer')

if not hasPacker then
  local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  end
end

if not hasPacker then
  vim.cmd 'exit'
end

local function setupFactory(use)
  return function(package)
    local ok, pkg = pcall(require, package)
    if not ok then return else pkg.setup(use) end
  end
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'
  local setup = setupFactory(use)
  setup('features/autocompletion')
  setup('features/bufferline')
  setup('features/colorscheme')
  setup('features/editor')
  setup('features/filetree')
  setup('features/layout')
  setup('features/mouse')
  setup('features/neovim')
  setup('features/statusline')
  setup('features/syntax')
  setup('features/telescope')
  setup('features/terminal')
  setup('plugins')
end)
