local darkplus = {
  "LunarVim/darkplus.nvim",
  lazy = true, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function darkplus.config()
  vim.cmd.colorscheme "darkplus"
end

local catppuccin = {
  "catppuccin/nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function catppuccin.config()
  vim.cmd.colorscheme "catppuccin-mocha"
end

return catppuccin
