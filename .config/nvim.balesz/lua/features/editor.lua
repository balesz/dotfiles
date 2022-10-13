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

vim.cmd [[
  set clipboard=unnamed
  set tabstop=2
  set shiftwidth=2
  set smarttab
  set autoindent
  set smartindent
  set expandtab
  set number
  set wrap
]]

return M
