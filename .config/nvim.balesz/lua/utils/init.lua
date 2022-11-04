function Log(obj)
  print(vim.inspect(obj))
end

function LoadCurrent()
  local filename = vim.api.nvim_buf_get_name(0)
  vim.cmd("luafile" .. filename)
end
