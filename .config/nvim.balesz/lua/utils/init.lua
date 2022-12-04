function Log(obj)
  print(vim.inspect(obj))
end

function LoadCurrent()
  local filename = vim.api.nvim_buf_get_name(0)
  vim.cmd("luafile" .. filename)
end

function os.capture(cmd)
  local out = assert(io.popen(cmd, "r"))
  local str = assert(out:read("*a"))
  out:close()
  local result = {}
  for s in str:gmatch("[^\r\n]+") do
    table.insert(result, s)
  end
  return result
end
