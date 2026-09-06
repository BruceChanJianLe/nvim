# Changelog

Date-based log of notable config changes. No versioning, newest first.

## 2026-09-06 - The big slim-down

Config went from ~54 to ~32 installed plugins (25 to 18 spec files), with no
build steps and no Mason. Full step-by-step history lives in TODOS.md.

### Replaced

- Telescope stack (telescope, fzf-native, telescope-rg, telescope-ui-select,
  telescope-luasnip) with **snacks.picker**. All search keymaps preserved;
  rg args work in the live grep prompt after ` -- ` (see README).
- Completion stack (nvim-cmp, LuaSnip, cmp_luasnip, cmp-buffer, cmp-path,
  cmp-nvim-lua, cmp-nvim-lsp, cmp-nvim-lsp-signature-help) with **blink.cmp**;
  the friendly-snippets fork stays as its snippet source.
- Formatting stack (none-ls, none-ls-extras, mason-null-ls) with **conform.nvim**
  (stylua, ruff, shfmt). The old null-ls setup was silently dead code, so
  external formatters actually work again now.
- Mason (mason, mason-lspconfig, mason-tool-installer) with native
  `vim.lsp.config()` / `vim.lsp.enable()`. All server and formatter binaries
  are system-installed (mostly nix); see LSP_SETUP.md.
- neo-tree (+ nui as its dep) with **Snacks.explorer** sidebar on `<C-b>` /
  `<leader>pv`, hidden files always shown.
- toggleterm with **Snacks.terminal** (bottom split, 15 rows, `<M-C-Space>` /
  `<leader>tt`).
- vim-bbye with **Snacks.bufdelete** (bufferline close, `<leader>c` / `<leader>C`).
- nvim-notify with **snacks.notifier** (`<leader><leader>c` clears).
- Comment.nvim with built-in `gc` commenting; Ctrl-/ keymaps preserved
  (insert-mode Ctrl-/ was broken before and works now).
- vim-illuminate with the LSP document-highlight already configured in lsp.lua
  (LspReference* linked to IncSearch for visibility).

### Added

- Slim mode: `NVIM_SLIM=1 nvim` (alias `nvs`) skips all plugins; options,
  keymaps, and built-in syntax highlighting only. ~8ms vs ~50ms startup.
- Snippet browser on `<leader>sn`: snacks picker over blink's snippet registry
  with body preview and variable-resolving expansion.
- `<leader>sm`: picker over git modified files (git_status).
- Snacks image (inline images via kitty graphics protocol, works in ghostty),
  replacing the never-installed image.nvim idea without luarocks/imagemagick.
- Snacks indent scope highlight (current cursor scope only, no rainbow guides).
- `.stylua.toml` (2-space indent) so stylua matches the repo style.
- LSP_SETUP.md: how servers/formatters are installed and wired, plus exercises.

### Changed

- Search keymaps consolidated on the `s*` prefix; removed duplicate
  pf/pg/ps/pws/pWs/fg/fs; cWORD grep is `<leader>sW`.
- Toggle group completed under `<leader>t*`: tn numbers, ti invisibles, tw wrap,
  tp paste (moved from `<leader><leader>p`), tt terminal, tc ts-context,
  th inlay hints, ts C++ src/header.
- clangd runs with `--header-insertion=never`: includes are added only via
  explicit code action, never on completion accept.
- `gd` (and all picker jumps) land centered - came free with snacks.
- Completion suggests immediately after trigger chars (`vim.`, `/`) and on
  `<C-Space>`; the 4-char minimum now applies only to plain word typing.
- listchars config moved from the dead indent_blankline file into set.lua;
  `<leader>ti` toggle into remap.lua.
- vim-repeat re-attributed as vim-surround's dependency (dot-repeat), not
  vim-obsession's; plenary/nui declared by their real consumers
  (harpoon, leetcode).
- Fixed deprecated `client.supports_method` dot-calls in lsp.lua.

### Removed (dead files, plugin was never active)

- tabout.lua, image.lua, indent_blankline.lua (all fully commented out).
- git-worktree.nvim (unmaintained, telescope-dependent).
- treesitter-context was briefly removed and deliberately restored: KEEP.

### Kept on purpose

bufferline (VSCode tabs), cloak (masks key files), vim-obsession
(tmux-resurrect strategy), markdown-preview, harpoon, fugitive, oil.lua
(commented out, to try someday).
