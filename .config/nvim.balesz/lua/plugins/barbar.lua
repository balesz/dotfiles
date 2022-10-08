--
-- https://github.com/romgrk/barbar.nvim
--
return {
  'romgrk/barbar.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      animation = true,
      auto_hide = false,
      tabpages = true,
      closable = true,
      clickable = true,
      icons = true,
    }
  end
}
