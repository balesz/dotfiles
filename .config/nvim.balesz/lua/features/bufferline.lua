local M = {}

function M.setup(use)
  use {
    "famiu/bufdelete.nvim",
  }
  use {
    "romgrk/barbar.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    disable = false,
    config = function()
      require("bufferline").setup {
        animation = true,
        auto_hide = false,
        tabpages = true,
        closable = true,
        clickable = true,
        icons = true,
        no_name_title = "empty",
      }
    end,
    setup = function()
      vim.keymap.set("n", "<TAB>", "<cmd>BufferNext<CR>")
      vim.keymap.set("n", "<S-TAB>", "<cmd>BufferPrevious<CR>")
      vim.keymap.set("n", "<Leader>t<TAB>", "<cmd>BufferMoveNext<CR>")
      vim.keymap.set("n", "<Leader>t<S-TAB>", "<cmd>BufferMovePrevious<CR>")
      vim.keymap.set("n", "x", "<Cmd>BufferClose<CR>")
      vim.api.nvim_create_user_command("BaleszBuffDelete", "BufferClose", {})
    end
  }
  use {
    "akinsho/bufferline.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    tag = "v3.*",
    disable = true,
    config = function()
      require("bufferline").setup {}
    end,
    setup = function()
      vim.keymap.set("n", "<TAB>", "<cmd>BufferLineCycleNext<CR>")
      vim.keymap.set("n", "<S-TAB>", "<cmd>BufferLineCyclePrev<CR>")
      vim.keymap.set("n", "<Leader>t<TAB>", "<cmd>BufferLineMoveNext<CR>")
      vim.keymap.set("n", "<Leader>t<S-TAB>", "<cmd>BufferLineMovePrev<CR>")
      vim.keymap.set("n", "x", "<Cmd>Bdelete<CR>")
      vim.api.nvim_create_user_command("BaleszBuffDelete", "Bdelete", {})
    end
  }
end

function M.close()
  vim.cmd "BaleszBuffDelete"
end

return M
