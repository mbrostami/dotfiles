-- File: lua/plugins/dap.lua
return {
  -- Core DAP plugin
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui", -- optional UI for DAP
      "theHamsta/nvim-dap-virtual-text", -- shows variable values inline
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- optional: open dapui automatically on debug start
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      dapui.setup()
      require("nvim-dap-virtual-text").setup()
    end,
  },

  -- Go-specific adapter
  {
    "leoluz/nvim-dap-go",
    config = function()
      require("dap-go").setup()
    end,
  },
}
