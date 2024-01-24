vim.keymap.set("n", "<leader>v", "<cmd>MarkdownPreviewToggle<CR>");

-- Ref: https://github.com/iamcco/markdown-preview.nvim/issues/262
vim.cmd(
[[
  function OpenMarkdownPreview (url)
    execute "silent ! google-chrome --incognito --app=" . a:url
  endfunction
]]
)

vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
