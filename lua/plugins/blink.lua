return {

  "saghen/blink.cmp",

  opts = {
    cmdline = {
      enabled = true,
      completion = {
        ghost_text = { enabled = true },
      },
    },
    keymap = {
      preset = "default",
      ["<CR>"] = { "accept", "fallback" },
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
    },
    completion = {
      menu = { border = "single" },
      documentation = { window = { border = "single" } },
      list = { selection = { preselect = true, auto_insert = true } },
    },
    signature = { window = { border = "single" } },
  },
}
