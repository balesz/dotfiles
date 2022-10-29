local M = {}

local ok_lsp, lspconfig = pcall(require, "lspconfig")
local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

function M.setup(_)
  if not ok_lsp then return end

  lspconfig.sumneko_lua.setup {
    capabilities = ok_cmp and cmp_nvim_lsp.default_capabilities() or nil,
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
end

return M
