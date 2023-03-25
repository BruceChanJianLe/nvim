-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { 'nvim-lua/plenary.nvim',
                 {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
      }
  }

  -- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }


  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use{'mbbill/undotree', config = [[ vim.g.undotree_SetFocusWhenToggle = 1 ]] }
  use('tpope/vim-fugitive')
  use('tpope/vim-surround')
  -- color setup
  use('RRethy/nvim-base16')

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},         -- Using words buffers
		  {'hrsh7th/cmp-path'},           -- Using file(name)s
		  {'hrsh7th/cmp-nvim-lua'},       -- For when writing lua in nvim
		  {'hrsh7th/cmp-nvim-lsp'},       -- LSP support and moving snippets
		  {'saadparwaiz1/cmp_luasnip'},   -- For lua snippets

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  -- Snippet Collection (Optional)
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  -- Git plugins
  use('tpope/vim-fugitive')
  use {'lewis6991/gitsigns.nvim'}

end)
