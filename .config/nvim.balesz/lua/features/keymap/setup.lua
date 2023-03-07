if pcall(require, "which-key") then
  require("which-key").setup {}
end

if pcall(require, "legendary") then
  require("legendary").setup {}
end

vim.keymap.set("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>',
  { noremap = true, silent = true })

vim.keymap.set("n", "q", "<cmd>quit<CR>", { noremap = true })
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch|diffupdate|normal! <C-L><CR>",
  { noremap = true })
vim.keymap.set("n", "<C-s>", function()
  if vim.bo.modified then vim.cmd("w!") end
end, { noremap = true })

vim.keymap.set("n", "<Leader>h", "<C-w><Left>", { noremap = true })
vim.keymap.set("n", "<Leader>l", "<C-w><Right>", { noremap = true })
vim.keymap.set("n", "<Leader>j", "<C-w><Down>", { noremap = true })
vim.keymap.set("n", "<Leader>k", "<C-w><Up>", { noremap = true })

vim.keymap.set("n", "<C-h>", "<Home>", { noremap = true })
vim.keymap.set("n", "<C-l>", "<End>", { noremap = true })

vim.keymap.set("i", "<C-h>", "<Left>", { noremap = true })
vim.keymap.set("i", "<C-l>", "<Right>", { noremap = true })
vim.keymap.set("i", "<C-j>", "<Down>", { noremap = true })
vim.keymap.set("i", "<C-k>", "<Up>", { noremap = true })
vim.keymap.set("i", "<C-d>", "<Del>", { noremap = true })

vim.keymap.set("c", "<C-h>", "<Left>", { noremap = true })
vim.keymap.set("c", "<C-l>", "<Right>", { noremap = true })
vim.keymap.set("c", "<C-j>", "<Down>", { noremap = true })
vim.keymap.set("c", "<C-k>", "<Up>", { noremap = true })
vim.keymap.set("c", "<C-d>", "<Del>", { noremap = true })
