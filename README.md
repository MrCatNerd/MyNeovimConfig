# Nvim
My neovim config

Loads in ~22ms.
Should work on windows with a little bit of configuration cuz treesitter stuff.

---

## Prerequisites:

- [neovim](https://neovim.io)
- [git](https://git-scm.com)
- [Nerd Font](https://www.nerdfonts.com)

### Telescope.nvim

- [fzf](https://github.com/junegunn/fzf)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [CMake](https://cmake.org/) / [Make](https://github.com/mirror/make)

## Installing

```sh
git clone "https://github.com/MrCatNerd/MyNeovimConfig.git" "$HOME/.config/nvim" # Linux
# git clone "https://github.com/MrCatNerd/MyNeovimConfig.git" $LOCALAPPDATA/nvim" # Windows

nvim --headless "+Lazy! sync" "+Lazy! build all" +qa
```

To install all the LSP servers, run:

```sh
nvim --headless "+MasonInstallAll" +qa
```

---

## TODO:

- DAP
- add sql support
