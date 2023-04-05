vim.opt.list = true
vim.opt.listchars:append "space:·"
vim.opt.listchars:append "eol:¶"
vim.opt.listchars:append "trail:·"
vim.opt.listchars:append "tab:→ "

require("indent_blankline").setup {
  opts = {
    char = '▎',
    show_trailing_blankline_indent = false,
    show_end_of_line = true,
    space_char_blankline = " ",
  },
}
