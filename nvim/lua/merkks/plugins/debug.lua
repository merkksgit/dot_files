return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Mason-DAP setup to ensure JS debug adapter installation
    require("mason-nvim-dap").setup({
      ensure_installed = { "js-debug-adapter" },
      automatic_installation = true,
    })

    -- UI setup
    dapui.setup({
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.25 },
            "breakpoints",
            "stacks",
            "watches",
          },
          size = 40,
          position = "left",
        },
        {
          elements = {
            "repl",
            "console",
          },
          size = 0.25,
          position = "bottom",
        },
      },
    })

    -- 2. Use after for opening and before for closing
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- 4. Debugger configuration
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = {
          -- Ensure this path is correct
          vim.fn.expand("~/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"),
          "${port}",
        },
      },
    }

    -- 5. JavaScript configurations for both Node apps and plain JS files
    dap.configurations.javascript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Debug Current JavaScript File (Node.js)",
        program = "${file}",
        cwd = "${workspaceFolder}",
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
        internalConsoleOptions = "neverOpen",
      },
      -- Configuration for plain JavaScript file debugging
      {
        type = "pwa-node",
        request = "launch",
        name = "Debug Standalone JavaScript File (Node.js)",
        program = "${file}",
        cwd = "${fileDirname}",
        sourceMaps = true,
        runtimeExecutable = "node",
        skipFiles = { "<node_internals>/**" },
        internalConsoleOptions = "neverOpen",
      },
    }

    -- 6. TypeScript configuration
    dap.configurations.typescript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Debug TypeScript File",
        program = "${file}",
        cwd = "${fileDirname}",
        runtimeArgs = { "--loader", "ts-node/esm" },
        runtimeExecutable = "node",
        sourceMaps = true,
        skipFiles = { "<node_internals>/**" },
        outFiles = { "${workspaceFolder}/**/*.js" },
      },
    }

    -- 7. Additional configuration to prevent early termination
    dap.defaults.fallback.terminal_win_cmd = "50vsplit new"

    -- 8. Keymaps with labels
    vim.keymap.set("n", "<Leader>dt", function()
      dap.toggle_breakpoint()
    end, { desc = "Debug: Toggle Breakpoint" })

    vim.keymap.set("n", "<Leader>dc", function()
      dap.continue()
    end, { desc = "Debug: Continue/Start" })

    vim.keymap.set("n", "<Leader>dx", function()
      dap.terminate()
    end, { desc = "Debug: Terminate" })

    vim.keymap.set("n", "<Leader>do", function()
      dap.step_over()
    end, { desc = "Debug: Step Over" })

    vim.keymap.set("n", "<Leader>di", function()
      dap.step_into()
    end, { desc = "Debug: Step Into" })

    vim.keymap.set("n", "<Leader>dO", function()
      dap.step_out()
    end, { desc = "Debug: Step Out" })

    vim.keymap.set("n", "<Leader>du", function()
      dapui.toggle()
    end, { desc = "Debug: Toggle UI" })

    vim.keymap.set("n", "<Leader>dl", function()
      dap.run_last()
    end, { desc = "Debug: Run Last" })

    vim.keymap.set("n", "<Leader>dd", function()
      dap.clear_breakpoints()
    end, { desc = "Debug: Clear All Breakpoints" })
  end,
}
