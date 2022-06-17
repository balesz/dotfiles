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

-- dart
vim.g['dart_style_guide'] = 2
vim.g['dart_format_on_save'] = 1
vim.g['dartfmt_options'] = {'-l 120'}

-- flutter
vim.g['flutter_hot_reload_on_save'] = 1
vim.g['flutter_show_log_on_run'] = 'hidden'
vim.g['flutter_show_log_on_attach'] = 'hidden'
vim.g['flutter_autoscroll'] = 1
vim.g['flutter_use_last_run_option'] = 1
vim.g['flutter_use_last_attach_option'] = 1

-- terminal
vim.cmd [[
  autocmd TermOpen * setlocal nonumber norelativenumber
]]

