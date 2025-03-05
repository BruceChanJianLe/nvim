-- Take from:
-- https://github.com/jmbuhr/quarto-nvim-kickstarter/blob/c23d86a5686bc846ea5c6a1a09542bb97abfed14/lua/plugins/ui.lua#L349

-- show images in nvim!
return {
  {
    '3rd/image.nvim',
    enabled = true,
    dev = false,
    ft = { 'markdown', 'vimwiki', 'txt', 'quarto' },
    cond = function()
      -- Disable on Windows system
      return vim.fn.has 'win32' ~= 1
    end,
    dependencies = {
      'leafo/magick',  -- that's a lua rock
    },
    config = function()
      -- Requirements
      -- sudo apt install imagemagick luarocks

      local image = require 'image'
      image.setup {
        backend = 'kitty',
        processor = "magick_cli", -- or "magick_rock"
        integrations = {
          markdown = {
            enabled = true,
            only_render_image_at_cursor = true,
            -- only_render_image_at_cursor_mode = "popup",
            filetypes = { 'markdown', 'vimwiki', 'txt', 'quarto' },
          },
        },
        editor_only_render_when_focused = true,
        window_overlap_clear_enabled = true,
        tmux_show_only_in_active_window = true,
        window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', 'scrollview', 'scrollview_sign' },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,
        max_height_window_percentage = 80,
        kitty_method = 'normal',
      }
    end,
  },
}
