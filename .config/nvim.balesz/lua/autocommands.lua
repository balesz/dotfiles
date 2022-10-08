local autocmd = vim.api.nvim_create_autocmd
local set = vim.b

autocmd({"TermOpen"}, {
  pattern = "*",
  callback = function()
    set.number = false
    set.relativenumber = false
  end
})

