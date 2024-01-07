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
  'junnplus/lsp-setup.nvim',
  'williamboman/mason.nvim',           -- optional
  'williamboman/mason-lspconfig.nvim', -- optional
  { "folke/neodev.nvim",   opts = {} },

  --ui
  {
    "folke/noice.nvim",
    event = "VeryLazy",
  },
  "MunifTanjim/nui.nvim",
  "rcarriga/nvim-notify",
  "onsails/lspkind.nvim",
  'goolord/alpha-nvim',
  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.5',
  },
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope-media-files.nvim",
  "tom-anders/telescope-vim-bookmarks.nvim",
  "j-hui/fidget.nvim",

  --autocompletion
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'hrsh7th/cmp-emoji',
  'chrisgrieser/cmp-nerdfont',
  'lukas-reineke/cmp-under-comparator',
  "rafamadriz/friendly-snippets",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  {
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require "user.copilot"
      end, 100)
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  --tabnine
  { "tzachar/cmp-tabnine", build = "./install.sh" },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  'numToStr/Comment.nvim',
  'JoosepAlviste/nvim-ts-context-commentstring',
  {
    "Exafunction/codeium.nvim",
    config = function()
        require("codeium").setup({
        })
    end,
  },

  --colorscheme
  'navarasu/onedark.nvim',
  {
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors').setup {
        render = "background", -- or 'foreground' or 'first_column'
        enable_named_colors = true,
        enable_tailwind = true,
      }
    end
  },
  "uga-rosa/ccc.nvim",

  --starusline
  'nvim-lualine/lualine.nvim',


}


local opts = {
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = true, -- get a notification when changes are found
  },
  ui = {
    border = "rounded",
  },
  install = {
    -- install missing plugins on startup. This doesn't increase startup time.
    missing = true,
    -- try to load one of these colorschemes when starting an installation during startup
    colorscheme = { "rose-pine" },
  }
}


require("lazy").setup(plugins, opts)
