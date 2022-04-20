# Neovim Configuration for C++ and Python

## Installation

```bash
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update -y
sudo apt-get install xsel -y  # For accessing the system clipboard
sudo apt-get install clang-format -y  # For C++ auto-formatting
apt search clangd  # Check latest clangd version
sudo apt-get install clangd-10 -y  # C++ language server. Might be clangd-12 on Ubuntu 20.04
sudo apt-get install automake -y  # Required for building universal-ctags from source
sudo apt-get install neovim -y
sudo apt-get install curl -y
curl -sL install-node.now.sh/lts | sudo bash
sudo npm -g install neovim yarn

# Ctags
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure
make -j12
sudo make install

# Install mambaforge from https://github.com/conda-forge/miniforge
pip install neovim neovim-remote unidecode

# Vim Plug
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Configuration
mkdir -p ~/.config/nvim/plugged/
cd ~/clone/neovim-cpp-python
cp ./init.vim ~/.config/nvim/

# Install plugins
vim +'PlugInstall'
vim +'CocInstall -sync coc-pyright coc-git coc-cmake coc-json coc-vimtex coc-clangd coc-snippets'
```

## Backward search in Okular

1. "Settings > Editor > Custom Text Editor"
2. `nvr --remote-silent +%l %f`
3. Shift + left click brings the cursor in the editor to the corresponding location
