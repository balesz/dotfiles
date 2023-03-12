return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    init = function()
      vim.cmd "colorscheme tokyonight-storm"
    end
  },
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    init = function()
      --vim.cmd "colorscheme nordfox"
    end,
  },
  {
    "catppuccin/nvim",
    priority = 1000,
    init = function()
      --vim.cmd "colorscheme catppuccin-mocha"
    end,
  },
}
