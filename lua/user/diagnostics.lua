local icons = require "user.icons"
local signs = {

  { name = "DiagnosticSignError", text = icons.diagnostics.Error },
  { name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
  { name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
  { name = "DiagnosticSignInfo",  text = icons.diagnostics.Information },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { text = sign.text, texthl = sign.name })
end

local config = {
  -- disable virtual text
  virtual_lines = false,
  virtual_text = true,
  -- virtual_text = {
  --   -- spacing = 7,
  --   -- update_in_insert = false,
  --   -- severity_sort = true,
  --   -- prefix = "<-",
  --   prefix = " ●",
  --   source = "if_many", -- Or "always"
  --   -- format = function(diag)
  --   --   return diag.message .. "blah"
  --   -- end,
  -- },

  -- show signs
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = false,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    -- border = {"▄","▄","▄","█","▀","▀","▀","█"},
    source = "always",   -- Or "always"
    header = "",
    prefix = "",
    -- width = 40,
  },
}
vim.diagnostic.config(config)
