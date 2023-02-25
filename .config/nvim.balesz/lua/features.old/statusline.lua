local M = {}

function M.setup(use)
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("lualine").setup {
        options = {
          theme = "nord",
          globalstatus = true,
          ignore_focus = {
            "neo-tree",
          },
        }
      }
    end
  }
end

vim.opt.laststatus = 3
vim.opt.showmode = false

return M
