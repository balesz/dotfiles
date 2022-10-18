local M = {}

function M.setup(use)
  --
  -- https://github.com/nvim-treesitter/nvim-treesitter
  --
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "http", "json", "lua", "make", "go", "dart", "proto", "dockerfile", "markdown", "markdown_inline", "regex", "toml", "yaml", "help" },
        ignore_install = {},
        sync_install = true,
        auto_install = true,
        highlight = {
          enable = true,
          disable = {},
          additional_vim_regex_highlighting = { "makefile" },
        },
      }
    end
  }
  --
  -- https://github.com/nvim-treesitter/playground
  --
  use {
    'nvim-treesitter/playground',
    config = function()
      require'nvim-treesitter.configs'.setup {}
    end
  }
end

return M
