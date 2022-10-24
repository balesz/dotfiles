local ok, lspconfig = pcall(require, "lspconfig")
if not ok then return end

--
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dartls
-- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md
--

lspconfig.dartls.setup {
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
    }
  }
}
