return {
  "mfussenegger/nvim-dap",
  -- lazy = false,
  dependencies = {
    "leoluz/nvim-dap-go",
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")

    dapui.setup()
    require("dap-go").setup()
    -- still unsure if I like the inline values, created by virtual text
    require("nvim-dap-virtual-text").setup()

    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
    vim.keymap.set("n", "<leader>ds", dap.continue, { desc = "Start/continue debugging" })
    vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Stop debugging" })
    vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Restart debugger" })
    vim.keymap.set("n", "<leader>dc", dap.run_to_cursor, { desc = "Run to cursor" })
    vim.keymap.set("n", "<leader>dj", dap.step_over, { desc = "Step over" })
    vim.keymap.set("n", "<leader>dl", dap.step_into, { desc = "Step into" })
    vim.keymap.set("n", "<leader>dh", dap.step_out, { desc = "Step out" })
    vim.keymap.set("n", "<leader>d?", function()
      dapui.eval(nil, { enter = true })
    end, { desc = "Inspect Variable under Cursor" })

    -- barebones rust
    dap.adapters.codelldb = {
      type = "executable",
      command = "codelldb",
    }

    dap.configurations.rust = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
    }

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
