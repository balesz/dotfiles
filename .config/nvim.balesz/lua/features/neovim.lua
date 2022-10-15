local M = {}

function M.setup(use)
end

vim.g.mapleader = "<Space>"

vim.api.nvim_set_keymap("n", "q", "<cmd>quit<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<ESC>", "<Cmd>nohlsearch|diffupdate|normal! <C-L><CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<C-s>", "<cmd>w!<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<C-h>", "y:help <C-R>\"<CR>", {noremap=true})

vim.api.nvim_set_keymap("", "<C-h>", "<HOME>", {noremap=true})
vim.api.nvim_set_keymap("", "<C-l>", "<END>", {noremap=true})
vim.api.nvim_set_keymap("i", "<C-S-h>", "<Home>", {noremap=true})
vim.api.nvim_set_keymap("i", "<C-h>", "<Left>", {noremap=true})
vim.api.nvim_set_keymap("i", "<C-l>", "<Right>", {noremap=true})
vim.api.nvim_set_keymap("i", "<C-j>", "<Down>", {noremap=true})
vim.api.nvim_set_keymap("i", "<C-k>", "<Up>", {noremap=true})
vim.api.nvim_set_keymap("i", "<C-S-l>", "<End>", {noremap=true})

return M
