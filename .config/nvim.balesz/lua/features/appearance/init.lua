local M = {}

function M.setup(use)
  require("features/appearance/colorscheme").setup(use)
  require("features/appearance/gui").setup(use)
  require("features/appearance/layout").setup(use)
end

return M
