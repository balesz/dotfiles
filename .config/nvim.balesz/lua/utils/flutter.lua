local M = {}

function M.get_excluded_folders()
  local sdk_dirs = {}

  if vim.fn.executable("fvm") then
    local list = vim.fn.system("fvm list"):gsub("Cache Directory:  ", "")
    for line in vim.gsplit(list, "\n") do
      if line == "" then
      elseif line:match("/%w+") then
        table.insert(sdk_dirs, line)
      elseif line:match("%d+%.%d+%.%d+") then
        table.insert(sdk_dirs, sdk_dirs[1] .. "/" .. line)
      end
    end
  end

  local flutter_path = vim.fn.resolve(vim.fn.exepath("flutter"))
  sdk_dirs[1] = flutter_path:gsub("/bin/flutter", "")

  local result = { vim.env.HOME .. "/.pub-cache" }
  for _, it in pairs(sdk_dirs) do
    table.insert(result, it .. "/.pub-cache")
    table.insert(result, it .. "/packages")
  end

  return result
end

return M
