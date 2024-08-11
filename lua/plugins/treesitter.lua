return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      -- A list of parser names, or "all"
      ensure_installed = { 'cpp', 'lua', 'rust', 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },

      -- Autoinstall languages that are not installed
      auto_install = true,

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },

      -- Function / Class highlights
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'vs',
          node_incremental = 'vs',
          -- scope_incremental = '<c-s>',
          node_decremental = 'vd',
        },
      },

      -- Functions / Classes jump
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end
  },
  { 'nvim-treesitter/playground' },
  -- Show func signature when scrolling
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {},
    config = function()
      vim.api.nvim_set_hl(0, "TreesitterContext", { link = "MatchParen" })
      vim.keymap.set({ "n", "v" }, "<leader>tc", "<cmd> TSContextToggle<CR>", { desc = "[T]oggle Treesitter [C]ontext" })
    end
  },
}
