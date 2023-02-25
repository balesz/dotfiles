local M = {}

function M.setup(use)
  use {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup {
        highlight_hovered_item = false,
      }
    end
  }
end

return M
