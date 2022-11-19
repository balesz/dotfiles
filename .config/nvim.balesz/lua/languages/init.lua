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
        ensure_installed = {
          "sumneko_lua", "bashls", "dockerls", "jsonls", "yamlls"
        }
      }
    end
  }
  require("languages/dart").setup(use)
  require("languages/go").setup(use)
  require("languages/lua").setup(use)
end

local features = require "languages/features"

vim.api.nvim_create_augroup("BaleszLsp", {})

vim.api.nvim_create_autocmd("LspAttach", {
  group = "BaleszLsp",
  callback = function(args)
    features.set_keymaps(args.buf)
    features.refresh_codelens(args.buf)
  end
})

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
  group = "BaleszLsp",
  callback = function(args)
    features.refresh_codelens(args.buf)
  end
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = "BaleszLsp",
  callback = function(args)
    features.organize_imports(args.buf)
    features.format(args.buf)
  end
})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = "BaleszLsp",
  callback = function(args)
    features.show_diagnostic(args.buf)
  end
})

return M
