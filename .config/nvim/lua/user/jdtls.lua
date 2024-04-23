local M = {
  "mfussenegger/nvim-jdtls",
  depends = "mfussenegger/nvim-dap",
}

function M.config()
  -- 设置键盘映射
  -- 重构
  vim.api.nvim_set_keymap(
    "n",
    "<A-o>",
    '<Cmd>lua require("jdtls").organize_imports()<CR>',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "crv",
    '<Cmd>lua require("jdtls").extract_variable()<CR>',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "v",
    "crv",
    '<Esc><Cmd>lua require("jdtls").extract_variable(true)<CR>',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "crc",
    '<Cmd>lua require("jdtls").extract_constant()<CR>',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "v",
    "crc",
    '<Esc><Cmd>lua require("jdtls").extract_constant(true)<CR>',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "v",
    "crm",
    '<Esc><Cmd>lua require("jdtls").extract_method(true)<CR>',
    { noremap = true, silent = true }
  )
  -- -- 测试相关
  -- local wk = require "which-key"
  -- local jdtls_mappings = {
  --   ["<leader>df"] = { "<Cmd>lua require('jdtls').test_class()<CR>", "Test Class" },
  --   ["<leader>dn"] = { "<Cmd>lua require('jdtls').test_nearest_method()<CR>", "Test Nearest Method" },
  -- }
  -- wk.register(jdtls_mappings)
end

return M
