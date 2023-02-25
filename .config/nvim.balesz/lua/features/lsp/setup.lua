require("mason").setup {}

require("mason-lspconfig").setup {
  ensure_installed = {
    "lua_ls", "bashls", "dockerls", "jsonls", "yamlls"
  }
}

require("languages/dart").lsp_setup(use)
require("languages/go").setup(use)
require("languages/lua").setup(use)
require("languages/dockerfile").setup(use)

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
