local M = {}

function M.setup(use)
  use {
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("toggleterm").setup {
        auto_scroll = true,
        close_on_exit = false,
        hide_numbers = false,
        persist_mode = false,
        persist_size = false,
        shade_terminals = false,
        start_in_insert = false,
      }
    end
  }
end

vim.api.nvim_create_augroup("BaleszTerminal", {})

vim.api.nvim_create_autocmd({ "TermOpen" }, {
  pattern = "*",
  group = "BaleszTerminal",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd "startinsert"
  end
})

vim.api.nvim_create_autocmd({ "TermClose" }, {
  pattern = "*",
  group = "BaleszTerminal",
  callback = function()
    local ok, buffer = pcall(require, "features/buffer")
    if not ok then return end
    pcall(buffer.close)
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
