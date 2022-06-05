-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

--
-- https://github.com/wbthomason/packer.nvim
--
require('packer').startup(function(use)
  -- Packer
  use 'wbthomason/packer.nvim' 
 
  -- User Interface
  use(require'plugins/nightfox')
  use(require'plugins/lualine')
  use(require'plugins/telescope')

  -- File Manager
  use(require'plugins/neo-tree')

  -- Editor
  use(require'plugins/neoscroll')
  use(require'plugins/indent-blankline')

  -- LSP / Autocompletion
  use(require'plugins/nvim-treesitter')
  use 'L3MON4D3/LuaSnip'
  use 'williamboman/nvim-lsp-installer'
  use 'neovim/nvim-lspconfig' 
  use { 'hrsh7th/nvim-cmp', config = require'plugins/nvim-cmp' }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lua'
  use 'saadparwaiz1/cmp_luasnip'
  use { 'petertriho/cmp-git', requires = 'nvim-lua/plenary.nvim' }

  -- Flutter
  use {
    'akinsho/flutter-tools.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('flutter-tools').setup {}
    end
  } -- https://github.com/akinsho/flutter-tools.nvim

  -- Tools
  use(require'plugins/rest-nvim')
end)

--
--
-- ## Common
-- https://github.com/nvim-lua/plenary.nvim
-- https://github.com/kyazdani42/nvim-web-devicons
-- https://github.com/MunifTanjim/nui.nvim
--
-- ## User Interface
-- https://github.com/EdenEast/nightfox.nvim
-- https://github.com/nvim-lualine/lualine.nvim
-- https://github.com/nvim-telescope/telescope.nvim
----------------------
-- https://github.com/feline-nvim/feline.nvim
-- https://github.com/sidebar-nvim/sidebar.nvim
-- https://github.com/ghillb/cybu.nvim
-- https://github.com/sindrets/winshift.nvim
-- https://github.com/petertriho/nvim-scrollbar
--
-- ## File Manager 
-- https://github.com/nvim-neo-tree/neo-tree.nvim
----------------------
-- https://github.com/kyazdani42/nvim-tree.lua
--
-- ## Editor
-- https://github.com/karb94/neoscroll.nvim
-- https://github.com/lukas-reineke/indent-blankline.nvim
----------------------
-- https://github.com/mg979/vim-visual-multi
-- https://github.com/azabiong/vim-highlighter
--
-- ## LSP
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/L3MON4D3/LuaSnip
-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/hrsh7th/cmp-nvim-lsp
-- https://github.com/hrsh7th/cmp-buffer
-- https://github.com/hrsh7th/cmp-path
-- https://github.com/hrsh7th/cmp-cmdline
-- https://github.com/hrsh7th/cmp-nvim-lua
-- https://github.com/saadparwaiz1/cmp_luasnip
-- https://github.com/petertriho/cmp-git
----------------------
-- https://github.com/neoclide/coc.nvim
-- https://github.com/jose-elias-alvarez/null-ls.nvim
-- https://github.com/jamespwilliams/neovim-go-nix-develop
-- https://github.com/folke/trouble.nvim
--
-- ## Tools
-- https://github.com/NTBBloodbath/rest.nvim
--
-- ## Git
-- https://github.com/kdheepak/lazygit.nvim
-- https://github.com/tpope/vim-fugitive
-- https://github.com/lewis6991/gitsigns.nvim
-- https://github.com/axkirillov/telescope-changed-files
--
-- ## Terminal
-- https://github.com/voldikss/vim-floaterm
-- https://github.com/akinsho/toggleterm.nvim
-- https://github.com/hkupty/nvimux
--
--
