local M = {}

function M.setup(use)
  use {
    "famiu/bufdelete.nvim",
  }
  use {
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      local close_command = "BaleszBuffDelete %d"
      require("bufferline").setup {
        options = {
          close_command = close_command,
          right_mouse_command = close_command,
          middle_mouse_command = close_command,
          separator_style = "slant",
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              text_align = "center",
              separator = true,
            },
          },
        }
      }
    end,
    setup = function()
      vim.keymap.set("n", "<TAB>", "<cmd>BufferLineCycleNext<CR>")
      vim.keymap.set("n", "<S-TAB>", "<cmd>BufferLineCyclePrev<CR>")
      vim.keymap.set("n", "<Leader>t<TAB>", "<cmd>BufferLineMoveNext<CR>")
      vim.keymap.set("n", "<Leader>t<S-TAB>", "<cmd>BufferLineMovePrev<CR>")
    end
  }
  use {
    "ghillb/cybu.nvim",
    branch = "main",
    requires = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
    disable = false,
    config = function()
      require("cybu").setup {}
    end,
    setup = function()
      --vim.keymap.set("n", "K", "<Plug>(CybuPrev)")
      --vim.keymap.set("n", "J", "<Plug>(CybuNext)")
      vim.keymap.set({ "n", "v" }, "<Tab>", "<Plug>(CybuLastusedNext)")
      vim.keymap.set({ "n", "v" }, "<S-Tab>", "<Plug>(CybuLastusedPrev)")
    end
  }
end

function M.close() vim.cmd "Bdelete" end

vim.keymap.set("n", "x", M.close)

return M
