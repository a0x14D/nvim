-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--text leave auto save
vim.cmd([[
 autocmd InsertLeave * silent! write
]])

--text change auto save
vim.cmd([[
 augroup AutoSave
    autocmd!
    autocmd TextChanged * silent! write
    autocmd TextChangedI * echo "File saved automatically"
 augroup END
]])
