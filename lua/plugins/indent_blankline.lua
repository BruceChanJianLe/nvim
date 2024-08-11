return {
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {},
    config = function()
      vim.opt.list = true
      vim.opt.listchars:append "space:·"
      vim.opt.listchars:append "eol:¶"
      vim.opt.listchars:append "trail:·"
      vim.opt.listchars:append "tab:→ "
    end
  }
}
