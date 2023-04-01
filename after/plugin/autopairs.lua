-- Setup nvim-cmp.
local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

local status_ok2, Rule = pcall(require, 'nvim-autopairs.rule')
if not status_ok2 then
  return
end

npairs.setup {
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = false,
  },
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
  disable_in_macro = false,  -- disable when recording or executing a macro
  disable_in_visualblock = false, -- disable when insert after visual block mode
  disable_in_replace_mode = true,
  -- Don't use fast wrap
  -- fast_wrap = {
  --   map = "<M-e>",
  --   chars = { "{", "[", "(", '"', "'" },
  --   pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
  --   offset = 0, -- Offset from pattern match
  --   end_key = "$",
  --   keys = "qwertyuiopzxcvbnmasdfghjkl",
  --   check_comma = true,
  --   highlight = "PmenuSel",
  --   highlight_grey = "LineNr",
  -- },
}

-- Add angle bracket rule
npairs.add_rule(Rule("<", ">"))

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

