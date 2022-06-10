--
-- https://github.com/nvim-lualine/lualine.nvim
--
return {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  config = function()
    require('lualine').setup {
      options = { theme = 'gruvbox' }
    }
  end
}
