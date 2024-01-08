--coloscheme 
local onedark = require ('onedark')

onedark.setup {
   style = 'deep',
   lualine = {
     transparent = true,
   },
   diagnostics = {
     darker = false,
   },
}
vim.cmd "colorscheme onedark_dark"


