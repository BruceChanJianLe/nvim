return {
   {
    'nvim-telescope/telescope.nvim', version = '0.1.4',
    -- or                            , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim',
      -- Fuzzy search in current file
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      -- Use riggrep with flags
      "nvim-telescope/telescope-rg.nvim",
      -- Show available snippets
      { "benfowler/telescope-luasnip.nvim", module = "telescope._extensions.luasnip", --[[ lazy-load ]] },
    }
  },
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  {'nvim-treesitter/playground'},
  -- Show func signature when scrolling
  {"nvim-treesitter/nvim-treesitter-context"},
  {'theprimeagen/harpoon'},
 { 'mbbill/undotree' },

  -- Text object manipulation
  {'tpope/vim-surround'},
  {'wellle/targets.vim'},

  -- color setup
  'RRethy/nvim-base16',
  { "lukas-reineke/indent-blankline.nvim" },
  { "Mofiqul/vscode.nvim" },

   {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'main',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },       -- Using words buffers
      { 'hrsh7th/cmp-path' },         -- Using file{name}s
      { 'hrsh7th/cmp-nvim-lua' },     -- For when writing lua in nvim
      { 'hrsh7th/cmp-nvim-lsp' },     -- LSP support and moving snippets
      { 'saadparwaiz1/cmp_luasnip' }, -- For lua snippets

      -- Snippets
      { 'L3MON4D3/LuaSnip',},
      -- Snippet Collection {Optional}
      { "brucechanjianle/friendly-snippets" }
    }
  },

  -- Autocompletion for pairs
   { "windwp/nvim-autopairs" },
  -- Tabout from pairs
   { 'abecodes/tabout.nvim' },

  -- Git plugins
  {'tpope/vim-fugitive'},
  { 'lewis6991/gitsigns.nvim' },

  -- Commenting
   { 'numToStr/Comment.nvim' },

  -- Statusline
   {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
  },

  -- Terminal
   { "akinsho/toggleterm.nvim", version = '*' },

  -- Buffer tabs
   {
    'akinsho/bufferline.nvim',
    version = "v3.*",
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'moll/vim-bbye'
    }
  },
  { 'moll/vim-bbye' },

  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },
--  -- Markdown preview
--  {
--    "iamcco/markdown-preview.nvim",
--    run = function{} vim.fn["mkdp#util#install"]() end,
--  },

  -- Use by tmux resurrect
   {
    'tpope/vim-obsession',
    dependencies = {
      'tpope/vim-repeat'
    }
  },

  -- Highlights other instances of word under your cursor
   {"RRethy/vim-illuminate"},

  -- Prime worktrees!
   { 'theprimeagen/git-worktree.nvim', },

  -- Notification
   { 'rcarriga/nvim-notify', },

}
