local M = {
  "aidenlangley/auto-save.nvim",
  event = { "BufReadPre" },
  opts = {
    events = { "InsertLeave", "BufLeave" },
    silent = true,
    exclude_ft = { "neo-tree" },
  },
}

function M.config()
  require("auto-save").setup {}
end

return M
