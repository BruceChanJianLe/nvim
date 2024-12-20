return {
  "brucechanjianle/multiple-cursors.nvim",
  version = "*", -- Use the latest tagged version
  -- This causes the plugin setup function to be called
  opts = {

    pre_hook = function()
      require('nvim-autopairs').disable()
      require("cmp").setup({ enabled = false })
    end,
    post_hook = function()
      require('nvim-autopairs').enable()
      require("cmp").setup({ enabled = true })
    end,
  },
  keys = {
    { "<M-NL>",        "<Cmd>MultipleCursorsAddDown<CR>",        mode = { "n", "i", "x" }, desc = "Add cursor and move down" },
    { "<M-C-K>",       "<Cmd>MultipleCursorsAddUp<CR>",          mode = { "n", "i", "x" }, desc = "Add cursor and move up" },

    { "<M-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" },      desc = "Add or remove cursor" },

    -- { "<Leader>a",     "<Cmd>MultipleCursorsAddMatches<CR>",       mode = { "n", "x" },      desc = "Add cursors to cword" },
    -- { "<Leader>A",     "<Cmd>MultipleCursorsAddMatchesV<CR>",      mode = { "n", "x" },      desc = "Add cursors to cword in previous area" },
    --
    { "<M-C-N>",     "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = { "n", "x" },      desc = "Add cursor and jump to next cword" },
    { "<M-C-P>",     "<Cmd>MultipleCursorsJumpNextMatch<CR>",    mode = { "n", "x" },      desc = "Jump to next cword" },
    --
    -- { "<Leader>l",     "<Cmd>MultipleCursorsLock<CR>",             mode = { "n", "x" },      desc = "Lock virtual cursors" },
  },
}
