local M = {}

function M.setup(use)
  --
  -- https://github.com/neovim/nvim-lspconfig
  --
  use {
    "neovim/nvim-lspconfig",
  }
  --
  -- https://github.com/williamboman/mason.nvim
  --
  use {
    "williamboman/mason.nvim",
  }
  --
  -- https://github.com/williamboman/mason-lspconfig.nvim
  --
  use {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason").setup {}
      require("mason-lspconfig").setup {
        ensure_installed = { "sumneko_lua", "bashls", "dockerls", "jsonls", "yamlls" }
      }
    end
  }
end

require 'languages/lua'
require 'languages/dart'

vim.api.nvim_create_augroup("BaleszLsp", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
  group = "BaleszLsp",
  callback = function(args)
    vim.keymap.set("n", "<Leader>la", vim.lsp.buf.code_action, { buffer = args.buf, desc = "Code Action" })
    vim.keymap.set("n", "<Leader>lf", vim.lsp.buf.format, { buffer = args.buf, desc = "Format" })
    vim.keymap.set("n", "<Leader>lh", vim.lsp.buf.hover, { buffer = args.buf, desc = "Hover" })
    vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.references, { buffer = args.buf, desc = "References" })
  end
})

return M
