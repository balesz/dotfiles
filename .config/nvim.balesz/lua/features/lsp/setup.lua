if pcall(require, "mason") then
  require("mason").setup {}
end

if pcall(require, "mason-lspconfig") then
  require("mason-lspconfig").setup {
    ensure_installed = {
      "lua_ls", "bashls", "dockerls", "jsonls", "yamlls"
    }
  }
end

if pcall(require, "languages") then
  require("languages").lsp_setup()
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
