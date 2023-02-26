if pcall(require, "gitsigns") then
  require("gitsigns").setup {}
end

if pcall(require, "scrollbar") then
  require("scrollbar.handlers.gitsigns").setup()
end

if pcall(require, "toggleterm") then
  local lazygit = require("toggleterm.terminal").Terminal:new {
    cmd = "lazygit",
    direction = "float",
    close_on_exit = true,
    hidden = true,
  }
  vim.keymap.set("", "<Leader>gl", function()
    lazygit:toggle()
  end, { desc = "Open layzgit" })
end
