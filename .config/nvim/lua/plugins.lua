-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

require('packer').startup(function(use)
  -- packer
  use 'wbthomason/packer.nvim' -- https://github.com/wbthomason/packer.nvim

  -- common
  use 'nvim-lua/plenary.nvim' -- https://github.com/nvim-lua/plenary.nvim

  -- user interface
  use 'EdenEast/nightfox.nvim' -- https://github.com/EdenEast/nightfox.nvim
  use 'kyazdani42/nvim-web-devicons' -- https://github.com/kyazdani42/nvim-web-devicons
  use 'nvim-lualine/lualine.nvim' -- https://github.com/nvim-lualine/lualine.nvim
  use 'karb94/neoscroll.nvim' -- https://github.com/karb94/neoscroll.nvim
  use 'petertriho/nvim-scrollbar' -- https://github.com/petertriho/nvim-scrollbar
  use 'nvim-telescope/telescope.nvim' -- https://github.com/nvim-telescope/telescope.nvim

  -- terminal
  use 'voldikss/vim-floaterm' -- https://github.com/voldikss/vim-floaterm

  -- editor
  use 'lukas-reineke/indent-blankline.nvim' -- https://github.com/lukas-reineke/indent-blankline.nvim

  -- lsp server / autocompletion
  use 'nvim-treesitter/nvim-treesitter' -- https://github.com/nvim-treesitter/nvim-treesitter
  use 'L3MON4D3/LuaSnip'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'

  -- http client
  use 'NTBBloodbath/rest.nvim' -- https://github.com/NTBBloodbath/rest.nvim
end)

