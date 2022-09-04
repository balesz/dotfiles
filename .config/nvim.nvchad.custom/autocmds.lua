local autogroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autogroup('Balesz', { clear = true })

autocmd('FileType', {
  group = 'Balesz',
  pattern = 'help',
  callback = function ()
    vim.wo.foldcolumn = '0'
    vim.wo.foldenable = false
  end
})

autocmd('FileType', {
  group = 'Balesz',
  pattern = 'make',
  callback = function ()
    vim.bo.expandtab = false
  end
})

autocmd('TermOpen', {
  group = 'Balesz',
  pattern = '*',
  callback = function ()
    vim.wo.foldcolumn = '0'
    vim.wo.foldenable = false
    vim.wo.number = false
    vim.wo.relativenumber = false
  end
})

