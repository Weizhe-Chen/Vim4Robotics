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
curl -sfLS install-node.vercel.app | bash -s -- --prefix=$HOME
# Add the following line to your ~/.bashrc
export PATH=$PATH:$HOME/bin
sudo npm -g install neovim yarn

# Ctags
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure
make -j12
sudo make install

pip install neovim neovim-remote unidecode pynvim

# Vim Plug
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Configuration
mkdir -p ~/.config/nvim/plugged/
cd ~/clone/neovim-cpp-python
cp ./init.vim ~/.config/nvim/
```

Change the following path accordingly in your `~/.config/nvim/init.vim`.

```
let g:python3_host_prog='/usr/bin/python3'
let g:coc_node_path='$HOME/bin/node'
```
Open `vim` and install the plugins.

```
# In Vim
:PlugInstall
:CocInstall coc-pyright coc-git coc-cmake coc-json coc-vimtex coc-clangd coc-snippets
```

## Backward search in Okular

1. "Settings > Editor > Custom Text Editor"
2. `nvr --remote-silent +%l %f`
3. Shift + left click brings the cursor in the editor to the corresponding location
