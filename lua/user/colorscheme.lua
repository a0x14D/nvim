-- local colorscheme = "darkplus"

-- local colorscheme = "tokyonight-storm"
-- local colorscheme = "rose-pine-main"
-- local colorscheme = "hackthebox"
local colorscheme = "onedark"

vim.g.onedarker_italic_keywords = false

vim.g.onedarker_italic_functions = false

vim.g.onedarker_italic_comments = true

vim.g.onedarker_italic_loops = false

vim.g.onedarker_italic_conditionals = false

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  -- vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

local onedark = require("onedark")

onedark.setup {
  style = "darker",
  code_style = {
    comments = 'italic',
    keywords = 'italic',
    functions = 'italic',
    strings = 'none',
    variables = 'none'
  },

}
