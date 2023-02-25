pcall(require, "utils")

vim.env.PATH = vim.fn.system("echo $PATH"):gsub("\n", "")

local ensure_packer = function()
  local install_path = vim.fn.stdpath("data") ..
      "/site/pack/packer/start/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({ "git", "clone", "--depth", "1",
      "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local function setup_factory(use)
  return function(package)
    local ok, pkg = pcall(require, package)
    if not ok then
      vim.notify(package .. " not found", vim.log.levels.WARN)
    else
      pcall(pkg.setup, use)
    end
  end
end

require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "kyazdani42/nvim-web-devicons"
  local setup = setup_factory(use)
  setup("features/keymap")
  setup("features/terminal")
  setup("features/appearance")
  setup("features/autocompletion")
  setup("features/buffer")
  setup("features/debug")
  setup("features/editor")
  setup("features/filetree")
  setup("features/git")
  setup("features/mouse")
  setup("features/outline")
  setup("features/scroll")
  setup("features/statusline")
  setup("features/syntax")
  setup("features/telescope")
  setup("languages")
  setup("tools")
  if packer_bootstrap then
    require("packer").sync()
  end
end)
