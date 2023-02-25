require("neo-tree").setup {
  source_selector = {
    winbar = true,
  },
  filesystem = {
    follow_current_file = true,
    use_libuv_file_watcher = true,
  },
  buffers = {
    follow_current_file = true,
  },
  window = {
    mappings = {
      ["<A-h>"] = "prev_source",
      ["<A-l>"] = "next_source",
    },
  },
}

vim.keymap.set("", "<Leader>ft", function()
  vim.cmd "NeoTreeFocus"
end, { desc = "Open Neo-tree" })

import("toggleterm.terminal", function(toggleterm)
  local goful = toggleterm.Terminal:new {
    cmd = "goful",
    direction = "float",
    close_on_exit = true,
    hidden = true,
  }
  vim.keymap.set("", "<Leader>fg", function()
    goful:toggle()
  end, { desc = "Open goful" })
end, {})
