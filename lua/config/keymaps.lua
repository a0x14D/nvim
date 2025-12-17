-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Press jk fast to enter
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
