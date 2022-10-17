local M = {}

function M.setup(use)
  use {
    "folke/which-key.nvim",
    disable = false,
    config = function()
      require("which-key").setup {}
    end
  }
end

vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "q", "<cmd>quit<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Esc>", "<Cmd>nohlsearch|diffupdate|normal! <C-L><CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<C-s>", "<cmd>w!<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<C-h>", "y:help <C-R>\"<CR>", {noremap=true})

vim.api.nvim_set_keymap("", "<A-h>", "<Home>", {noremap=true})
vim.api.nvim_set_keymap("", "<A-l>", "<End>", {noremap=true})
vim.api.nvim_set_keymap("", "<A-j>", "<PageDown>", {noremap=true})
vim.api.nvim_set_keymap("", "<A-k>", "<PageUp>", {noremap=true})

vim.api.nvim_set_keymap("n", "<C-h>", "<C-w><Left>", {noremap=true})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w><Right>", {noremap=true})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w><Down>", {noremap=true})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w><Up>", {noremap=true})

vim.api.nvim_set_keymap("i", "<A-h>", "<Home>", {noremap=true})
vim.api.nvim_set_keymap("i", "<A-l>", "<End>", {noremap=true})
vim.api.nvim_set_keymap("i", "<A-j>", "<PageDown>", {noremap=true})
vim.api.nvim_set_keymap("i", "<A-k>", "<PageUp>", {noremap=true})
vim.api.nvim_set_keymap("i", "<C-h>", "<Left>", {noremap=true})
vim.api.nvim_set_keymap("i", "<C-l>", "<Right>", {noremap=true})
vim.api.nvim_set_keymap("i", "<C-j>", "<Down>", {noremap=true})
vim.api.nvim_set_keymap("i", "<C-k>", "<Up>", {noremap=true})

return M
