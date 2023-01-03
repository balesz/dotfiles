local M = {}

function M.setup(use)
  use {
    "folke/which-key.nvim",
    disable = false,
    config = function()
      require("which-key").setup {}
    end
  }
  use {
    "mrjones2014/legendary.nvim",
    disable = false,
    config = function()
      require("legendary").setup {}
    end
  }
end

vim.g.mapleader = " "

vim.keymap.set("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>',
  { noremap = true, silent = true })

vim.keymap.set("n", "q", "<cmd>quit<CR>", { noremap = true })
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch|diffupdate|normal! <C-L><CR>",
  { noremap = true })
vim.keymap.set("n", "<C-s>", "<cmd>w!<CR>", { noremap = true })
vim.keymap.set("v", "<C-h>", "y:help <C-R>\"<CR>", { noremap = true })

vim.keymap.set("", "<A-h>", "<Home>", { noremap = true })
vim.keymap.set("", "<A-l>", "<End>", { noremap = true })
vim.keymap.set("", "<A-j>", "<PageDown>", { noremap = true })
vim.keymap.set("", "<A-k>", "<PageUp>", { noremap = true })

vim.keymap.set("n", "<C-h>", "<C-w><Left>", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w><Right>", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w><Down>", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w><Up>", { noremap = true })

vim.keymap.set("i", "<A-h>", "<Home>", { noremap = true })
vim.keymap.set("i", "<A-l>", "<End>", { noremap = true })
vim.keymap.set("i", "<A-j>", "<PageDown>", { noremap = true })
vim.keymap.set("i", "<A-k>", "<PageUp>", { noremap = true })
vim.keymap.set("i", "<C-h>", "<Left>", { noremap = true })
vim.keymap.set("i", "<C-l>", "<Right>", { noremap = true })
vim.keymap.set("i", "<C-j>", "<Down>", { noremap = true })
vim.keymap.set("i", "<C-k>", "<Up>", { noremap = true })
vim.keymap.set("i", "<C-d>", "<Del>", { noremap = true })

vim.keymap.set("c", "<A-h>", "<Home>", { noremap = true })
vim.keymap.set("c", "<A-l>", "<End>", { noremap = true })
vim.keymap.set("c", "<C-h>", "<Left>", { noremap = true })
vim.keymap.set("c", "<C-l>", "<Right>", { noremap = true })
vim.keymap.set("c", "<C-j>", "<Down>", { noremap = true })
vim.keymap.set("c", "<C-k>", "<Up>", { noremap = true })
vim.keymap.set("c", "<C-d>", "<Del>", { noremap = true })

return M
