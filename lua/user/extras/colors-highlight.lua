local M = {
  "brenoprata10/nvim-highlight-colors",
  event = "VeryLazy",
}

function M.config()
  require("nvim-highlight-colors").setup()
end

return M
