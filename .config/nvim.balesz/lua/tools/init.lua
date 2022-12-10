local M = {}

function M.setup(use)
  require("tools/flutter").setup(use)
  require("tools/rest-nvim").setup(use)
end

return M

--
-- ## User Interface
-- https://github.com/feline-nvim/feline.nvim
-- https://github.com/sidebar-nvim/sidebar.nvim
-- https://github.com/ghillb/cybu.nvim
--
-- ## LSP
-- https://github.com/jose-elias-alvarez/null-ls.nvim
-- https://github.com/folke/trouble.nvim
