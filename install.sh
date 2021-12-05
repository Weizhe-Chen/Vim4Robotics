################
# apt installs #
################
sudo apt update
sudo apt install curl  # Download neovim
sudo apt install xsel  # For accessing the system clipboard
sudo apt install clang-format-12  # For C++ auto-formatting
sudo apt install clangd-12  # C++ language server
sudo apt-get install automake  # Required for building universal-ctags from source

##################
# Install NeoVim #
##################
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /bin/vim

###########################
# Install universal-ctags #
###########################
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure
make
sudo make install

#############################
# Python support for NeoVim #
#############################
sudo apt-get install python3-pip
pip3 install --upgrade pip
pip3 install neovim unidecode

################
# Install node #
################
curl -sL install-node.now.sh/lts | sudo bash
sudo npm -g install neovim

####################
# Install vim-plug #
####################
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

###############################
# Copy vim configuration file #
###############################
mkdir -p ~/.config/nvim/plugged/
cd ~/clone/neovim-cpp-python
cp ./init.vim ~/.config/nvim/
