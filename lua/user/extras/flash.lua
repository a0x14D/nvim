local M = {
  "folke/flash.nvim",
  -- event = "VeryLazy",
}

function M.config()
  require("flash").setup({
    search = {
      mode = "search"
    },
    modes = {
      char = {
        jump_labels = true
      }
    },
    pattern = vim.fn.expand("<cword>"),
    continue = true,
    rainbow = {
      enabled = true,
      shade = 3,
    },
  })
end

return M
