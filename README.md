# Neovim Configuration for C++ and Python

1. Install neovim appimage (apt installs an old version of neovim)
   1. https://github.com/neovim/neovim/releases
   2. Click `Assets` and download `nvim.appimage`
   3. Make it executable: `chmod u+x nvim.appimage`
   4. Move it to `/usr/local/bin/` and rename it: `sudo mv nvim.appimage /usr/bin/vim`
2. `pip install neovim`
3. Install nodejs
```bash
# We might need to install curl first
curl -sL install-node.now.sh/lts | sudo bash
```

4. `sudo npm -g install neovim`

5. `sudo snap install ccls --classic`

6. Install vim-plug
```bash
# https://github.com/junegunn/vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

7. Create folders: `mkdir -p ~/.config/nvim/plugged/`

8. Copy `init.vim` to `~/.config/nvim/init.vim`:
```bash
cd ~/clone/neovim-cpp-python
cp ./init.vim ~/.config/nvim/
```

9. Run `:PlugInstall` in vim

10. `:CocInstall coc-python coc-git coc-cmake coc-json coc-vimtex`

11. `sudo apt install xsel clang-format`

12. `:CocConfig`
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
  },
  "python.jediEnabled": false
}
```

13. Backward search in Okular
    1. "Settings > Editor > Custom Text Editor"
    2. `nvr --remote-silent +%l %f`
    3. Might need to install `pip install neovim-remote`
    4. Shift + left click brings the cursor in the editor to the corresponding location

14. Fix Ultisnips expand error: `pip install unidecode`
