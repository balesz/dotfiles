local autogrp = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local setlocal = vim.opt_local 

autogrp("BaleszTerminal", {clear=true})

autocmd({"TermOpen"}, {
  pattern = "*",
  group = "BaleszTerminal",
  callback = function()
    setlocal.number = false
    setlocal.relativenumber = false
  end
})

