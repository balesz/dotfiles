local M = {}

function M.set_keymaps(buf)
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

function M.refresh_codelens(buf)
  local clients = vim.lsp.get_active_clients({ bufnr = buf })
  for _, client in ipairs(clients) do
    if client.server_capabilities.codeLensProvider then
      vim.lsp.codelens.refresh()
    end
  end
end

function M.format(buf)
  local clients = vim.lsp.get_active_clients({ bufnr = buf })
  for _, client in ipairs(clients) do
    if client.server_capabilities.documentFormattingProvider then
      vim.lsp.buf.format({ async = false, bufnr = buf })
    end
  end
end

function M.organize_imports(buf)
  local client = vim.lsp.get_active_clients({ bufnr = buf })
  if #client == 0 then
    return
  end

  local method = "textDocument/codeAction"
  local kind = "source.organizeImports"

  local params = vim.lsp.util.make_range_params()
  params.context = { only = { kind }, diagnostics = {} }
  local result = vim.lsp.buf_request_sync(buf, method, params)

  for cid, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.kind == kind and r.edit then
        local clnt = vim.lsp.get_client_by_id(cid) or {}
        local enc = clnt.offset_encoding or "utf-16"
        vim.lsp.util.apply_workspace_edit(r.edit, enc)
      elseif r.kind == kind and r.command then
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end

function M.show_diagnostic(buf)
  vim.diagnostic.show(nil, buf)
end

return M
