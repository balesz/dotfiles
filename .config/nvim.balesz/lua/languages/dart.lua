local M = {}

local ok_lsp, lspconfig = pcall(require, "lspconfig")
local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local ok_flutter, flutter = pcall(require, "utils/flutter")

function M.setup(_)
  --
  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dartls
  -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md
  --
  local _ = ok_lsp and lspconfig.dartls.setup {
    root_dir = function(filename, bufnr)
      local clients = vim.lsp.get_active_clients({ name = "dartls" })
      if #clients > 0 then return clients[1].config.root_dir end
      return lspconfig.util.root_pattern("pubspec.yaml")(filename, bufnr)
    end,
    capabilities = (function()
      return ok_cmp and cmp_nvim_lsp.default_capabilities() or nil
    end)(),
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
        analysisExcludedFolders = ok_flutter
            and flutter.get_excluded_folders()
            or {},
      }
    }
  }
end

return M
