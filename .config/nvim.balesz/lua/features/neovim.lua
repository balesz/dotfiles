local M = {}
local map = vim.api.nvim_set_keymap

function M.setup(use)
end

vim.g.mapleader = " "

map("n", "q", "<cmd>quit<CR>", {noremap=true})
map("n", "<Esc>", "<Cmd>nohlsearch|diffupdate|normal! <C-L><CR>", {noremap=true})
map("n", "<C-s>", "<cmd>w!<CR>", {noremap=true})
map("v", "<C-h>", "y:help <C-R>\"<CR>", {noremap=true})

map("n", "<A-h>", "<C-w><Left>", {noremap=true})
map("n", "<A-l>", "<C-w><Right>", {noremap=true})
map("n", "<A-j>", "<C-w><Down>", {noremap=true})
map("n", "<A-k>", "<C-w><Up>", {noremap=true})

map("n", "<C-h>", "<Home>", {noremap=true})
map("n", "<C-l>", "<End>", {noremap=true})
map("n", "<C-j>", "<PageDown>", {noremap=true})
map("n", "<C-k>", "<PageUp>", {noremap=true})

map("i", "<A-h>", "<Home>", {noremap=true})
map("i", "<A-l>", "<End>", {noremap=true})
map("i", "<A-j>", "<PageDown>", {noremap=true})
map("i", "<A-k>", "<PageUp>", {noremap=true})
map("i", "<C-h>", "<Left>", {noremap=true})
map("i", "<C-l>", "<Right>", {noremap=true})
map("i", "<C-j>", "<Down>", {noremap=true})
map("i", "<C-k>", "<Up>", {noremap=true})

return M
