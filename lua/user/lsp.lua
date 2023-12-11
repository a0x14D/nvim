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

