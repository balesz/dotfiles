vim.env.PATH = vim.fn.system("echo $PATH"):gsub("\n", "")

vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- setup lazy.nvim
require("lazy").setup("plugins")

-- loading import.nvim
require("import")

-- setting up features
require("plugins/appearance/setup")
require("plugins/filetree/setup")
require("plugins/keymap/setup")
