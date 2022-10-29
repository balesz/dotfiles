local M = {}

function M.setup(use)
  --
  -- https://github.com/lewis6991/gitsigns.nvim
  --
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {}
    end
  }
end

local ok, toggleterm = pcall(require, "toggleterm.terminal")
if not ok then return end

local lazygit = toggleterm.Terminal:new {
  cmd = "lazygit",
  direction = "float",
  close_on_exit = true,
  hidden = true,
}

vim.keymap.set("", "<Leader>gl", function()
  lazygit:toggle()
end, { desc = "Open layzgit" })

return M
