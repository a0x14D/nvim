local M = {
  "lethc/bracey.vim",
  build = "npm install --prefix server",
  dependencies = {
    'barrett-ruth/live-server.nvim',
    'ray-x/web-tools.nvim',
  }
}

function M.config()
  require('live-server').setup()
  require('web-tools').setup()
end

return M
