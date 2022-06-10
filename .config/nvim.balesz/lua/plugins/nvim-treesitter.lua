--
-- https://github.com/nvim-treesitter/nvim-treesitter
--
return {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = { "http", "json", "lua", "make", "go", "dart", "proto" },
      sync_install = true,
      ignore_install = { "javascript" },
      highlight = {
        enable = true,
        disable = { "c", "rust" },
        additional_vim_regex_highlighting = false,
      },
    }
  end
}

