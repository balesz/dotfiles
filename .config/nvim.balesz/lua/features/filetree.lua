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
  use {
    "nvim-tree/nvim-tree.lua",
    disable = true,
    requires = "nvim-tree/nvim-web-devicons",
    tag = "nightly",
    config = function()
      require("nvim-tree").setup {
        sync_root_with_cwd = true,
        reload_on_bufenter = true,
        view = {
          side = "left",
          width = 40,
          adaptive_size = false,
          centralize_selection = true,
          preserve_window_proportions = true,
          signcolumn = "auto",
          mappings = {
            list = {
              { key = ".", action = "cd" },
              { key = "<A-r>", action = "run_file_command" },
              { key = "?", action = "toggle_help" },
            },
          },
        },
        renderer = {
          group_empty = true
        },
        update_focused_file = {
          enable = true,
          update_root = false,
        },
        filters = {
          dotfiles = false,
          custom = { "\\.git" },
        },
        diagnostics = {
          enable = true,
        },
      }
    end
  }
end

vim.keymap.set("", "<Leader>ft", function()
  if pcall(require, "neo-tree") then
    vim.cmd "NeoTreeFocusToggle"
  elseif pcall(require, "nvim-tree") then
    vim.cmd "NvimTreeFocus"
  end
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
