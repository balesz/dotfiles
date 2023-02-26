if pcall(require, "telescope") then
  require("telescope").setup {
    extensions = {
      file_browser = {}
    }
  }
  require("telescope").load_extension("file_browser")
  require("telescope").load_extension("project")
end
