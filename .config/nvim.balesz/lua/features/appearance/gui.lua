local M = {}

function M.setup(use)
end

local font = ""
font = "FiraCode Nerd Font"
font = "JetBrainsMono Nerd Font"
if os.getenv("WSL_DISTRO_NAME") ~= "" then
  font = font:gsub("Nerd Font", "NF")
end

vim.opt.guifont = font .. ":h11"
vim.opt.guicursor = "n-v-c-sm:block-lCursor,i-ci-ve:ver25-lCursor,r-cr-o:hor25-lCursor"

return M
