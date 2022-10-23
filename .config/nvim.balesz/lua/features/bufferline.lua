local M = {}

function M.setup(use)
  --
  -- https://github.com/romgrk/barbar.nvim
  --
  use {
    "romgrk/barbar.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("bufferline").setup {
        animation = true,
        auto_hide = false,
        tabpages = true,
        closable = true,
        clickable = true,
        icons = true,
      }
    end
  }
end

function M.close()
  vim.cmd "BufferClose"
end

vim.keymap.set("n", "<TAB>", "<cmd>BufferNext<CR>")
vim.keymap.set("n", "<S-TAB>", "<cmd>BufferPrevious<CR>")
vim.keymap.set("n", "<Leader>t<TAB>", "<cmd>BufferMoveNext<CR>")
vim.keymap.set("n", "<Leader>t<S-TAB>", "<cmd>BufferMovePrevious<CR>")
vim.keymap.set("n", "x", "<cmd>BufferDelete<CR>")

return M
