local M = {}

local ok_terminal, toggleterm = pcall(require, "toggleterm.terminal")

function M.setup(use)
  use {
    "nvim-neo-tree/neo-tree.nvim",
    disable = false,
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup {
        source_selector = {
          winbar = true,
        },
        filesystem = {
          follow_current_file = true,
          use_libuv_file_watcher = true,
        },
        buffers = {
          follow_current_file = true,
        },
        window = {
          mappings = {
            ["<A-h>"] = "prev_source",
            ["<A-l>"] = "next_source",
          },
        },
      }
    end
  }
end

vim.keymap.set("", "<Leader>ft", function()
  vim.cmd "NeoTreeFocusToggle"
end, { desc = "Open Neo-tree" })

if ok_terminal then
  local goful = toggleterm.Terminal:new {
    cmd = "goful",
    direction = "float",
    close_on_exit = true,
    hidden = true,
  }
  vim.keymap.set("", "<Leader>fg", function()
    goful:toggle()
  end, { desc = "Open goful" })
end

return M
