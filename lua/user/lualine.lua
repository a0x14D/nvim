local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end


vim.api.nvim_set_hl(0, "SLError", { fg = "#ff0000", bg = "NONE" })
vim.api.nvim_set_hl(0, "SLWarning", { fg = "#fffa00", bg = "NONE" })
vim.api.nvim_set_hl(0, "SLGitIcon", { fg = "#ffc700", bg = "NONE" })
vim.api.nvim_set_hl(0, "SLBranchName", { fg = "#dbe4f5", bg = "NONE", bold = false })

local icons = require "user.icons"
local branch = {
  "branch",
  icons_enabled = true,
   icon = "%#SLGitIcon#" .. " " .. "%*" .. "%#SLBranchName#",
}

local diff = {
  "diff",
  colored = false,
  symbols = { added = icons.git.Add .. " ", modified = icons.git.Mod .. " ", removed = icons.git.Remove .. " " }, -- changes diff symbols
  separator = "%#SLSeparator#" .. "| " .. "%*",
}



lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { branch , diff, 'filename' },
    lualine_c = { 'diagnostics' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

