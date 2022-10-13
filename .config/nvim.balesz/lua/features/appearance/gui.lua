local M = {}

function M.setup(use)
end

local font = "FiraCode Nerd Font:h12"
if os.getenv("WSL_DISTRO_NAME") ~= "" then
  font = "FiraCode NF:h12"
end

vim.opt_global.guifont = font

return M
