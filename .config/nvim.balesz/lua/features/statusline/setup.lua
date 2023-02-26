vim.opt.laststatus = 3
vim.opt.showmode = false

if pcall(require, "lualine") then
  require("lualine").setup {
    options = {
      theme = "nord",
      globalstatus = true,
      ignore_focus = {
        "neo-tree",
      },
    }
  }
end
