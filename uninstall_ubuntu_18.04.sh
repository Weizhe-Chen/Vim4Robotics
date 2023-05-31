#!/bin/bash
echo -e "\e[32m[Remove Neovim]\e[0m"
sudo snap remove nvim

echo -e "\e[32m[Remove Ctags]\e[0m"
sudo snap remove universal-ctags

echo -e "\e[32m[Install Python dependencies]\e[0m"
pip3 uninstall pynvim neovim-remote unidecode -y

echo -e "\e[32m[Remove APT dependencies]\e[0m"
sudo apt install xsel clang-format automake -y
sudo apt autoremove -y

echo -e "\e[32m[Remove NodeJS dependencies]\e[0m"
rm -rf ~/Neovim

echo -e "\e[32m[Remove vim-plug and coc-vim]\e[0m"
rm -rf ~/.config/coc
rm -rf ~/.config/nvim

echo -e "\e[32m[Successfully uninstalled Neovim!]\e[0m"
echo -e "\e[33m[Please also remove the exported PATH variable in ~/.bashrc]\e[0m"


