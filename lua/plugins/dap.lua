return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    {
      "ldelossa/nvim-dap-projects",
    },
    "theHamsta/nvim-dap-virtual-text",
  },
  lazy = true,
  keys = {
    {
      "<F5>",
      function()
        require("dap").continue()
      end,
      desc = "DAP Continue (F5)",
      mode = "n",
    },
    {
      "<F10>",
      function()
        require("dap").step_over()
      end,
      desc = "DAP Step Over (F10)",
      mode = "n",
    },
    {
      "<F9>",
      function()
        require("dap").step_into()
      end,
      desc = "DAP Step Into (F9)",
      mode = "n",
    },
    {
      "<F12>",
      function()
        require("dap").step_out()
      end,
      desc = "DAP Step Out (F12)",
      mode = "n",
    },
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "DAP Toggle Breakpoint",
      mode = "n",
    },
    {
      "<leader>dB",
      function()
        require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
      end,
      desc = "DAP Set Conditional Breakpoint",
      mode = "n",
    },
    {
      "<leader>dr",
      function()
        require("dap").repl.open()
      end,
      desc = "DAP REPL Open",
      mode = "n",
    },
    {
      "<leader>d?",
      function()
        require("dapui").toggle()
      end,
      desc = "DAP UI Toggle",
      mode = "n",
    },
    {
      "<leader>dl",
      function()
        require("dap").run_last()
      end,
      desc = "DAP Run Last",
      mode = "n",
    },
    {
      "<leader>dq",
      function()
        -- Terminates the debug session and closes UI
        local dap = require "dap"
        local dapui = require "dapui"
        dap.terminate()
        dapui.close()
      end,
      desc = "DAP Close Session",
      mode = "n",
    },
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"

    require("nvim-dap-projects").search_project_config()

    dapui.setup {
      layouts = {
        {
          elements = { "scopes", "breakpoints", "stacks", "watches" },
          size = 40,
          position = "left",
        },
        {
          elements = { "repl", "console" },
          size = 10,
          position = "bottom",
        },
      },
      element_mappings = {
        stacks = {
          open = "<CR>",
          expand = "o",
        },
      },
    }

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    require("nvim-dap-virtual-text").setup()
  end,
}
