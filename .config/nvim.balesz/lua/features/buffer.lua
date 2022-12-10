local M = {}

function M.setup(use)
  use {
    "famiu/bufdelete.nvim",
  }
  use {
    "romgrk/barbar.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    disable = true,
    config = function()
      require("bufferline").setup {
        animation = true,
        auto_hide = false,
        tabpages = true,
        closable = true,
        clickable = true,
        icons = true,
        no_name_title = "empty",
      }
    end,
    setup = function()
      vim.keymap.set("n", "<TAB>", "<cmd>BufferNext<CR>")
      vim.keymap.set("n", "<S-TAB>", "<cmd>BufferPrevious<CR>")
      vim.keymap.set("n", "<Leader>t<TAB>", "<cmd>BufferMoveNext<CR>")
      vim.keymap.set("n", "<Leader>t<S-TAB>", "<cmd>BufferMovePrevious<CR>")
      vim.api.nvim_create_user_command("BaleszBuffDelete", function(params)
        vim.cmd("BufferClose " .. params.args)
      end, { nargs = "?" })
    end
  }
  use {
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    requires = "kyazdani42/nvim-web-devicons",
    disable = true,
    config = function()
      local close_command = "BaleszBuffDelete %d"
      require("bufferline").setup {
        options = {
          close_command = close_command,
          right_mouse_command = close_command,
          middle_mouse_command = close_command,
        }
      }
    end,
    setup = function()
      vim.keymap.set("n", "<TAB>", "<cmd>BufferLineCycleNext<CR>")
      vim.keymap.set("n", "<S-TAB>", "<cmd>BufferLineCyclePrev<CR>")
      vim.keymap.set("n", "<Leader>t<TAB>", "<cmd>BufferLineMoveNext<CR>")
      vim.keymap.set("n", "<Leader>t<S-TAB>", "<cmd>BufferLineMovePrev<CR>")
      vim.api.nvim_create_user_command("BaleszBuffDelete", function(params)
        vim.cmd("Bdelete " .. params.args)
      end, { nargs = "?" })
    end
  }
  use {
    "ghillb/cybu.nvim",
    branch = "main",
    requires = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
    disable = false,
    config = function()
      require("cybu").setup {}
    end,
    setup = function()
      --vim.keymap.set("n", "K", "<Plug>(CybuPrev)")
      --vim.keymap.set("n", "J", "<Plug>(CybuNext)")
      vim.keymap.set({ "n", "v" }, "<Tab>", "<Plug>(CybuLastusedNext)")
      vim.keymap.set({ "n", "v" }, "<S-Tab>", "<Plug>(CybuLastusedPrev)")
      vim.api.nvim_create_user_command("BaleszBuffDelete", function(params)
        vim.cmd("Bdelete " .. params.args)
      end, { nargs = "?" })
    end
  }
end

function M.close()
  vim.cmd "BaleszBuffDelete"
end

vim.keymap.set("n", "x", function()
  M.close()
end)

return M
