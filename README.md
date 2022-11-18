# Neovim Configuration for C++ and Python

## Installation

Add NeoVim to ppa so that we can install it using apt
```
sudo add-apt-repository ppa:neovim-ppa/stable
```

Install NeoVim
```
sudo apt install neovim -y
```

Update package source after adding ppa
```
sudo apt update -y
```

For accessing the system clipboard
```
sudo apt install xsel -y
```

For C++ auto-formatting
```
sudo apt install clang-format -y
```

Check latest clangd version Typically you will find clangd-10 on Ubuntu 18.04 and clangd-12 on Ubuntu 20.04
```
apt search clangd
```

Install clangd. Change the version number `10` accordingly. 
```
sudo apt install clangd-10 -y
```

Required for building universal-ctags from source
```
sudo apt install automake -y
```

Install curl
```
sudo apt install curl -y
```

Install Python supports
```
sudo apt-get install python3-pip -y
pip3 install --upgrade pip
pip3 install pynvim
pip3 install pygments
pip3 install neovim-remote
pip3 install unidecode
```

Install node and npm without sudo
```
mkdir ~/nodejs
# Press y and add the executables `node` and `npm` to your `~/.bashrc`
export PATH=$PATH:$HOME/nodejs/bin
. ~/.bashrc
curl -sfLS install-node.vercel.app | bash -s -- --prefix=$HOME/nodejs --version=14
npm install neovim yarn
```

Install ctags
```
git clone https://github.com/universal-ctags/ctags.git
cd ctags && ./autogen.sh && ./configure
# Check the number of CPUs on your machine
lscpu | grep "CPU(s)"
make -j 12  # Change 12 to the number of threads on your machine
sudo make install
```

Install vim plug
```
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Copy my vim configuration
```
mkdir -p ~/.config/nvim/plugged/
cd ~/clone/neovim-cpp-python
cp ./init.vim ~/.config/nvim/
```

Find your Python3 and nodejs executables
```
which python3
which node
```

Change the the python3 and node paths accordingly in your `~/.config/nvim/init.vim`.
```
vim ~/.config/nvim/init.vim
let g:python3_host_prog='/usr/bin/python3'
let g:coc_node_path='$HOME/bin/nodejs/node'
```
Install plugins
```
vim
# Press : and then type in
# Install vim plugins
PlugInstall
# Install coc.nvim plugins
CocInstall coc-pyright coc-git coc-cmake coc-json coc-vimtex coc-clangd coc-snippets
```

Configure backward search in Okular

1. "Settings > Editor > Custom Text Editor"
2. `nvr --remote-silent +%l %f`
3. Shift + left click brings the cursor in the editor to the corresponding location
