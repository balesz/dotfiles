local M = {}

function M.setup(use)
  use {
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("toggleterm").setup {
        auto_scroll = true,
        close_on_exit = false,
        hide_numbers = true,
        persist_mode = false,
        persist_size = false,
        shade_terminals = false,
        start_in_insert = true,
      }
    end
  }
end

vim.api.nvim_create_augroup("BaleszTerminal", {})

vim.api.nvim_create_autocmd({ "TermClose" }, {
  pattern = "*",
  group = "BaleszTerminal",
  callback = function()
    local ok, bufferline = pcall(require, "features/bufferline")
    if not ok then return end
    pcall(bufferline.close)
  end
})

local ok, toggleterm = pcall(require, "toggleterm.terminal")
if not ok then return end

local horizontal = toggleterm.Terminal:new {
  cmd = "tmux",
  direction = "horizontal",
  hidden = true,
}

local vertical = toggleterm.Terminal:new {
  cmd = "tmux",
  direction = "vertical",
  hidden = true,
}

local float = toggleterm.Terminal:new {
  cmd = "tmux",
  direction = "float",
  hidden = true,
}

vim.keymap.set("t", "<C-x>", "<C-\\><C-n>")

vim.keymap.set("", "<Leader>th", function()
  vertical:close()
  horizontal:toggle(vim.o.lines * 0.3)
end)

vim.keymap.set("", "<Leader>tv", function()
  horizontal:close()
  vertical:toggle(vim.o.columns * 0.3)
end)

vim.keymap.set("", "<Leader>tf", function()
  float:toggle()
end)

return M
