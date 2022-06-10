--
-- https://github.com/lukas-reineke/indent-blankline.nvim
--
return {
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

