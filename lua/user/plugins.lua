local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  }
end

vim.opt.runtimepath:prepend(lazypath)

-- Install your plugins here
local plugins = {
  -- Plugin Mangager
  {
    "folke/lazy.nvim",
  }, -- Plugin Manager

  -- Lua Development
  { "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins
  { "nvim-lua/popup.nvim" },
  { "christianchiarulli/lua-dev.nvim" },
  -- use "folke/lua-dev.nvim"

  -- LSP
  {
    "neovim/nvim-lspconfig", -- enable LSP
    -- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "nvimtools/none-ls.nvim", -- for formatters and linters
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts) require 'lsp_signature'.setup(opts) end
  },
  {
    "SmiteshP/nvim-navic",
    "simrat39/symbols-outline.nvim",
    "b0o/SchemaStore.nvim",
    "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
    -- "Maan2003/lsp_lines.nvim",
  },
  -- use "github/copilot.vim"

  {
    "RRethy/vim-illuminate",
    "lvimuser/lsp-inlayhints.nvim",
    "simrat39/inlay-hints.nvim",
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {
      -- options
    },
  },
  {
    -- Completion
    "hrsh7th/nvim-cmp",         -- completion
    -- use "christianchiarulli/nvim-cmp"
    "hrsh7th/cmp-buffer",       -- buffer completions
    "hrsh7th/cmp-path",         -- path completions
    "hrsh7th/cmp-cmdline",      -- cmdline completions
    "saadparwaiz1/cmp_luasnip", -- snippet completions
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-nvim-lua",
    "uga-rosa/cmp-dictionary",
    -- use "hrsh7th/cmp-copilot"
    "zhenyangze/vim-bitoai",
  },
  --github copilot lua
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
    "L3MON4D3/LuaSnip",             --snippet engine
    "rafamadriz/friendly-snippets", -- a bunch of snippets to use
  },
  {
    -- Syntax/Treesitter
    "nvim-treesitter/nvim-treesitter",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "p00f/nvim-ts-rainbow",
    "nvim-treesitter/playground",
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/nvim-treesitter-textobjects",
    -- use "wellle/targets.vim"
    -- use "RRethy/nvim-treesitter-textsubjects"
    {
      "abecodes/tabout.nvim",
      wants = { "nvim-treesitter" }, -- or require if not used so far
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  },
  {
    -- Marks
    "christianchiarulli/harpoon",
    "MattesGroeger/vim-bookmarks",
    -- Fuzzy Finder/Telescope
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    "tom-anders/telescope-vim-bookmarks.nvim",
    -- Note Taking
    "mickael-menu/zk-nvim",
    -- Color
    -- use "NvChad/nvim-colorizer.lua"
    "brenoprata10/nvim-highlight-colors",
    -- Colorschemes
    "lunarvim/onedarker.nvim",
    'navarasu/onedark.nvim',
    "lunarvim/darkplus.nvim",
    "folke/tokyonight.nvim",
    "ellisonleao/gruvbox.nvim",
    "Alexis12119/nightly.nvim",
    { "rose-pine/neovim", name = "rose-pine" },
    -- use "lunarvim/colorschemes"
    -- Utility
    "rcarriga/nvim-notify",
    "stevearc/dressing.nvim",
    "ghillb/cybu.nvim",
    "moll/vim-bbye",
    "lewis6991/impatient.nvim",
    "lalitmee/browse.nvim",
    -- Icon
    "kyazdani42/nvim-web-devicons",
  },
  { "uga-rosa/ccc.nvim",   commit = "d17dabd792082a22bf2bc9e8fc906b3580250cd7" },
  {
    -- Debugging
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
    "theHamsta/nvim-dap-virtual-text",
    -- use "Pocco81/DAPInstall.nvim"

    -- Tabline
    { "akinsho/bufferline.nvim",             version = "*" },
    "tiagovla/scope.nvim",

    -- Statusline
    "christianchiarulli/lualine.nvim",

    -- Startup
    "goolord/alpha-nvim",

    -- Indent
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    -- File Explorer
    "kyazdani42/nvim-tree.lua",
    "christianchiarulli/lir.nvim",

    -- Comment
    "numToStr/Comment.nvim",
    "folke/todo-comments.nvim",

    -- Terminal
    "akinsho/toggleterm.nvim",

    -- Project
    "ahmedkhalf/project.nvim",
    "windwp/nvim-spectre",
  },
  {
    -- Session
    "rmagatti/auto-session",
    "rmagatti/session-lens",

    -- Quickfix
    "kevinhwang91/nvim-bqf",

    -- Code Runner
    "is0n/jaq-nvim",
  },
  {
    "0x100101/lab.nvim",
    build = "cd js && npm ci",
  },
  {
    -- Git
    "lewis6991/gitsigns.nvim",
    "f-person/git-blame.nvim",
    "ruifm/gitlinker.nvim",
    "mattn/vim-gist",
    "mattn/webapi-vim",

    -- Github
    "pwntester/octo.nvim",

    -- Editing Support
    "windwp/nvim-autopairs",
    "monaqa/dial.nvim",
    "nacro90/numb.nvim",
    "andymass/vim-matchup",
    "folke/zen-mode.nvim",
    -- use "Pocco81/true-zen.nvim"
    "karb94/neoscroll.nvim",
    "junegunn/vim-slash",

    -- Motion
    { "folke/flash.nvim", event = "VeryLazy", },


    -- Keybinding
    "folke/which-key.nvim",

    -- Java
    "mfussenegger/nvim-jdtls",
  },
  -- Rust
  { "christianchiarulli/rust-tools.nvim", branch = "modularize_and_inlay_rewrite" },
  { "Saecki/crates.nvim" },

  -- Typescript TODO: set this up, also add keybinds to ftplugin
  { "jose-elias-alvarez/typescript.nvim" },

  -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
  },
  --auto save
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        -- your config goes here
        -- or just leave it empty :)
      }
    end,
  },
  --move lines

  --multi cursor
  { "mg979/vim-visual-multi", branch = "master" },

  --live server
  -- { "manzeloth/live-server" },

  --liveserver with live complete
  { "turbio/bracey.vim",      build = "npm install --prefix server" },

  -- better escaping
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
  { "ThePrimeagen/vim-be-good" },
  -- {
  --   "4542elgh/ChatGPT.nvim",
  --   config = function()
  --     require("chatgpt").setup {}
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --   },
  -- },
  --commadline
  { "gelguy/wilder.nvim" },
  { "RaafatTurki/hex.nvim" },
  { "nvim-telescope/telescope-file-browser.nvim" },
  { "michaelb/sniprun",                          build = "bash ./install.sh" },
  { "a0x14D/hackthebox.vim" },
  { "MunifTanjim/nui.nvim" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    opts = {
      -- configurations go here
    },
  },
  {
    "aurum77/live-server.nvim",
    run = function()
      require "live_server.util".install()
    end,
    cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
  },
  --notify
  "folke/noice.nvim",
}

