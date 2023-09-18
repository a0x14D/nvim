local status_ok, move = pcall(require, "move")
if not status_ok then
  return
end

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<A-S-j>', ':MoveLine(1)<CR>', opts)
vim.keymap.set('n', '<A-S-k>', ':MoveLine(-1)<CR>', opts)
vim.keymap.set('v', '<A-S-j>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<A-S-k>', ':MoveBlock(-1)<CR>', opts)

vim.keymap.set('n', '<A-S-h>', ':MoveHChar(-1)<CR>', opts)
vim.keymap.set('n', '<A-S-l>', ':MoveHChar(1)<CR>', opts)
vim.keymap.set('v', '<A-S-h>', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-S-l>', ':MoveHBlock(1)<CR>', opts)
