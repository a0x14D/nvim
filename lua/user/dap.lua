local M = {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",
      "nvim-neotest/nvim-nio",
    },
  },
}
function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>dt"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    ["<leader>db"] = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    ["<leader>dc"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    ["<leader>dC"] = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
    ["<leader>dd"] = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    ["<leader>dg"] = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    ["<leader>di"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    ["<leader>do"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    ["<leader>du"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    ["<leader>dp"] = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
    ["<leader>dr"] = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    ["<leader>ds"] = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
    ["<leader>dq"] = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    ["<leader>dU"] = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
  }

  require("dapui").setup {
    mappings = {
      -- Use a table to apply multiple mappings
      expand = { "<C-l>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      edit = "e",
      repl = "r",
      toggle = "t",
    },
  }

  local icons = require "user.icons"

  vim.fn.sign_define("DapBreakpoint", { text = icons.ui.Bug, texthl = "DiagnosticSignError", linehl = "", numhl = "" })

  -- Dap config for dap-python
  -- require("dap-python").setup "~/.virtualenvs/debugpy/bin/python"
  -- require("dap-python").test_runner = "pytest"
  --
  -- --bash
  -- local dap = require "dap"
  -- dap.adapters.bashdb = {
  --   type = 'executable',
  --   command = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/bash-debug-adapter',
  --   name = 'bashdb',
  -- }
  -- dap.configurations.sh = {
  --   {
  --     type = 'bashdb',
  --     request = 'launch',
  --     name = "Launch file",
  --     showDebugOutput = true,
  --     pathBashdb = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb',
  --     pathBashdbLib = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir',
  --     trace = true,
  --     file = "${file}",
  --     program = "${file}",
  --     cwd = '${workspaceFolder}',
  --     pathCat = "cat",
  --     pathBash = "/bin/bash",
  --     pathMkfifo = "mkfifo",
  --     pathPkill = "pkill",
  --     args = {},
  --     env = {},
  --     terminalKind = "integrated",
  --   }
  -- }
end

return M
