return {
  "rcarriga/nvim-dap-ui",
  -- lazy = false,
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio"
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")
    -- breakpoint
    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
    -- start
    vim.keymap.set("n", "<leader>ds", dap.continue, {})
    -- step over (down)
    vim.keymap.set("n", "<leader>dj", dap.step_over, {})
    -- step into (right)
    vim.keymap.set("n", "<leader>dl", dap.step_into, {})
    -- inspect
    -- vim.keymap.set("n", "<leader>di", dap.step_into(), {})

    -- auto attach ui
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}
