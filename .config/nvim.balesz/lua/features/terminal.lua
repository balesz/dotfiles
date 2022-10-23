local M = {}

function M.setup(use)
  use {
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("toggleterm").setup {}
    end
  }
  use {
    "voldikss/vim-floaterm",
    disable = true,
  }
end

vim.api.nvim_create_augroup("BaleszTerminal", {})
vim.api.nvim_create_autocmd({ "TermOpen" }, {
  pattern = "*",
  group = "BaleszTerminal",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd "startinsert"
  end
})
vim.api.nvim_create_autocmd({ "TermClose" }, {
  pattern = "*",
  group = "BaleszTerminal",
  callback = function()
    local ok, bufferline = pcall(require, "features/bufferline")
    if not ok then return end
    pcall(bufferline.close)
  end
})

local floating = "<Cmd>ToggleTerm direction=float<CR>"
local horizontal = "<Cmd>ToggleTerm size=16 direction=horizontal<CR>"
local vertical = "<Cmd>ToggleTerm size=80 direction=vertical<CR>"

vim.keymap.set("", "<Leader>ti", floating)
vim.keymap.set("", "<Leader>th", horizontal)
vim.keymap.set("", "<Leader>tv", vertical)
vim.keymap.set("t", "<C-x>", "<C-\\><C-n>")

return M
