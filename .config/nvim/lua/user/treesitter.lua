local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
}

function M.config()
  require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python", "c", "java", "cpp", },
    highlight = { 
      enable = true ,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    modules = {},
    sync_install = true,
    auto_install = true,
    ignore_install = {},
  }
end

return M
