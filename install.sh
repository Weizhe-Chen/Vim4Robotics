#!/bin/bash
echo -e "\e[32m===========================================================\e[0m"
echo -e "\e[32m[Add NeoVim to apt repository]\e[0m"
echo -e "\e[32m===========================================================\e[0m"
yes "" | sudo add-apt-repository ppa:neovim-ppa/stable

echo -e "\e[32m===========================================================\e[0m"
echo -e "\e[32m[Install NeoVim]\e[0m"
echo -e "\e[32m===========================================================\e[0m"
sudo apt install neovim -y

echo -e "\e[32m===========================================================\e[0m"
echo -e "\e[32m[Install xsel for accessing the system clipboard in vim]\e[0m"
echo -e "\e[32m===========================================================\e[0m"
sudo apt install xsel -y

echo -e "\e[32m===========================================================\e[0m"
echo -e "\e[32m[Install clang-format for C++ auto-formatting]\e[0m"
echo -e "\e[32m===========================================================\e[0m"
sudo apt install clang-format -y

echo -e "\e[32m===========================================================\e[0m"
echo -e "\e[32m[Install clangd language server (completion, jump to def, etc) for C++]\e[0m"
echo -e "\e[32m===========================================================\e[0m"
sudo apt install clangd-10 -y

echo -e "\e[32m===========================================================\e[0m"
echo -e "\e[32m[Append ~/.local/bin to PATH]\e[0m"
echo -e "\e[32m===========================================================\e[0m"
echo 'PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc

echo -e "\e[32m===========================================================\e[0m"
echo -e "\e[32m[Install Python3 and corresponding packages for NeoVim]\e[0m"
echo -e "\e[32m===========================================================\e[0m"
sudo apt-get install python3-pip -y
pip3 install --upgrade pip
pip3 install pynvim
pip3 install pygments
pip3 install neovim-remote
pip3 install unidecode

echo -e "\e[32m===========================================================\e[0m"
echo -e "\e[32m[Install nodejs]\e[0m"
echo -e "\e[32m===========================================================\e[0m"
mkdir ~/nodejs
sudo apt install curl -y
echo 'PATH=$PATH:$HOME/nodejs/bin' >> ~/.bashrc
source ~/.bashrc
curl -sfLS install-node.vercel.app | bash -s -- --prefix=$HOME/nodejs --version=14
npm install neovim yarn

echo -e "\e[32m===========================================================\e[0m"
echo -e "\e[32m[Install ctags]\e[0m"
echo -e "\e[32m===========================================================\e[0m"
sudo apt install automake -y
git clone https://github.com/universal-ctags/ctags.git
cd ctags && ./autogen.sh && ./configure
make -j
sudo make install

echo -e "\e[32m===========================================================\e[0m"
echo -e "\e[32m[Install vim-plug]\e[0m"
echo -e "\e[32m===========================================================\e[0m"
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo -e "\e[32m===========================================================\e[0m"
echo -e "\e[32m[Copy vim config file to ~/.config/nvim]\e[0m"
echo -e "\e[32m===========================================================\e[0m"
mkdir -p ~/.config/nvim/plugged/
cd ..
cp ./init.vim ~/.config/nvim/

echo -e "\e[32m===========================================================\e[0m"
echo -e "\e[32m[Install Okular]\e[0m"
echo -e "\e[32m===========================================================\e[0m"
sudo apt install okular -y

echo -e "\e[32m===========================================================\e[0m"
echo -e "\e[32m[Complete!!!]\e[0m"
echo -e "\e[32m===========================================================\e[0m"
exit 0

