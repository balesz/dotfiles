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

local function set_keymaps(buf)
  vim.keymap.set("n", "<Leader>la", vim.lsp.buf.code_action,
    { buffer = buf, desc = "Code Action" })
  vim.keymap.set("n", "<Leader>ld", vim.lsp.buf.references,
    { buffer = buf, desc = "References" })
  vim.keymap.set("n", "<Leader>lf", vim.lsp.buf.format,
    { buffer = buf, desc = "Format" })
  vim.keymap.set("n", "<Leader>lg", vim.lsp.buf.definition,
    { buffer = buf, desc = "Definition" })
  vim.keymap.set("n", "<Leader>lh", vim.lsp.buf.hover,
    { buffer = buf, desc = "Hover" })
  vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.rename,
    { buffer = buf, desc = "Rename" })
end

vim.api.nvim_create_augroup("BaleszLsp", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "BaleszLsp",
  callback = function(args)
    set_keymaps(args.buf)
  end
})
vim.api.nvim_create_autocmd("BufWritePre", {
  group = "BaleszLsp",
  callback = function(args)
    features.organize_imports(args.buf)
    features.format_on_save(args.buf)
  end
})
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "BaleszLsp",
  callback = function(args)
    features.show_diagnostic(args.buf)
  end
})

return M
