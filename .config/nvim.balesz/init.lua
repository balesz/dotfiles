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

require("lazy").setup("features")
require("features/autocompletion/setup")
require("features/buffer/setup")
require("features/colorscheme/setup")
require("features/dap/setup")
require("features/editor/setup")
require("features/filetree/setup")
require("features/git/setup")
require("features/gui/setup")
require("features/keymap/setup")
require("features/layout/setup")
require("features/lsp/setup")
require("features/mouse/setup")
require("features/outline/setup")
require("features/scroll/setup")
require("features/session/setup")
require("features/statusline/setup")
require("features/syntax/setup")
require("features/telescope/setup")
require("features/terminal/setup")
require("features/tools/setup")
require("features/ui/setup")
