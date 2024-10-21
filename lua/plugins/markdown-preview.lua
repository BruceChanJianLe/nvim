-- Markdown preview
return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function() vim.fn["mkdp#util#install"]() end,
  config = function()
    vim.keymap.set("n", "<leader>v", "<cmd>MarkdownPreviewToggle<CR>");

    vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
    -- Ref: https://github.com/iamcco/markdown-preview.nvim/issues/262
    vim.cmd(
      [[
    function OpenMarkdownPreview (url)
      " execute "silent ! brave-browser --incognito --app=" . a:url
      execute "silent ! google-chrome --incognito --app=" . a:url
      endfunction
    ]]
    )
  end
}
