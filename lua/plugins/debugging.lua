-- Debugging with nvim-dap
return {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap, dapui = require("dap"), require("dapui")
        dapui.setup()

        -- Auto open/close dap-ui
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

        -- Keymaps
        vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
        vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue/Start debugging" })
        vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
        vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step over" })
        vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Step out" })
        vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
        vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
    end,
}
