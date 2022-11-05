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
  require("languages/lua").setup(use)
end

vim.api.nvim_create_augroup("BaleszLsp", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "BaleszLsp",
  callback = function(args)
    vim.keymap.set("n", "<Leader>la", vim.lsp.buf.code_action,
      { buffer = args.buf, desc = "Code Action" })
    vim.keymap.set("n", "<Leader>ld", vim.lsp.buf.references,
      { buffer = args.buf, desc = "References" })
    vim.keymap.set("n", "<Leader>lf", vim.lsp.buf.format,
      { buffer = args.buf, desc = "Format" })
    vim.keymap.set("n", "<Leader>lg", vim.lsp.buf.definition,
      { buffer = args.buf, desc = "Definition" })
    vim.keymap.set("n", "<Leader>lh", vim.lsp.buf.hover,
      { buffer = args.buf, desc = "Hover" })
    vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.rename,
      { buffer = args.buf, desc = "Rename" })
  end
})
vim.api.nvim_create_autocmd("BufWritePre", {
  group = "BaleszLsp",
  callback = function(args)
    local client = vim.lsp.get_active_clients({ bufnr = args.buf })
    if #client == 0 then return end
    vim.lsp.buf.format({ bufnr = args.buf })
  end
})

return M
