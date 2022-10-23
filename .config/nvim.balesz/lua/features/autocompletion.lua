local M = {}

function M.setup(use)
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  --use 'hrsh7th/cmp-path'
  --use 'hrsh7th/cmp-cmdline'
  --use { 'petertriho/cmp-git', requires = 'nvim-lua/plenary.nvim' }
  use { "hrsh7th/nvim-cmp", config = function()
    local ok, cmp = pcall(require, "cmp")
    if not ok then return end
    cmp.setup {
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
      }),
    }
  end }
end

function M.getCapabilities()
  local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if not ok then return nil end
  return cmp_nvim_lsp.default_capabilities()
end

vim.opt.completeopt = "menu,menuone,noselect"

return M
