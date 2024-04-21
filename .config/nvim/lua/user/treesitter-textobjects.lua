local M = {
  "nvim-treesitter/nvim-treesitter-textobjects",
}

function M.config()
  require'nvim-treesitter.configs'.setup {
    textobjects = {
      select = {
        enable = true,
  
        lookahead = true,
  
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
          ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
        },
        selection_modes = {
          ['@parameter.outer'] = 'v', -- charwise
          ['@function.outer'] = 'V', -- linewise
          ['@class.outer'] = '<c-v>', -- blockwise
        },
        include_surrounding_whitespace = true,
      },
    },
  }
end

return M
