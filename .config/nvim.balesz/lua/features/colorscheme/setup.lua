if pcall(require, "nightfox") then
  require("nightfox").setup {}
end

if pcall(require, "catppuccin") then
  require("catppuccin").setup {}
end

vim.cmd [[hi VertSplit guifg=#4c566a]]
