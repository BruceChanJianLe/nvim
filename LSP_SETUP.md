# LSP Setup

This config uses Neovim 0.11+ native LSP management.

## How it works (the whole mental model)

Three layers, all visible in `lua/plugins/lsp.lua`:

1. **The binary.** A language server is just a program on your `$PATH`
   (e.g. `/usr/bin/clangd`). If `command -v <binary>` works in your shell,
   nvim can use it.

2. **The config.** `vim.lsp.config(name, overrides)` registers how to run a
   server: its `cmd`, which `filetypes` trigger it, how to find the project
   root, and `settings` passed to the server. The `nvim-lspconfig` plugin is
   nothing magical anymore - it is a big folder of ready-made configs (one
   file per server in its `lsp/` directory), so for known servers you only
   supply overrides. Run `:help lspconfig-all` for the list of server names.

3. **The switch.** `vim.lsp.enable(name)` turns the server on: nvim starts it
   automatically whenever you open a matching filetype. If the binary is
   missing, nvim silently skips it - no error, the server just never attaches.

Everything else (keymaps on attach, completion capabilities via blink.cmp)
is wired once in `lsp.lua` and applies to every server.

## Adding a new language server

Example: rust.

1. **Install the binary** (system package manager, not nvim):

   ```bash
   rustup component add rust-analyzer   # rust's own toolchain manager
   # or: apt / brew / nix / GitHub releases, depending on the server
   ```

2. **Add it to the `servers` table** in `lua/plugins/lsp.lua`:

   ```lua
   local servers = {
     rust_analyzer = {},   -- empty {} = use nvim-lspconfig defaults
     ...
   }
   ```

   The key must be the nvim-lspconfig name (`rust_analyzer`, not
   `rust-analyzer`). The loop below the table calls `vim.lsp.config()` +
   `vim.lsp.enable()` for every entry, so there is no step 3.

3. Restart nvim, open a `.rs` file. Done.

To pass server-specific settings, use a `settings` table instead of `{}` -
see the `pylsp` and `lua_ls` entries for real examples.

For a server nvim-lspconfig does not know, define it from scratch:

```lua
vim.lsp.config('myserver', {
  cmd = { 'my-language-server', '--stdio' },
  filetypes = { 'mylang' },
  root_markers = { '.git', 'myproject.toml' },
})
vim.lsp.enable('myserver')
```

## Adding a formatter

Formatters follow the same rule: binary on `$PATH`, config in
`lua/plugins/conform.lua`. Install the tool, then map it:

```lua
formatters_by_ft = {
  rust = { 'rustfmt' },
  ...
}
```

`<leader>f` runs the filetype's formatter, falling back to LSP formatting
when none is configured.

## Checking what's going on

- `:checkhealth vim.lsp` - active clients, and why a server did or didn't start
- `:checkhealth lspconfig` - what nvim-lspconfig detects
- `command -v <binary>` in the shell - is the binary actually on PATH
- Remember: a missing binary fails *silently*. "No completions in X files"
  almost always means the server binary is not installed on this machine.
