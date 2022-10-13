local M = {}

function M.setup(use)
end

vim.g.mapleader = "<Space>"

vim.api.nvim_set_keymap("", "<C-h>", "<HOME>", {noremap=true})
vim.api.nvim_set_keymap("", "<C-l>", "<END>", {noremap=true})
vim.api.nvim_set_keymap("n", "<ESC>", "<Cmd>nohlsearch|diffupdate|normal! <C-L><CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "q", "<cmd>:q<CR>", {noremap=true}) 
vim.api.nvim_set_keymap("n", "<C-s>", "<cmd>w!<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<C-h>", "y:help <C-R>\"<CR>", {noremap=true})

return M
