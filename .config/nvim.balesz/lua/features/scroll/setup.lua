if pcall(require, "neoscroll") then
  require("neoscroll").setup {}
end

if pcall(require, "scrollbar") then
  require("scrollbar").setup {
    excluded_filetypes = {
      "prompt",
      "TelescopePrompt",
      "noice",
      "neo-tree",
    },
  }
end
