local M = {}

M.setup = function(use)
  --
  -- https://github.com/lukas-reineke/indent-blankline.nvim
  --
  use {
    'lukas-reineke/indent-blankline.nvim',
    event = "BufRead",
    config = function()
      require('indent_blankline').setup {
        indentLine_enabled = 1,
        char = '▏',
        show_trailing_blankline_indent = false,
        show_end_of_line = true,
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

return M
