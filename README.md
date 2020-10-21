# Neovim Configuration for C++ and Python 
1. Install NeoVim
  * Download nvim.appimage from https://github.com/neovim/neovim/releases/nightly
  * Run `chmod u+x nvim.appimage`
  * Move the application image file to `/usr/local/bin` and change its name to `vim`
  * `sudo apt install xsel`: copy to system clipboard

2. Install vim-plug
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
3. Install coc.nvim
* Create file `~/.config/nvim/init.vim` and folder `~/.config/nvim/plugged/`
* Paste `init.vim`
* Restart vim and type in `:PlugInstall`

4. Install ccls according to https://github.com/MaskRay/ccls/wiki/Build

5. `:CocInstall` `coc-snippets` and `coc-python`
