local M = {}

M.dap = {
  n = {

    ["<leader>du"] = {
      function ()
        require('dapui').toggle()
      end,
      "toggle ui",
    },

    ["<leader>dc"] = {
      function ()
        require('dap').continue()
      end,
      "continue",
    },

    ["<leader>dt"] = {
      function ()
        require('dap').toggle_breakpoint()
      end,
      "toggle breakpoint",
    },

    ["<leader>db"] = {
      function ()
        local condition = vim.fn.input('Breakpoint condition: ')
        require('dap').set_breakpoint(condition)
      end,
      "conditional breakpoint",
    },

    ["<leader>dl"] = {
      function ()
        local message = vim.fn.input('Log point message: ')
        require('dap').set_breakpoint(nil, nil, message)
      end,
      "log point",
    },

    ["<leader>dn"] = {
      function ()
        require('dap').step_over({ steppingGranularity = "line" })
      end,
      "step over",
    },

    ["<leader>dd"] = {
      function ()
        require('dap').run_to_cursor()
      end,
      "run to cursor",
    },

    ["<leader>dx"] = {
      function ()
        require('dap').terminate()
      end,
      "terminate",
    },
  }
}

return M
