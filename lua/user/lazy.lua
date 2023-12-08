local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	--devlopment
	"neovim/nvim-lspconfig",
	"nvim-treesitter/nvim-treesitter",
	"nvim-tree/nvim-web-devicons",

  --ui
  {
  "folke/noice.nvim",
  event = "VeryLazy",
  },
  "MunifTanjim/nui.nvim",
  "rcarriga/nvim-notify",

  --autocompletion
   'hrsh7th/cmp-nvim-lsp',
   'hrsh7th/cmp-buffer',
   'hrsh7th/cmp-path',
   'hrsh7th/cmp-cmdline',
   'hrsh7th/nvim-cmp',
   'L3MON4D3/LuaSnip',
   'saadparwaiz1/cmp_luasnip',
   'onsails/lspkind.nvim',
   'hrsh7th/cmp-emoji',
   'chrisgrieser/cmp-nerdfont',


   --colorscheme
   'navarasu/onedark.nvim',


}





require("lazy").setup(plugins, opts)

