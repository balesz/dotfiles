local M = {}

function M.setup(use)
  use {
    "neovim/nvim-lspconfig",
  }

  use {
    "williamboman/mason.nvim",
  }

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

vim.keymap.set("n", "<Leader>lf", vim.lsp.buf.format, { desc = "Lsp - Format" })
vim.keymap.set("n", "<Leader>lh", vim.lsp.buf.hover, { desc = "Lsp - Hover" })

require 'languages/lua'

return M
