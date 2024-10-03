# NeoVim

A nvim config that aims to be as easy to use as vscode.

## Plugin Manager

For neovim version 0.10 and above (gotta install from source) use [Lazy](https://github.com/folke/lazy.nvim?tab=readme-ov-file) to manage plugins.

## Other Deps
For telescope to work please install [`ripgrep`](https://github.com/BurntSushi/ripgrep/releases) and [`fd`](https://github.com/sharkdp/fd/releases). May need to alias fdfind -> fd on Ubuntu.

## TODOs
- Fix telescope fzf native (from time to time this will happen) cd `$HOME/.local/share/nvim/lazy/telescope-fzf-native.nvim` and cmake it!
  Missing libfzf.so but strictly speaking lazy should be able to handle it.
- re-org the keybindings, T - toggle group, e.g. toggle term, toggle renu, toggle tressitter context, etc.
- swtich header and source (c++)
- quick jump to next and previous if else statements
- open buffer to selected window from neotree
- show function signature (c++)
- do not add header by default, must trigger lsp action
- center cursor when `gd` going to definition

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
