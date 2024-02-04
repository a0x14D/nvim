local M = {
  "nvimtools/none-ls.nvim",
}

function M.config()
  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local code_actions = null_ls.builtins.code_actions
  local hover = null_ls.builtins.hover

  null_ls.setup {
    debug = true,
    sources = {
      --formatting
      formatting.stylua,
      formatting.prettier,
      formatting.shfmt,
      formatting.black.with {
        extra_args = { "--line-length", "120", "--fast" },
      },

      --diagnostics
      diagnostics.markuplint,

      -- formatting.prettier.with {
      --   extra_filetypes = { "python" },
      --   extra_args = { "--config-precedence", "prefer-file" },
      --
      -- },
      -- formatting.eslint,
      -- null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.completion.spell,
    },
  }
end

return M
