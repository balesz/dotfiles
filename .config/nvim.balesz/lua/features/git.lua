local M = {}

function M.setup(use)
  --
  -- https://github.com/lewis6991/gitsigns.nvim
  --
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {}
    end
  }
end

return M
