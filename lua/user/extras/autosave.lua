--text leave auto save 
vim.cmd([[
 autocmd InsertLeave * silent! write
]])

--text change auto save
vim.cmd [[
 augroup AutoSave
    autocmd!
    autocmd TextChanged * silent! write
    autocmd TextChangedI * echo "File saved automatically"
 augroup END
]]

