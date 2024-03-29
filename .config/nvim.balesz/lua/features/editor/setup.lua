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

if pcall(require, "indent_blankline") then
  require("indent_blankline").setup {
    indentLine_enabled = 1,
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
    show_trailing_blankline_indent = false,
    space_char_blankline = " ",
  }
end

if pcall(require, "nvim-navic") then
  require("nvim-navic").setup {}
end

if pcall(require, "twilight") then
  require("twilight").setup {}
end

if pcall(require, "zen-mode") then
  require("zen-mode").setup {}
end
