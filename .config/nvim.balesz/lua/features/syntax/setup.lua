if pcall(require, "nvim-treesitter") then
  require "nvim-treesitter.configs".setup {
    ensure_installed = { "http", "json", "lua", "make", "go", "dart", "proto",
      "dockerfile", "markdown", "markdown_inline", "regex", "toml", "yaml",
      "help" },
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

vim.api.nvim_create_augroup("BaleszSyntax", {})

vim.api.nvim_create_autocmd({ "BufEnter", }, {
  pattern = "*",
  group = "BaleszSyntax",
  desc = "Enable syntax",
  command = "syntax on",
})
