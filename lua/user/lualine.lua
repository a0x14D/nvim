local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end


vim.api.nvim_set_hl(0, "SLError", { fg = "#ff0000", bg = "NONE" })
vim.api.nvim_set_hl(0, "SLWarning", { fg = "#fffa00", bg = "NONE" })
vim.api.nvim_set_hl(0, "SLGitIcon", { fg = "#fe9303", bg = "NONE" })
vim.api.nvim_set_hl(0, "SLBranchName", { fg = "#ffffff", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "SLProgress", { fg = "#ff00ff", bg = 'NONE' })
vim.api.nvim_set_hl(0, "SLLocation", { fg = "#268aff", bg = "NONE" })
vim.api.nvim_set_hl(0, "SLFT", { fg = "#00ffff", bg = "NONE" })
vim.api.nvim_set_hl(0, "SLIndent", { fg = "", bg = "NONE" })
vim.api.nvim_set_hl(0, "SLError", { fg = "#ff0000", bg = "NONE" })
vim.api.nvim_set_hl(0, "SLWarning", { fg = "#fffa00", bg = "NONE" })
vim.api.nvim_set_hl(0, "SLCopilot", { fg = "#6cc600", bg = "NONE" })


local icons = require "user.icons"
local branch = {
  "branch",
  icons_enabled = true,
  --icon = "%#SLGitIcon#" .. " " .. "%*" .. "%#SLBranchName#",
  icon = "%#SLGitIcon#" .. "" .. "%*" .. "%#SLBranchName#",


}

local diff = {
  "diff",
  colored = true,
  symbols = { added = icons.git.Add .. " ", modified = icons.git.Mod .. " ", removed = icons.git.Remove .. " " }, -- changes diff symbols
  separator = "%#SLSeparator#" .. "| " .. "%*",
}

local lsp_name = {
  function()
    local msg = "No Active Lsp"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  --icon = " LSP:",
  color = { fg = "#33ff17", gui = "bold" },
}

local filename = {
  "filename",
  color = { fg = "#70d7e2", gui = "bold" },
}

local filetype = {
  "filetype",
  colored = true,
  color = { fg = "#EEC759" }

}


local progress = {
  function()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")

    local result, _ = math.modf((current_line / total_lines) * 100)

    return " " .. result .. "%% "
  end,
  color = { fg = "#45FFCA", gui = "bold" },
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
    lualine_b = { branch },
    lualine_c = { filename, diff },
    lualine_x = { lsp_name, filetype },
    lualine_y = { progress },
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
