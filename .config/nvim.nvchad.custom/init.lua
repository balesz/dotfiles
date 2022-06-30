local set = vim.opt

local font = 'JetBrainsMono Nerd Font:h11'
if (os.getenv 'WSL_DISTRO_NAME') then
  font = 'JetBrainsMono NF:h11'
end

-- ui
set.guifont = font
set.colorcolumn = 120

-- indent
set.tabstop = 2
--set.expandtab = true
set.shiftwidth = 2
set.autoindent = true
set.smartindent = true

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

