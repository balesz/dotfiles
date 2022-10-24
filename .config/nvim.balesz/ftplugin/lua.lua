local ok, lspconfig = pcall(require, "lspconfig")
if not ok then return end

local capabilities
local okCmp, autocompletion = pcall(require, "features/autocompletion")
if okCmp then capabilities = autocompletion.getCapabilities() end

lspconfig.sumneko_lua.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
          quote_style = "double",
          max_line_length = "80",
        },
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
