-- https://github.com/pedro757/emmet
-- npm i -g ls_emmet
local mason = vim.fn.stdpath("data") .. "/mason/bin/emmet-ls"
return {
  cmd = { mason, "--stdio" },
  filetypes = {
    "html",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "haml",
    "xml",
    "xsl",
    "pug",
    "slim",
    "sass",
    "stylus",
    "less",
    "sss",
    "hbs",
    "handlebars",
  },


}
