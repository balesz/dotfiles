require("indent_blankline").setup {
  indentLine_enabled = 1,
  show_current_context = true,
  show_current_context_start = true,
  show_end_of_line = true,
  show_trailing_blankline_indent = false,
  space_char_blankline = " ",
}

require("nvim-navic").setup {}

vim.opt.colorcolumn = "80"
vim.opt.cursorline = true

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
vim.opt.listchars:append "tab: ⋅"

vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.wrap = true
