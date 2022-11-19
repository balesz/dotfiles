local M = {}

function M.format_on_save(buf)
  local client = vim.lsp.get_active_clients({ bufnr = buf })
  if #client == 0 then return end
  vim.lsp.buf.format({ async = false, bufnr = buf })
end

function M.organize_imports(buf)
  local client = vim.lsp.get_active_clients({ bufnr = buf })
  if #client == 0 then return end

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
