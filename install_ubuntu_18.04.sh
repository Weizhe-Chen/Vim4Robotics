#!/bin/bash
echo -e "\e[32m===========================================================\e[0m"
echo -e "\e[32m[Install Neovim and ctags]\e[0m"
echo -e "\e[32m===========================================================\e[0m"
sudo snap install nvim universal-ctags --classic

echo -e "\e[32m===========================================================\e[0m"
echo -e "\e[32m[Install APT dependencies]\e[0m"
echo -e "\e[32m===========================================================\e[0m"
sudo apt install xsel clang-format curl automake python3-pip -y

echo -e "\e[32m===========================================================\e[0m"
echo -e "\e[32m[Install Python dependencies]\e[0m"
echo -e "\e[32m===========================================================\e[0m"
pip3 install --upgrade pip
pip3 install pynvim pygments neovim-remote unidecode

echo -e "\e[32m===========================================================\e[0m"
echo -e "\e[32m[Install NodeJS dependencies]\e[0m"
echo -e "\e[32m===========================================================\e[0m"
mkdir ~/Neovim && cd ~/Neovim
curl -sfLS install-node.vercel.app | bash -s -- --prefix=$HOME/Neovim --version=16
echo 'export PATH=$PATH:$HOME/Neovim/bin' >> ~/.bashrc
source ~/.bashrc
npm install -g npm neovim yarn


echo -e "\e[32m===========================================================\e[0m"
echo -e "\e[32m[Install vim-plug and coc-vim]\e[0m"
echo -e "\e[32m===========================================================\e[0m"
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim/plugged/
cd ~/.config/nvim/
wget https://raw.githubusercontent.com/Weizhe-Chen/Vim4Robotics/main/init.vim
echo "let g:python3_host_prog='$(which python3)'" >> ~/.config/nvim/init.vim
echo "let g:coc_node_path='$(which node)'" >> ~/.config/nvim/init.vim
nvim +'PlugInstall --sync' +qa
nvim +'CocInstall -sync coc-json' +qall
nvim +CocUpdateSync +qall