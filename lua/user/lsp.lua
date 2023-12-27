local lsp_status_ok, lsp = pcall(require, "lsp-setup")
if not lsp_status_ok then
  return
end

require('neodev').setup()

--lsp servers
lsp.setup {
  servers = {
    lua_ls = {},
    bashls = {},
    clangd = {},
    cssls = {},
    emmet_ls = {},
    html = {},
    tsserver = {},
    marksman = {},
    pyright = {},
  },
}

-- Diagnostics
vim.diagnostic.config {
  virtual_text = true,
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = true,
}
vim.fn.sign_define('DiagnosticSignError', { texthl = 'DiagnosticSignError', text = '󰛉', numhl = '' })
vim.fn.sign_define('DiagnosticSignWarn', { texthl = 'DiagnosticSignWarn', text = '', numhl = '' })
vim.fn.sign_define('DiagnosticSignHint', { texthl = 'DiagnosticSignHint', text = '', numhl = '' })
vim.fn.sign_define('DiagnosticSignInfo', { texthl = 'DiagnosticSignInfo', text = '', numhl = '' })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
