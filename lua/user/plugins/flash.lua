return {
   "folke/flash.nvim",
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
