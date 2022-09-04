require('custom.autocmds')

local font = 'JetBrainsMono Nerd Font:h11'
if (os.getenv('WSLENV') or os.getenv('DOCKERENV')) then
  font = 'JetBrainsMono NF:h11'
end

-- common
vim.o.syntax = 'on'
vim.o.exrc = false

-- ui
vim.o.guifont = font
vim.o.colorcolumn = 120

-- indent
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.o.smartindent = true

-- folding
vim.o.foldcolumn = '1'
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

-- dart
vim.g.dart_style_guide = 2
vim.g.dart_format_on_save = 1
vim.g.dartfmt_options = {'-l 120'}

-- flutter
vim.g.flutter_hot_reload_on_save = 1
vim.g.flutter_show_log_on_run = 'hidden'
vim.g.flutter_show_log_on_attach = 'hidden'
vim.g.flutter_autoscroll = 1
vim.g.flutter_use_last_run_option = 1
vim.g.flutter_use_last_attach_option = 1

