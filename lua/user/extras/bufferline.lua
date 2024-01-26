local M = {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
}

function M.config()
  require("bufferline").setup()
end

return M
