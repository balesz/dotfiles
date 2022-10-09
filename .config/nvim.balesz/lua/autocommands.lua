local autocmd = vim.api.nvim_create_autocmd
local set = vim.wo

autocmd({"TermOpen"}, {
  pattern = "*",
  once = true,
  callback = function()
    set.number = false
    set.relativenumber = false
  end
})

