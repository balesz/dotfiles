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

local function format_on_save(buf)
  local client = vim.lsp.get_active_clients({ bufnr = buf })
  if #client == 0 then return end
  vim.lsp.buf.format({ async = false, bufnr = buf })
end

local function organize_imports(buf)
  local client = vim.lsp.get_active_clients({ bufnr = buf })
  if #client == 0 then return end
  local params = vim.lsp.util.make_range_params()
  params.context = { only = { "source.organizeImports" }, diagnostics = {} }
  local result = vim.lsp.buf_request_sync(buf, "textDocument/codeAction", params)
  for cid, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding
            or "utf-16"
        vim.lsp.util.apply_workspace_edit(r.edit, enc)
      elseif r.command then
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end

local function show_diagnostic(buf)
  vim.diagnostic.show(nil, buf)
end

--
-- Autocommands
--
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
    organize_imports(args.buf)
    format_on_save(args.buf)
  end
})
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "BaleszLsp",
  callback = function(args)
    show_diagnostic(args.buf)
  end
})

return M
