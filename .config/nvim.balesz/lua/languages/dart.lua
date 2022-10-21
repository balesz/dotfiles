local ok, lspconfig = pcall(require, 'lspconfig')

if not ok then return end

lspconfig.dartls.setup {
  init_options = {
    closingLabels = true,
    flutterOutline = true,
    onlyAnalyzeProjectsWithOpenFiles = false,
    outline = true,
    suggestFromUnimportedLibraries = true,
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
