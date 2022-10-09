local autogrp = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local set = vim.wo

autogrp("BaleszTerminal", {clear=true})

autocmd({"TermOpen"}, {
  pattern = "*",
  group = "BaleszTerminal",
  callback = function()
    set.number = false
    set.relativenumber = false
  end
})

