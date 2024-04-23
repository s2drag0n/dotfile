local M = {
  "mfussenegger/nvim-dap",
}

M.config = function()
  -- require("dap").defaults.fallback.terminal_win_cmd = "50vsplit new"
  local wk = require "which-key"

  wk.register {
    ["<leader>d1"] = { "<Cmd>lua require('dap').continue()<CR>", "DAP Continue" },
    ["<leader>d2"] = { "<Cmd>lua require('dap').step_over()<CR>", "DAP Step Over" },
    ["<leader>d3"] = { "<Cmd>lua require('dap').step_into()<CR>", "DAP Step Into" },
    ["<leader>d4"] = { "<Cmd>lua require('dap').step_out()<CR>", "DAP Step Out" },
    ["<Leader>db"] = { "<Cmd>lua require('dap').toggle_breakpoint()<CR>", "DAP Toggle Breakpoint" },
    -- ["<Leader>dB"] = { "<Cmd>lua require('dap').set_breakpoint()<CR>", "DAP Set Breakpoint" },
    ["<Leader>dB"] = { "<Cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')<CR>", "DAP Set Logpoint" },
    ["<Leader>dr"] = { "<Cmd>lua require('dap').repl.open()<CR>", "DAP REPL Open" },
    ["<Leader>dl"] = { "<Cmd>lua require('dap').run_last()<CR>", "DAP Run Last" },
    ["<Leader>dh"] = { "<Cmd>lua require('dap.ui.widgets').hover()<CR>", "DAP Hover" },
    ["<Leader>dp"] = { "<Cmd>lua require('dap.ui.widgets').preview()<CR>", "DAP Preview" },
    ["<Leader>df"] = {
      "<Cmd>lua require('dap.ui.widgets').centered_float(require('dap.ui.widgets').frames)<CR>",
      "DAP Center Frames",
    },
    ["<Leader>ds"] = {
      "<Cmd>lua require('dap.ui.widgets').centered_float(require('dap.ui.widgets').scopes)<CR>",
      "DAP Center Scopes",
    },
  }
  local dap = require "dap"
  dap.configurations.java = {
    {
      type = "java",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      pythonPath = function()
        return "/usr/bin/java"
      end,
    },
  }
end

return M
