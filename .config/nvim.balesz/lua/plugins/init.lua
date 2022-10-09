require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- User Interface
  use(require'plugins/nightfox')
  use(require'plugins/statusline')
  use(require'plugins/bufferline')
  use(require'plugins/telescope')

  -- File Manager
  use(require'plugins/filetree')

  -- Editor
  use(require'plugins/neoscroll')
  use(require'plugins/indent-blankline')

  -- LSP / Autocompletion
  use(require'plugins/nvim-treesitter')
  --use 'L3MON4D3/LuaSnip'
  --use 'williamboman/nvim-lsp-installer'
  --use 'neovim/nvim-lspconfig' 
  --use { 'hrsh7th/nvim-cmp', config = require'plugins/nvim-cmp' }
  --use 'hrsh7th/cmp-nvim-lsp'
  --use 'hrsh7th/cmp-buffer'
  --use 'hrsh7th/cmp-path'
  --use 'hrsh7th/cmp-cmdline'
  --use 'hrsh7th/cmp-nvim-lua'
  --use 'saadparwaiz1/cmp_luasnip'
  --use { 'petertriho/cmp-git', requires = 'nvim-lua/plenary.nvim' }

  -- Tools
  use(require'plugins/rest-nvim')
end)

--
--
-- ## Common
-- https://github.com/MunifTanjim/nui.nvim
--
-- ## User Interface
-- https://github.com/feline-nvim/feline.nvim
-- https://github.com/sidebar-nvim/sidebar.nvim
-- https://github.com/ghillb/cybu.nvim
-- https://github.com/sindrets/winshift.nvim
-- https://github.com/petertriho/nvim-scrollbar
--
-- ## File Manager 
-- https://github.com/kyazdani42/nvim-tree.lua
--
-- ## Editor
-- https://github.com/mg979/vim-visual-multi
-- https://github.com/azabiong/vim-highlighter
--
-- ## LSP
-- https://github.com/neoclide/coc.nvim
-- https://github.com/jose-elias-alvarez/null-ls.nvim
-- https://github.com/jamespwilliams/neovim-go-nix-develop
-- https://github.com/folke/trouble.nvim
--
-- ## Tools
-- https://github.com/akinsho/flutter-tools.nvim
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
