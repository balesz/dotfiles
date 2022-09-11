local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
  --dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dap.defaults.fallback.focus_terminal = true
dap.defaults.fallback.force_external_terminal = false
dap.defaults.fallback.terminal_win_cmd = "70vsplit new"

dap.defaults.dart.focus_terminal = true
dap.defaults.dart.force_external_terminal = false
dap.defaults.dart.terminal_win_cmd = "70vsplit new"

dap.adapters.dart = {
  type = "executable",
  command = "flutter",
  args = {"debug_adapter"},
  options = {
    initialize_timeout_sec = 0,
  },
}

