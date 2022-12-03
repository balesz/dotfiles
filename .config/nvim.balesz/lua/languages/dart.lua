local M = {}

local ok_lsp, lspconfig = pcall(require, "lspconfig")
local ok_navic, navic = pcall(require, "nvim-navic")
local utils = require "languages/utils"
local dart = require "languages/utils/dart"

function M.setup(_)
  --
  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dartls
  -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md
  --
  local _ = ok_lsp and lspconfig.dartls.setup {
    root_dir = dart.get_root_dir,
    capabilities = utils.get_capabilities(),
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
        analysisExcludedFolders = dart.get_excluded_folders(),
      }
    },
    on_attach = function(client, bufnr)
      local _ = ok_navic and navic.attach(client, bufnr) or nil
    end,
  }
end

return M
