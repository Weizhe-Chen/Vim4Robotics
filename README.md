# Neovim Configuration for C++ and Python

1. ```bash
   curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
   chmod u+x nvim.appimage
   sudo mv nvim.appimage /bin/vim
   
   sudo apt install xsel clang-format ctags
   
   sudo apt-get install python-pip
   sudo apt-get install python3-pip
   pip install --upgrade pip
   pip3 install --upgrade pip
   pip install neovim unidecode
   pip3 install neovim unidecode
   
   # We might need to install curl first
   curl -sL install-node.now.sh/lts | sudo bash
   sudo npm -g install neovim
   
   sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
          
   mkdir -p ~/.config/nvim/plugged/
   cd ~/clone/neovim-cpp-python
   cp ./init.vim ~/.config/nvim/
   
   vim +PlugInstall
   
   CocInstall coc-pyright coc-git coc-cmake coc-json coc-vimtex coc-clangd
   CocCommand clangd.install
   # Add the following line to ~/.bashrc
   export PATH=$PATH:/home/chenweiz/.config/coc/extensions/coc-clangd-data/install/12.0.1/clangd_12.0.1/bin
   ```

2. Backward search in Okular

   1. "Settings > Editor > Custom Text Editor"
   2. `nvr --remote-silent +%l %f`
   3. Might need to install `pip install neovim-remote`
   4. Shift + left click brings the cursor in the editor to the corresponding location
   5. Fix Ultisnips expand error: `pip install unidecode`
