return {
  -- nui.nvim can be lazy loaded
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        views = {
          cmdline_popup = {
            size = {
              width = 70,
              height = "auto",
            },
            position = {
              row = "80%",
              col = "50%",
            },
          },
        },
      })
    end,
  },
}
