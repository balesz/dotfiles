local M = {}

local ok_notify, notify = pcall(require, "notify")

function M.setup(use)
  use "MunifTanjim/nui.nvim"
  use "rcarriga/nvim-notify"
  use {
    "folke/noice.nvim",
    disable = true,
    config = function()
      require("noice").setup {
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
    end
  }
  vim.notify = ok_notify and notify or vim.notify
end

local font = ""
font = "FiraCode Nerd Font"
font = "JetBrainsMono Nerd Font"
if os.getenv("WSL_DISTRO_NAME") ~= "" then
  font = font:gsub("Nerd Font", "NF")
end

vim.opt.title = true
vim.opt.guifont = font .. ":h11"
vim.opt.guicursor = "n-v-c-sm:block-lCursor,i-ci-ve:ver25-lCursor,r-cr-o:hor25-lCursor"
vim.opt.termguicolors = true

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

return M
