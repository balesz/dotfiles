local M = {}

function M.lsp_setup()
  require("languages/dart").lsp_setup()
  require("languages/go").setup()
  require("languages/lua").setup()
  require("languages/dockerfile").setup()
end

function M.dap_setup()
  require("languages/dart").dap_setup()
end

function M.on_attach(client, bufnr)
  require("features/editor/api").on_attach(client, bufnr)
end

return M
