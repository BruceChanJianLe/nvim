-- Still learning how to use the harpoon way
return {
  {
    'theprimeagen/harpoon',
    opts = {},
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<M-C-A>", function()
        local buf_id = vim.api.nvim_get_current_buf();
        local buf_filename = vim.api.nvim_buf_get_name(buf_id)
        mark.add_file()
        print("Add " .. buf_filename .. " to harpoon list!")
      end, { desc = "Add File to harpoon list" })
      vim.keymap.set("n", "<M-C-E>", ui.toggle_quick_menu, { desc = "Show current harpoon list" })

      vim.keymap.set("n", "<M-C-H>", function() ui.nav_file(1) end)
      vim.keymap.set("n", "<M-NL>", function() ui.nav_file(2) end)
      vim.keymap.set("n", "<M-C-K>", function() ui.nav_file(3) end)
      vim.keymap.set("n", "<M-C-L>", function() ui.nav_file(4) end)
      -- vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end)
      -- vim.keymap.set("n", "<leader>6", function() ui.nav_file(6) end)
    end
  },
}
