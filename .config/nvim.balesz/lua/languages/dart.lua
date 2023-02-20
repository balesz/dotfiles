local M = {}

--
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dartls
-- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md
--
function M.lsp_setup(_)
  local utils = require "languages/utils"
  local dart = require "languages/utils/dart"
  require("lspconfig").dartls.setup {
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
        lineLength = 200,
        showTodos = true,
        analysisExcludedFolders = dart.get_excluded_folders(),
      }
    },
    on_attach = function(client, bufnr)
      require("languages").on_attach(client, bufnr)
    end,
  }
end

--
-- https://gist.github.com/christopherfujino/80be0f4cd88f75c4991b478e6b071153
-- https://github.com/dart-lang/sdk/tree/main/pkg/dds/tool/dap#debug-adapter-protocol
-- https://github.com/flutter/flutter/blob/master/packages/flutter_tools/lib/src/debug_adapters/README.md
--
function M.dap_setup(_)
  require("dap").adapters.dart = {
    type = "executable",
    command = "flutter",
    args = { "debug_adapter" },
    options = {
      max_retries = 100,
      initialize_timeout_sec = 30,
    },
  }
end

function M.dap_config()
  require("dap").configurations.dart = {
    {
      type = "dart",
      request = "launch",
      name = "debug",
      cwd = "${workspaceFolder}",
      program = "lib/main.dart",
      flutterMode = "debug",
    }
  }
end

return M
