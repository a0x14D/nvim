local M = {
  -- "LunarVim/primer.nvim",
  -- "LunarVim/darkplus.nvim",
  -- lazy = false, -- make sure we load this during startup if it is your main colorscheme
  -- priority = 1000, -- make sure to load this before all the other start plugins
   'navarasu/onedark.nvim',
  -- "folke/tokyonight.nvim",
}

function M.config()
  -- vim.cmd.colorscheme "primer_dark"
  -- vim.cmd.colorscheme "darkplus"
  vim.cmd.colorscheme "onedark"
end

return M
