local M = {}

function M.setup(use)
  --
  -- https://github.com/akinsho/toggleterm.nvim
  --
  use {
    "akinsho/toggleterm.nvim",
    tag = '*',
    config = function()
      require("toggleterm").setup {}
    end, 
  }
end

vim.api.nvim_set_keymap("t", "<C-x>", "<C-\\><C-n>", {noremap=true})

vim.api.nvim_create_augroup("BaleszTerminal", {clear=true})
vim.api.nvim_create_autocmd({"TermOpen"}, {
  pattern = "*",
  group = "BaleszTerminal",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd 'startinsert'
  end
})

return M