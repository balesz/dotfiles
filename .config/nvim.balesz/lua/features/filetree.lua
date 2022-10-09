local M = {}

M.setup = function(use) 
  use neo_tree
end

--
-- https://github.com/nvim-neo-tree/neo-tree.nvim
--
local neo_tree = {
  'nvim-neo-tree/neo-tree.nvim',
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
local nvim_tree = {
  "nvim-tree/nvim-tree.lua",
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

return M
