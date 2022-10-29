local M = {}

local ok_lsp, lspconfig = pcall(require, "lspconfig")
local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

function M.setup(use)
  use("dart-lang/dart-vim-plugin")

  if not ok_lsp then return end

  --
  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dartls
  -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md
  --
  lspconfig.dartls.setup {
    capabilities = ok_cmp and cmp_nvim_lsp.default_capabilities() or nil,
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
end

return M
