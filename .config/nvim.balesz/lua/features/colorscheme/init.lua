return {
  {
    "EdenEast/nightfox.nvim", priority = 1000,
    config = function()
      require("nightfox").setup {}
    end,
    init = function()
      vim.cmd "colorscheme nordfox"
    end,
  },
  {
    "catppuccin/nvim", priority = 1000,
    config = function()
      require("catppuccin").setup {}
    end,
    init = function()
      --vim.cmd "colorscheme catppuccin-mocha"
    end,
  },
}
