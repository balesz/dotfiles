local map = vim.api.nvim_set_keymap
local noremap = {noremap=true}

-- common
map("", "<C-h>", "<HOME>", noremap)
map("", "<C-l>", "<END>", noremap)

-- normal
map("n", "q", "<cmd>q<CR>", noremap) 
map("n", "x", "<cmd>bd<CR>", noremap)
map("n", "<C-s>", "<cmd>w!<CR>", noremap)

-- visual
map("v", "<C-h>", "y:help <C-R>\"<CR>", noremap)

-- barbar
map("n", "<TAB>", "<cmd>BufferNext<CR>", noremap)
map("n", "<S-TAB>", "<cmd>BufferPrevious<CR>", noremap)
map("n", "<C-TAB>", "<cmd>BufferMoveNext<CR>", noremap)
map("n", "<S-C-TAB>", "<cmd>BufferMovePrevious<CR>", noremap)

