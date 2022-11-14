local M = {}

local ok_lsp, lspconfig = pcall(require, "lspconfig")
local ok_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

local function get_capabilities()
  return ok_cmp_nvim_lsp and cmp_nvim_lsp.default_capabilities() or nil
end

local function get_root_dir(filename, _)
  local root_dir = lspconfig.util.root_pattern("pubspec.yaml")(filename)

  local paths = vim.fs.find({ ".dart_tool" }, {
    path = root_dir, type = "directory", limit = 1,
  })

  if #paths == 0 then
    local clients = vim.lsp.get_active_clients({ name = "dartls" })
    if #clients > 0 then
      return clients[1].config.root_dir
    end
  end

  return root_dir
end

local function get_excluded_folders()
  local sdk_dirs = {}

  if vim.fn.executable("fvm") then
    local list = vim.fn.system("fvm list"):gsub("Cache Directory:  ", "")
    for line in vim.gsplit(list, "\n") do
      if line == "" then
      elseif line:match("/[%p%w]-/[%p%w]+") then
        table.insert(sdk_dirs, line)
      elseif line:match("%d+%.%d+%.%d+") then
        table.insert(sdk_dirs, sdk_dirs[1] .. "/" .. line)
      end
    end
  end

  local flutter_path = vim.fn.resolve(vim.fn.exepath("flutter"))
  sdk_dirs[1] = flutter_path:gsub("/bin/flutter", "")

  local result = { vim.env.HOME .. "/.pub-cache" }
  for _, it in pairs(sdk_dirs) do
    table.insert(result, it .. "/.pub-cache")
    table.insert(result, it .. "/packages")
  end

  return result
end

function M.setup(_)
  --
  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dartls
  -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md
  --
  local _ = ok_lsp and lspconfig.dartls.setup {
    root_dir = get_root_dir,
    capabilities = get_capabilities(),
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
        analysisExcludedFolders = get_excluded_folders(),
      }
    }
  }
end

return M
