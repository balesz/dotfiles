local M = {}

local ok_lsp, lspconfig = pcall(require, "lspconfig")
local ok_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

local function get_capabilities()
  return ok_cmp_nvim_lsp and cmp_nvim_lsp.default_capabilities() or nil
end

function M.setup(_)
  --
  -- https://github.com/golang/tools/tree/master/gopls
  --
  local _ = ok_lsp and lspconfig.gopls.setup {
    capabilities = get_capabilities(),
  }
end

vim.api.nvim_create_autocmd("BufWritePre", {
  group = "BaleszLsp",
  pattern = "*.go",
  callback = function(args)
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(
      args.bufnr, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding
              or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
  end
})

return M
