local M = {
  "nvim-java/nvim-java",
  dependencies = {
    "nvim-java/lua-async-await",
    "nvim-java/nvim-java-core",
    "nvim-java/nvim-java-test",
    "nvim-java/nvim-java-dap",
    "MunifTanjim/nui.nvim",
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    {
      "williamboman/mason.nvim",
      opts = {
        registries = {
          "github:nvim-java/mason-registry",
          "github:mason-org/mason-registry",
        },
      },
    },
  },
}

function M.config()
  require("java").setup()
  require("lspconfig").jdtls.setup {}
  local wk = require("which-key")
  wk.register {
    ["<leader>"] = {
      j = {
        name = "Java",
        m = { "<cmd>JavaRunnerRunMain<CR>", "Java Run Code" },
        s = { "<cmd>JavaRunnerStopMainCR>", "Java Stop Run" },
        l = { "<cmd>JavaRunnerToggleLogs<CR>", "Java Show Log" },
        -- a = { "<cmd>JavaAddImport<CR>", "Add Import" },
        -- c = { "<cmd>JavaGenerateAccessor<CR>", "Generate Accessor" },
        -- d = { "<cmd>JavaDoc<CR>", "Generate JavaDoc" },
        -- e = { "<cmd>JavaExtractVariable<CR>", "Extract Variable" },
        -- f = { "<cmd>JavaFormat<CR>", "Format" },
        -- i = { "<cmd>JavaImplementMethods<CR>", "Implement Methods" },
        -- l = { "<cmd>JavaList<CR>", "List" },
        -- m = { "<cmd>JavaGenerateMethod<CR>", "Generate Method" },
        -- o = { "<cmd>JavaOrganizeImports<CR>", "Organize Imports" },
        -- r = { "<cmd>JavaRename<CR>", "Rename" },
        -- s = { "<cmd>JavaSignatureHelp<CR>", "Signature Help" },
        -- t = { "<cmd>JavaRunTest<CR>", "Run Test" },
        -- u = { "<cmd>JavaUpdateImports<CR>", "Update Imports" },
        -- v = { "<cmd>JavaExtractVariable<CR>", "Extract Variable" },
        -- w = { "<cmd>JavaGenerateGetterSetter<CR>", "Generate Getter Setter" },
      },
    },
  }

end

return M
