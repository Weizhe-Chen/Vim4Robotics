#!/bin/bash

start=$(date +%s)

echo -e "\e[32m[Install Neovim and ctags]\e[0m"
sudo snap install nvim --classic
sudo snap install universal-ctags

echo -e "\e[32m[Install APT dependencies]\e[0m"
sudo apt install xsel clang-format curl automake python3-pip -y

echo -e "\e[32m[Install Python dependencies]\e[0m"
pip3 install --upgrade pip
pip3 install pynvim pygments neovim-remote unidecode

echo -e "\e[32m[Install NodeJS dependencies]\e[0m"
mkdir -p ~/Neovim/bin && cd ~/Neovim
export PATH=$PATH:$HOME/Neovim/bin
echo "export PATH=$PATH:$HOME/Neovim/bin" >> ~/.bashrc
echo "alias vim='nvim'" >> ~/.bashrc
curl -sfLS install-node.vercel.app | bash -s -- --prefix=$HOME/Neovim --version=16 -y
./bin/npm install -g npm neovim yarn

echo -e "\e[32m[Install vim-plug]\e[0m"
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim/plugged/
cd ~/.config/nvim/
wget https://raw.githubusercontent.com/Weizhe-Chen/Vim4Robotics/main/init.vim
nvim --headless +'PlugInstall --sync' +qall

echo -e "\e[32m[Install coc-vim]\e[0m"
nvim --headless +'CocInstall -sync coc-pyright coc-git coc-cmake coc-json coc-vimtex coc-clangd coc-snippets' +qall
nvim --headless +CocUpdateSync +qall

echo -e "\e[32m[Append vim configuration to init.vim]\e[0m"
wget https://raw.githubusercontent.com/Weizhe-Chen/Vim4Robotics/main/conf.vim -O ->> ~/.config/nvim/init.vim
echo "let g:python3_host_prog='$(which python3)'" >> ~/.config/nvim/init.vim
echo "let g:coc_node_path='$(which node)'" >> ~/.config/nvim/init.vim

end=$(date +%s)
echo -e "\e[32m[Installation Time: $(($end-$start)) seconds]\e[0m"

echo -e "\e[33m[You should see green OKs in the following pop-up window!]\e[0m"
read -e "\e[33m[Exit Neovim with :q]\e[0m"
read -p -e "\e[33m[Press [Enter] to continue]\e[0m"

nvim +':checkhealth'
