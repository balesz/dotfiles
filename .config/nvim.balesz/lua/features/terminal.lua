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
    end
  }
end

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

vim.api.nvim_set_keymap("", "<Leader><A-f>", "<Cmd>ToggleTerm direction=float<CR>", {noremap=true})
vim.api.nvim_set_keymap("", "<Leader><A-h>", "<Cmd>ToggleTerm size=16 direction=horizontal<CR>", {noremap=true})
vim.api.nvim_set_keymap("", "<Leader><A-v>", "<Cmd>ToggleTerm size=80 direction=vertical<CR>", {noremap=true})
vim.api.nvim_set_keymap("t", "<C-x>", "<C-\\><C-n>", {noremap=true})

return M
