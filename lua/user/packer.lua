-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    requires = { 'nvim-lua/plenary.nvim',
      -- Fuzzy search in current file
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        requires = {
          'junegunn/fzf',
          commit = '7191ebb615f5d6ebb', -- fzf version 0.20.0
          run = function() vim.fn['fzf#install']() end}
        },
      -- Use riggrep with flags
      "nvim-telescope/telescope-rg.nvim",
      -- Show available snippets
      { "benfowler/telescope-luasnip.nvim", module = "telescope._extensions.luasnip", --[[ lazy-load ]] },
    }
  }


  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('nvim-treesitter/playground')
  -- Show func signature when scrolling
  use("nvim-treesitter/nvim-treesitter-context");
  use('theprimeagen/harpoon')
  use { 'mbbill/undotree' }

  -- Text object manipulation
  use('tpope/vim-surround')
  use('wellle/targets.vim')

  -- color setup
  use('RRethy/nvim-base16')
  use { "lukas-reineke/indent-blankline.nvim" }
  use { "Mofiqul/vscode.nvim" }

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },       -- Using words buffers
      { 'hrsh7th/cmp-path' },         -- Using file(name)s
      { 'hrsh7th/cmp-nvim-lua' },     -- For when writing lua in nvim
      { 'hrsh7th/cmp-nvim-lsp' },     -- LSP support and moving snippets
      { 'saadparwaiz1/cmp_luasnip' }, -- For lua snippets

      -- Snippets
      { 'L3MON4D3/LuaSnip',},
      -- Snippet Collection (Optional)
      { "brucechanjianle/friendly-snippets" }
    }
  }

  -- Autocompletion for pairs
  use { "windwp/nvim-autopairs" }
  -- Tabout from pairs
  use { 'abecodes/tabout.nvim' }

  -- Git plugins
  use('tpope/vim-fugitive')
  use { 'lewis6991/gitsigns.nvim' }

  -- Commenting
  use { 'numToStr/Comment.nvim' }

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- Terminal
  use { "akinsho/toggleterm.nvim", tag = '*' }

  -- Buffer tabs
  use {
    'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = {
      'nvim-tree/nvim-web-devicons',
      'moll/vim-bbye'
    }
  }
  use { 'moll/vim-bbye' }

  -- File explorer
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }
  use("nvim-tree/nvim-web-devicons")  -- For icons!

  -- Markdown preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Use by tmux resurrect
  use {
    'tpope/vim-obsession',
    requires = {
      'tpope/vim-repeat'
    }
  }

  -- Highlights other instances of word under your cursor
  use ("RRethy/vim-illuminate")

  -- Prime worktrees!
  use { 'theprimeagen/git-worktree.nvim', }

  -- Notification
  use { 'rcarriga/nvim-notify', }

  -- Quick files management
  use { 'stevearc/oil.nvim', }

end)
