local M = {}
local map = vim.api.nvim_set_keymap

function M.setup(use)
  --
  -- https://github.com/nvim-neo-tree/neo-tree.nvim
  --
  use {
    'nvim-neo-tree/neo-tree.nvim',
    disable = false,
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require('neo-tree').setup {} 
    end
  }
  --
  -- https://github.com/nvim-tree/nvim-tree.lua
  --
  use {
    "nvim-tree/nvim-tree.lua",
    disable = true,
    requires = "nvim-tree/nvim-web-devicons",
    tag = "nightly",
    config = function()
      require("nvim-tree").setup {
        view = {
          side = "right",
          preserve_window_proportions = true,
        }
      }
    end
  }
end

map("", "<Leader><A-n>", "<Cmd>NeoTreeShow<CR>", {noremap=true})

return M
