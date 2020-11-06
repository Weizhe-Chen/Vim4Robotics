# Neovim Configuration for C++ and Python 

1. Install Miniconda

2. `pip install neovim`

3. Install nodejs
```bash
curl -sL install-node.now.sh/lts | sudo bash
```

4. `sudo npm -g install neovim`

5. `sudo snap install ccls --classic`

6. Install vim-plug
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

7. Create `~/.config/nvim/plugged/` folders

8. Copy `init.vim` to `~/.config/nvim/init.vim`

9. Run `:PlugInstall` in vim

10. `:CocInstall coc-python`

11. `:CocConfig`
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

12. `sudo apt install xsel`: copy to system clipboard
