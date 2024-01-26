local M = {
  "lethc/bracey.vim",
  build = "npm install --prefix server",
  event = "VeryLazy",
  dependencies = {
      "aurum77/live-server.nvim",
     cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
  }
}

function M.config()
   require"live_server.util".install()

end

return M
