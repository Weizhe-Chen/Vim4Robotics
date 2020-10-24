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

3. Create `~/.config/nvim/plugged/` folders

4. Copy `init.vim` to `~/.config/nvim/init.vim`

5. Run `:PlugInstall` in vim

6. Install nodejs
```bash
curl -sL install-node.now.sh/lts | sudo bash
```

7. Install Miniconda

8. `pip install neovim`

9. `sudo npm -g install neovim`

10. Install ccls according to https://github.com/MaskRay/ccls/wiki/Build

11. `sudo apt install cmake`

12. Build ccls
```bash
sudo apt install zlib1g-dev libncurses-dev
git clone --depth=1 --recursive https://github.com/MaskRay/ccls
cd ccls
wget -c http://releases.llvm.org/8.0.0/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
tar -vxf clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=$PWD/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04
cmake --build Release
cd Release
sudo mv ./ccls /usr/local/bin/
ccls --version
```

13. `:CocInstall coc-snippets`

14. `:CocInstall coc-json`

15. `:CocConfig`
```
{
  "languageserver": {
    "ccls": {
      "command": "ccls",
      "filetypes": ["c", "cpp", "cuda", "objc", "objcpp"],
      "rootPatterns": [".ccls-root", "compile_commands.json"],
      "initializationOptions": {
        "cache": {
          "directory": ".ccls-cache"
        },
        "client": {
          "snippetSupport": true
        }
      }
    }
  }
}
```
