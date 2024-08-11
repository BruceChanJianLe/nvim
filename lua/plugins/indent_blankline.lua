vim.opt.list = true
vim.opt.listchars:append "space:·"
vim.opt.listchars:append "eol:¶"
vim.opt.listchars:append "trail:·"
vim.opt.listchars:append "tab:→ "
return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  }
}
