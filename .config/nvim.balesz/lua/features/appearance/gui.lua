local M = {}

function M.setup(_)
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
