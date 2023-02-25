local M = {}

function M.setup(use)
  use {
    "mfussenegger/nvim-dap",
    config = function()
      require("languages/dart").dap_setup()
    end,
  }
  use {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup {}
    end,
  }
end

return M
