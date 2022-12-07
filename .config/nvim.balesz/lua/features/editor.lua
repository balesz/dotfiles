local M = {}

function M.setup(use)
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
      require("indent_blankline").setup {
        indentLine_enabled = 1,
        show_current_context = true,
        show_current_context_start = true,
        show_end_of_line = true,
        show_trailing_blankline_indent = false,
        space_char_blankline = " ",
      }
    end
  }
  use {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup {}
    end
  }
  use {
    "SmiteshP/nvim-navic",
    config = function()
      require("nvim-navic").setup {}
    end
  }
end

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

return M
