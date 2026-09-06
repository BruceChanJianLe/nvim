A nvim config that aims to be as easy to use as vscode.  
> Oh well! Maybe there will still be a learning curve.  


## LSP Support

Language servers are managed natively (`vim.lsp.config()` / `vim.lsp.enable()`,
no Mason): nvim runs whatever binary is on `$PATH`. See [LSP_SETUP.md](LSP_SETUP.md)
for the mental model and how to add a new server.

Server | Language | Typical install
--- | --- | ---
clangd | C/C++ | apt
pylsp | Python | apt
cmake-language-server | CMake | nix or pip
lua-language-server | Lua | nix (not in apt)

## Dependencies

```bash
sudo apt-get install python3-venv clangd
# Python lsp (its lint/format plugins are disabled in lsp.lua; ruff formats instead)
sudo apt install python3-pylsp
```

Formatters used by conform.nvim (`<leader>f`): `stylua`, `ruff`, `shfmt` -
install via nix, cargo, pipx, or apt (see [LSP_SETUP.md](LSP_SETUP.md)).

For the snacks picker to work please install [`ripgrep`](https://github.com/BurntSushi/ripgrep/releases) and [`fd`](https://github.com/sharkdp/fd/releases). May need to alias fdfind -> fd on Ubuntu.

## Live Grep

`<leader>sl` opens live grep (snacks picker on top of ripgrep): every keystroke
re-runs `rg` across the project, so results update as you type.

The prompt also accepts raw ripgrep arguments after a ` -- ` separator:

```
pattern -- <rg args>
```

Examples:

| Prompt | Meaning |
| --- | --- |
| `TODO` | plain search for TODO |
| `TODO -- -g=*.lua` | only in lua files |
| `def -- -t py -i` | python files, case-insensitive |
| `foo -- -g='!test/**'` | exclude the test directory (quotes work) |

Related keymaps: `<leader>sp` greps for a prompted string, `<leader>sw` / `<leader>sW`
grep the word / WORD under the cursor, and `<C-f>` fuzzy-searches lines in the
current buffer only.

## Notes

Incrementing all occurrences of a line, for example, 'apple 1' in a file. TL;DR.
```bash
# Firstly, yank 0 into your registery
:g/apple/norm! f1vp^Ayiw
```

## Error

Recently, there is an error when using lsp for cmake, the fix is as below:  
```bash
cd ~/.local/share/nvim/mason/packages/cmake-language-server
source venv/bin/activate
pip install "pygls<2.0" --upgrade
deactivate
```

## Reference
- [learning_video1](https://www.youtube.com/watch?v=gnupOrSEikQ)
- [learning_video2](https://www.youtube.com/watch?v=65Wq4fjREUU)
- [lua_nvim](https://www.youtube.com/watch?v=IP3J56sKtn0)
- [new_learning_video](https://www.youtube.com/watch?v=434tljD-5C8) [https://github.com/jessarcher/dotfiles]
- [vscode-ish setup](https://www.youtube.com/watch?v=GcoHnB5DoFA)
- [highlight group](https://www.youtube.com/watch?v=iHYeCLOOO_k&ab_channel=YukiUthman)

Github
- [current_ref_nvim_config](https://github.com/ChristianChiarulli/nvim/)
- [lunarvim](https://github.com/LunarVim/LunarVim)
- [vscodevim](https://github.com/josethz00/neovim-like-vscode)
- [someref](https://gist.github.com/benawad/b768f5a5bbd92c8baabd363b7e79786f)
- [luaref](https://github.com/mizlan/dots-nightly/tree/lua-port)
