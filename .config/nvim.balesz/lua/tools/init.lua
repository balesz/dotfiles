local M = {}

function M.setup(use)
  require("tools/flutter").setup(use)
  require("tools/rest-nvim").setup(use)
end

return M

--
--
-- ## Common
-- https://github.com/MunifTanjim/nui.nvim
--
-- ## User Interface
-- https://github.com/feline-nvim/feline.nvim
-- https://github.com/sidebar-nvim/sidebar.nvim
-- https://github.com/ghillb/cybu.nvim
-- https://github.com/sindrets/winshift.nvim
-- https://github.com/petertriho/nvim-scrollbar
--
-- ## Editor
-- https://github.com/mg979/vim-visual-multi
-- https://github.com/azabiong/vim-highlighter
--
-- ## LSP
-- https://github.com/neoclide/coc.nvim
-- https://github.com/jose-elias-alvarez/null-ls.nvim
-- https://github.com/jamespwilliams/neovim-go-nix-develop
-- https://github.com/folke/trouble.nvim
--
-- ## Tools
-- https://github.com/akinsho/flutter-tools.nvim
--