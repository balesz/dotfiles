local M = {}

local ok_terminal, toggleterm = pcall(require, "toggleterm.terminal")

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

if ok_terminal then
  local lazygit = toggleterm.Terminal:new {
    cmd = "lazygit",
    direction = "float",
    close_on_exit = true,
    hidden = true,
  }

  vim.keymap.set("", "<Leader>gl", function()
    lazygit:toggle()
  end, { desc = "Open layzgit" })
end

return M
