require("gitsigns").setup {}

require("scrollbar.handlers.gitsigns").setup()

import("toggleterm.terminal", function(toggleterm)
  local lazygit = toggleterm.Terminal:new {
    cmd = "lazygit",
    direction = "float",
    close_on_exit = true,
    hidden = true,
  }
  vim.keymap.set("", "<Leader>gl", function()
    lazygit:toggle()
  end, { desc = "Open layzgit" })
end, {})
