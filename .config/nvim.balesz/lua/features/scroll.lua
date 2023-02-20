local M = {}

function M.setup(use)
  use {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup {}
    end
  }
  use {
    "petertriho/nvim-scrollbar",
    disable = true,
    config = function()
      require("scrollbar").setup {
        excluded_filetypes = {
          "prompt",
          "TelescopePrompt",
          "noice",
          "neo-tree",
        },
      }
    end
  }
end

return M
