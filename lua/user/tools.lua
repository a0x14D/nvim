require("lspconfig")["intelephense"].setup {
  on_attach = on_attach,
}

-- emmet_ls setup
require("lspconfig")["emmet_ls"].setup {
  on_attach = on_attach,
}

--toggle lsp diagnostics
-- require("toggle_lsp_diagnostics").init {
--   --config
--   -- show_diagnostics = true,
--   -- show_line_diagnostics = true,
--   -- show_cursor_diagnostics = true,
--   -- show_virtual_text = true,
--   underline_diagnostics = true,
--   update_in_insert = true,
-- }

require("nvim-highlight-colors").setup {
  render = "background", -- or 'foreground' or 'first_column'
  enable_named_colors = true,
  enable_tailwind = true,
}

--nightly
require("nightly").setup {
  color = "black", -- blue, green or red
  transparent = false,
  styles = {
    comments = { italic = true },
    functions = { italic = true },
    keywords = { italic = false },
    variables = { italic = false },
  },
  highlights = {
    -- add or override highlights
    -- Normal = { bg = "#000000" }
  },
}

-- require("copilot.suggestion").toggle_auto_trigger()
