local M = {}

function M.setup(use)
  use {
    "mfussenegger/nvim-dap"
  }
  use {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup {}
    end,
  }
end

return M
