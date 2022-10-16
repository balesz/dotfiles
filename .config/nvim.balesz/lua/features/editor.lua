local M = {}

function M.setup(use)
  --
  -- https://github.com/lukas-reineke/indent-blankline.nvim
  --
  use {
    'lukas-reineke/indent-blankline.nvim',
    event = "BufRead",
    config = function()
      require('indent_blankline').setup {
        char = '▏',
        indentLine_enabled = 1,
        show_current_context = true,
        show_current_context_start = true,
        show_end_of_line = false,
        show_trailing_blankline_indent = false,
        space_char_blankline = " ",
     }
    end
  }
  --
  -- https://github.com/karb94/neoscroll.nvim
  --
  use {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup {}
    end
  }
end

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

vim.opt_global.clipboard = "unnamed"
vim.opt_global.tabstop=2
vim.opt_global.shiftwidth=2
vim.opt_global.smarttab = true
vim.opt_global.autoindent = true
vim.opt_global.smartindent = true
vim.opt_global.expandtab = true
vim.opt_global.number = true
vim.opt_global.wrap = true

return M
