local M = {}

function M.setup(use)
  --
  -- https://github.com/romgrk/barbar.nvim
  --
  use {
    'romgrk/barbar.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('bufferline').setup {
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

vim.keymap.set("n", "<TAB>", "<cmd>BufferNext<CR>", {noremap=true})
vim.keymap.set("n", "<S-TAB>", "<cmd>BufferPrevious<CR>", {noremap=true})
vim.keymap.set("n", "<C-TAB>", "<cmd>BufferMoveNext<CR>", {noremap=true})
vim.keymap.set("n", "<S-C-TAB>", "<cmd>BufferMovePrevious<CR>", {noremap=true})
vim.keymap.set("n", "x", "<cmd>BufferDelete<CR>", {noremap=true})

return M
