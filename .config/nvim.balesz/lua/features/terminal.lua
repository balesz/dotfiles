local M = {}

function M.setup(use)
  use {
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("toggleterm").setup {
        persist_mode = false, persist_size = false,
        close_on_exit = true,
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
    local ok, bufferline = pcall(require, "features/bufferline")
    if not ok then return end
    pcall(bufferline.close)
  end
})

local ok, toggleterm = pcall(require, "toggleterm.terminal")
if not ok then return end

local horizontal = toggleterm.Terminal:new {
  direction = "horizontal",
  hidden = true,
}

local vertical = toggleterm.Terminal:new {
  direction = "vertical",
  hidden = true,
}

local float = toggleterm.Terminal:new {
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
