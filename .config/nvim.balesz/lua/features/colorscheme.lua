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
end

if pcall(require, 'nightfox') then
  vim.cmd 'colorscheme nordfox'
end

local font = "FiraCode Nerd Font:h12"
if os.getenv("WSL_DISTRO_NAME") ~= "" then
  font = "FiraCode NF:h12"
end

vim.opt_global.guifont = font

return M
