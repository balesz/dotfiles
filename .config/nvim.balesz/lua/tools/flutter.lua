local M = {}

function M.setup(use)
  use {
    "akinsho/flutter-tools.nvim",
    requires = "nvim-lua/plenary.nvim",
    disable = true,
    config = function()
      require("flutter-tools").setup {}
    end
  }
end

return M
