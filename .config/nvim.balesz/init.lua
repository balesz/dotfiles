local hasPacker = pcall(require, "packer")
if not hasPacker then
  local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  end
end

pcall(require, "plugins")
pcall(require, "settings")

