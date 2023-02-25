if pcall(require, "notify") then
  vim.notify = require("notify")
end

if pcall(require, "dressing") then
  require("dressing").setup {
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
end

if pcall(require, "noice") then
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
