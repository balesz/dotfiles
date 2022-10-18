local M = {}

function M.setup(use)
  --
  -- https://github.com/williamboman/mason.nvim
  --
  use {
    "williamboman/mason.nvim",
  }
  --
  -- https://github.com/neovim/nvim-lspconfig
  --
  use {
    "neovim/nvim-lspconfig",
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

require'languages/lua'

return M
