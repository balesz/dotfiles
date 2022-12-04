local default_prog = nil
if os.getenv("OS") == "Windows_NT" then
  default_prog = { "wsl", "-d", "Ubuntu", "--cd", "~" }
end

return default_prog
