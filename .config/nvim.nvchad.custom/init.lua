-- ui
vim.cmd [[
  set guifont=JetBrainsMono\ Nerd\ Font:h11
  set colorcolumn=120
]]

-- indent
vim.cmd [[
  set tabstop=2
  'set expandtab
  set shiftwidth=2
  set autoindent
  set smartindent
]]

-- lsp
vim.cmd [[
  highlight! default link LspCodeLens Comment
]]

-- dart
vim.g['dart_style_guide'] = 2
vim.g['dart_format_on_save'] = 1
vim.g['dartfmt_options'] = {'-l 120'}

-- terminal
vim.cmd [[
  autocmd TermOpen * setlocal nonumber norelativenumber
]]

