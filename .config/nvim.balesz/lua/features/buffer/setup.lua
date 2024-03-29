if pcall(require, "bufdelete") then
  vim.keymap.set("n", "<BS>x", "<cmd>Bdelete<CR>")
end

if pcall(require, "bufferline") then
  local close_command = function(bufnum)
    require("bufdelete").bufdelete(bufnum, true)
  end
  require("bufferline").setup {
    options = {
      always_show_bufferline = true,
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = true,
      close_command = close_command,
      right_mouse_command = close_command,
      middle_mouse_command = close_command,
      separator_style = "thick",
      sort_by = "insert_after_current",
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        },
      },
    }
  }
  vim.keymap.set("n", "<TAB>", "<cmd>BufferLineCycleNext<CR>")
  vim.keymap.set("n", "<S-TAB>", "<cmd>BufferLineCyclePrev<CR>")
  vim.keymap.set("n", "<Leader>t<TAB>", "<cmd>BufferLineMoveNext<CR>")
  vim.keymap.set("n", "<Leader>t<S-TAB>", "<cmd>BufferLineMovePrev<CR>")
end

if pcall(require, "cybu") then
  require("cybu").setup {}
  --vim.keymap.set("n", "K", "<Plug>(CybuPrev)")
  --vim.keymap.set("n", "J", "<Plug>(CybuNext)")
  --vim.keymap.set({ "n", "v" }, "<Tab>", "<Plug>(CybuLastusedNext)")
  --vim.keymap.set({ "n", "v" }, "<S-Tab>", "<Plug>(CybuLastusedPrev)")
end
