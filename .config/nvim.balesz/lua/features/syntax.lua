local M = {}

M.setup = function(use)
  --
  -- https://github.com/nvim-treesitter/nvim-treesitter
  --
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "rust", "javascript", "typescript", "tsx", "http", "json", "lua", "make", "go", "dart", "proto", "dockerfile", "java", "kotlin", "markdown", "markdown_inline", "regex", "toml", "yaml", "help" },
        ignore_install = {},
        sync_install = true,
        auto_install = true,
        highlight = {
          enable = true,
          disable = {},
          additional_vim_regex_highlighting = false,
        },
      }
    end
  }
end

return M
