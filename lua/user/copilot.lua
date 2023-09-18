-- For copilot.vim
-- vim.g.copilot_filetypes = {
--   ["*"] = false,
-- }

-- vim.cmd [[
--   imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")
--   let g:copilot_no_tab_map = v:true
-- ]]

local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
  return
end

copilot.setup {
  cmp = {
    enabled = true,
    method = "getCompletionsCycling",
  },
 panel = { -- no config options yet
    enabled = true,
    auto_refresh = true,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<C-A>",
      refresh = "gr",
      open = "<M-CR>",
    },
  },
  ft_disable = { "markdown" },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<C-A>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
      filetypes = {
      ["*"] = true,
    },
  },
  -- plugin_manager_path = vim.fn.stdpath "data" .. "/site/pack/packer",
  server_opts_overrides = {
    -- trace = "verbose",
    settings = {
      advanced = {
        -- listCount = 10, -- #completions for panel
        inlineSuggestCount = 3, -- #completions for getCompletions
      },
    },
  },
}
