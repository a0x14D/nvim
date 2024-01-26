local M = {
  "Exafunction/codeium.nvim",
  dependencies = { "zhenyangze/vim-bitoai" },
}

function M.config()
  require("codeium").setup {}
end

return M
