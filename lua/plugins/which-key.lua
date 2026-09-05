return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    opts = {},
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function(opts) -- This is the function that runs, AFTER loading
      require("which-key.plugins.presets").operators["v"] = nil
      require("which-key").setup(opts)

      -- Document existing key chains
      require('which-key').add {
        { '<leader>c', group = '[C]ode' },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch/[S]et' },
        -- [T]oggle group: tn numbers, ti invisibles, tw wrap, tp paste,
        -- tt terminal, tc ts-context, th inlay hints, ts C++ src/header
        { '<leader>t', group = '[T]oggle' },
        { '<leader>p', group = '[P]roject' },
        -- { '<leader>w', group = '[W]orkspace' },
        -- { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      }
    end,
  },
}
