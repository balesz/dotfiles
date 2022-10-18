local M = {}

function M.setup(use)
end

--local font = "FiraCode Nerd Font:h11"
local font = "JetBrainsMono Nerd Font:h11"
if os.getenv("WSL_DISTRO_NAME") ~= "" then
  --font = "FiraCode NF:h11"
  font = "JetBrainsMono NF:h11"
end

vim.opt.guifont = font

return M
