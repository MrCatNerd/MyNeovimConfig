# NvCat
My neovim config

Loads in ~22ms (i3 9100)

<img src="stuff/screenshot.png" alt="NvCat screenshot">

---

## Prerequisites:

- [neovim](https://neovim.io)
- [git](https://git-scm.com)
- [Nerd Font](https://www.nerdfonts.com)

### Telescope.nvim

- [fzf](https://github.com/junegunn/fzf)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [Make](https://savannah.gnu.org/projects/make/)

### Treesitter
A `C` compiler e.g. [GCC](https://gcc.gnu.org/) | [ZIG](https://ziglang.org/) works too

**you might need misc dependencies for your LSP servers**

## Installing

```sh
git clone "https://github.com/MrCatNerd/MyNeovimConfig.git" "$HOME/.config/nvim" # Linux
#git clone "https://github.com/MrCatNerd/MyNeovimConfig.git" "$LOCALAPPDATA/nvim" # Windows

nvim --headless "+Lazy! sync" "+Lazy! build all" +qa
```

To install all of the LSP servers, run:

```sh
nvim --headless "+MasonInstallAll" +qa
```

### clang format
if you want my clang format config, fetch this file to your ~ or project dir
- home dir = global (local will override)
- project dir = local ^
```sh
curl --silent "https://raw.githubusercontent.com/MrCatNerd/.dotfiles/refs/heads/main/linux/clangd/.clang-format" -o .clang-format
```

---

## TODO:

- complete DAP
