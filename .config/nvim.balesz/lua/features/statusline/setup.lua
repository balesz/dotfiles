require("lualine").setup {
  options = {
    theme = "nord",
    globalstatus = true,
    ignore_focus = {
      "neo-tree",
    },
  }
}

vim.opt.laststatus = 3
vim.opt.showmode = false
