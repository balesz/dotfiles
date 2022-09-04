require("dap").adapters.dart = {
  type = "executable",
  command = "flutter",
  args = {"debug_adapter"},
  options = {
    initialize_timeout_sec = 0,
  },
}

