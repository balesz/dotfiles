local dap = require('dap')

local device = "chrome"

dap.adapters.dart = {
  type = "executable",
  command = "flutter",
  args = {"debug_adapter"},
  options = {
    initialize_timeout_sec = 30,
  },
}
dap.configurations.dart = {
  {
    type = "dart",
    request = "launch",
    name = "Launch Flutter Program",
    program = "lib/main.dart",
    cwd = "${workspaceFolder}",
  }
}

