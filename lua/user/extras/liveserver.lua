local M = {
  "lethc/bracey.vim",
  build = "npm install --prefix server",
  event = "VeryLazy",
  dependencies = {
    'barrett-ruth/live-server.nvim',
    build = 'pnpm add -g live-server',
  }
}

function M.config()
  require('live-server').setup()
end

return M
