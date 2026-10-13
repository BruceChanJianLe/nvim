local leet_arg = "leetcode.nvim"
return {
  {
    -- Fork of kawre/leetcode.nvim with the LintCode premium fallback.
    "BruceChanJianLe/leetcode.nvim",
    lazy = leet_arg ~= vim.fn.argv()[1],
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = { arg = leet_arg, lintcode = { enabled = true } },
  }
}
