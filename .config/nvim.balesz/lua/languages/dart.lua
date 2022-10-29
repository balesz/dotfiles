local ok, lspconfig = pcall(require, "lspconfig")
if not ok then return end

local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local capabilities = ok_cmp and cmp_nvim_lsp.default_capabilities() or nil

--
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dartls
-- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md
--

lspconfig.dartls.setup {
  capabilities = capabilities,
  init_options = {
    onlyAnalyzeProjectsWithOpenFiles = true,
    suggestFromUnimportedLibraries = true,
    closingLabels = true,
    outline = true,
    flutterOutline = true,
  },
  settings = {
    dart = {
      completeFunctionCalls = true,
      enableSdkFormatter = true,
      lineLength = 120,
      showTodos = true,
      analysisExcludedFolders = {},
    }
  }
}
