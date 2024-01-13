local flash = require("flash")

flash.setup {
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
}
