return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  event = "VeryLazy",

  config =  function ()
    require("lsp_lines").setup {}
  vim.diagnostic.config { virtual_lines = true }
  end
}

