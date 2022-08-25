local set = vim.o
local global = vim.g
local autocmd = vim.api.nvim_create_autocmd

local font = 'JetBrainsMono Nerd Font:h11'
if (os.getenv('WSLENV') or os.getenv('DOCKERENV')) then
  font = 'JetBrainsMono NF:h11'
end

set.syntax = 'on'
set.exrc = false

-- ui
set.guifont = font
set.colorcolumn = 120

-- indent
set.tabstop = 2
set.expandtab = true
set.shiftwidth = 2
set.autoindent = true
set.smartindent = true

-- folding
--set.foldcolumn = "1"
--set.foldlevel = 99
--set.foldlevelstart = 99
--set.foldenable = false

-- dart
global.dart_style_guide = 2
global.dart_format_on_save = 1
global.dartfmt_options = {'-l 120'}

-- flutter
global.flutter_hot_reload_on_save = 1
global.flutter_show_log_on_run = 'hidden'
global.flutter_show_log_on_attach = 'hidden'
global.flutter_autoscroll = 1
global.flutter_use_last_run_option = 1
global.flutter_use_last_attach_option = 1

-- terminal
-- autocmd('TermOpen', { pattern = '*', callback = function ()
--   vim.wo.number = false
--   vim.wo.relativenumber = false
-- end })

-- Makefile
autocmd('FileType', { pattern = 'make', callback = function ()
  vim.bo.expandtab = false
end })

