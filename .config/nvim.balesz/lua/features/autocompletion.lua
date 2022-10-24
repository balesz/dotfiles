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
      completion = {
        autocomplete = false,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<A-j>"] = cmp.mapping.scroll_docs(-4),
        ["<A-k>"] = cmp.mapping.scroll_docs(4),
        ["<C-h>"] = cmp.mapping.abort(),
        ["<C-l>"] = cmp.mapping.confirm({ select = true }),
        ["<ESC>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
      }, {
        { name = "buffer" },
      }),
    }
  end }
end

function M.getCapabilities()
  local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if not ok then return nil end
  return cmp_nvim_lsp.default_capabilities()
end

vim.opt.completeopt = "menu,menuone,noinsert,noselect,preview"

return M
