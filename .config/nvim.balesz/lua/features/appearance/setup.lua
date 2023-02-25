--
-- colorscheme
--

require("nightfox").setup {}

require("catppuccin").setup {}

if pcall(require, "nightfox") then
  vim.cmd "colorscheme nordfox"
elseif pcall(require, "catppuccin") then
  vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
  vim.cmd "colorscheme catppuccin"
end

vim.cmd [[hi VertSplit guifg=#4c566a]]

--
-- gui
--

import("notify", function(notify)
  vim.notify = notify
end, {})

import("dressing", function(dressing)
  dressing.setup {
    select = {
      get_config = function(opts)
        if opts.kind == "legendary.nvim" then
          return {
            telescope = {
              sorter = require("telescope.sorters").get_fzy_sorter({})
            }
          }
        end
        return {}
      end,
    }
  }
end, {})

import("noice", function(noice)
  noice.setup {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = false,
    },
  }
end, {})

local font = ""
font = "FiraCode Nerd Font"
font = "JetBrainsMono Nerd Font"
if os.getenv("WSL_DISTRO_NAME") ~= "" then
  font = font:gsub("Nerd Font", "NF")
end

vim.opt.title = true
vim.opt.guifont = font .. ":h11"
vim.opt.guicursor =
"n-v-c-sm:block-lCursor,i-ci-ve:ver25-lCursor,r-cr-o:hor25-lCursor"
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"

vim.api.nvim_create_augroup("BaleszGui", {})

vim.api.nvim_create_autocmd({ "DirChanged" }, {
  pattern = "global",
  group = "BaleszGui",
  callback = function()
    local title = vim.fn.getcwd()
    title = title:gsub("/.*/(.*)", "%1")
    vim.opt.titlestring = title
  end
})

--
-- layout
--

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.equalalways = true
