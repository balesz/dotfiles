local M = {}

function M.setup(use)
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use { "nvim-telescope/telescope-project.nvim" }
  use {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup {
        extensions = {
          file_browser = {}
        }
      }
    end
  }
  require("telescope").load_extension("file_browser")
  require("telescope").load_extension("project")
end

return M