local opts = {
  git = {
    -- defaults for the `Lazy log` command
    -- log = { "-10" }, -- show the last 10 commits
    log = { "--since=3 days ago" }, -- show commits from the last 3 days
    timeout = 300,                  -- kill processes that take more than 2 minutes
    url_format = "https://github.com/%s.git",
  },
  lockfile = vim.fn.stdpath "data" .. "/lazy-lock.json", -- lockfile generated after running update.
  concurrency = nil, ---@type number limit the maximum amount of concurrent tasks
  dev = {
    -- directory where you store your local plugin projects
    path = "~/projects",
    ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
    patterns = {}, -- For example {"folke"}
  },
  install = {
    -- install missing plugins on startup. This doesn't increase startup time.
    missing = true,
    -- try to load one of these colorschemes when starting an installation during startup
    colorscheme = { "rose-pine" },
  },
  ui = {
    -- a number <1 is a percentage., >1 is a fixed size
    size = { width = 0.8, height = 0.8 },
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "rounded",
    icons = {
      cmd = " ",
      config = "",
      event = "",
      ft = " ",
      init = " ",
      keys = " ",
      plugin = " ",
      runtime = " ",
      source = " ",
      start = "",
      task = "✔ ",
    },
    throttle = 20, -- how frequently should the ui process render events
    custom_keys = {},
    diff = {
      -- diff command <d> can be one of:
      -- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
      --   so you can have a different command for diff <d>
      -- * git: will run git diff and open a buffer with filetype git
      -- * terminal_git: will open a pseudo terminal with git diff
      -- * diffview.nvim: will open Diffview to show the diff
      cmd = "git",
    },
  },
  checker = {
    -- automatically check for plugin updates
    enabled = false,
    concurrency = nil, ---@type number? set to 1 to check for updates very slowly
    notify = true,    -- get a notification when new updates are found
    frequency = 3600, -- check for updates every hour
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = true, -- get a notification when changes are found
  },
  -- lazy can generate helptags from the headings in markdown readme files,
  -- so :help works even for plugins that don't have vim docs.
  -- when the readme opens with :help it will be correctly displayed as markdown
  performance = {
    cache = {
      enabled = true,
      path = vim.fn.stdpath "state" .. "/lazy/cache",
      -- Once one of the following events triggers, caching will be disabled.
      -- To cache all modules, set this to `{}`, but that is not recommended.
      -- The default is to disable on:
      --  * VimEnter: not useful to cache anything else beyond startup
      --  * BufReadPre: this will be triggered early when opening a file from the command line directly
      disable_events = { "VimEnter", "BufReadPre" },
    },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = false,       -- reset the runtime path to $VIMRUNTIME and your config directory
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  readme = {
    root = vim.fn.stdpath "state" .. "/lazy/readme",
    files = { "README.md" },
    -- only generate markdown helptags for plugins that dont have docs
    skip_if_doc_exists = true,
  },
}

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

lazy.setup(plugins, opts)
