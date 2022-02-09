
#######################
# System dependencies #
#######################
echo "========================================================================="
echo "Update apt..."
echo "========================================================================="
sudo apt-get update -y
echo "========================================================================="
echo "Install curl..."
echo "========================================================================="
sudo apt-get install curl -y  # Download neovim
echo "========================================================================="
echo "Install xsel..."
echo "========================================================================="
sudo apt-get install xsel -y  # For accessing the system clipboard
echo "========================================================================="
echo "Install clang-format..."
echo "========================================================================="
sudo apt-get install clang-format-12 -y  # For C++ auto-formatting
echo "========================================================================="
echo "Install clangd..."
echo "========================================================================="
sudo apt-get install clangd-12 -y  # C++ language server
echo "========================================================================="
echo "Install automake..."
echo "========================================================================="
sudo apt-get install automake -y  # Required for building universal-ctags from source
echo "========================================================================="
echo "Clone universal-ctags..."
echo "========================================================================="
git clone https://github.com/universal-ctags/ctags.git
cd ctags
echo "========================================================================="
echo "universal-ctags autogen.sh..."
echo "========================================================================="
./autogen.sh
echo "========================================================================="
echo "universal-ctags configure..."
echo "========================================================================="
./configure
echo "========================================================================="
echo "universal-ctags make..."
echo "========================================================================="
make
echo "========================================================================="
echo "universal-ctags install..."
echo "========================================================================="
sudo make install

##########
# NeoVim #
##########
echo "========================================================================="
echo "Download NeoVim..."
echo "========================================================================="
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
echo "========================================================================="
echo "Install Neovim..."
echo "========================================================================="
chmod u+x nvim.appimage
sudo mv nvim.appimage /bin/vim
echo "========================================================================="
echo "Install python3-pip..."
echo "========================================================================="
sudo apt-get install python3-pip -y
echo "========================================================================="
echo "Update pip3..."
echo "========================================================================="
pip3 install --upgrade pip
echo "========================================================================="
echo "Install neovim and unidecode..."
echo "========================================================================="
pip3 install neovim neovim-remote unidecode
echo "========================================================================="
echo "Install node..."
echo "========================================================================="
curl -sL install-node.now.sh/lts | sudo bash
echo "========================================================================="
echo "Node install neovim and yarn..."
echo "========================================================================="
sudo npm -g install neovim yarn

#################################
# Vim Configuration and Plugins #
#################################
echo "========================================================================="
echo "Install vim-plug..."
echo "========================================================================="
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "========================================================================="
echo "Copy vim configuration file..."
echo "========================================================================="
mkdir -p ~/.config/nvim/plugged/
cd ~/clone/neovim-cpp-python
cp ./init.vim ~/.config/nvim/
echo "========================================================================="
echo "Install vim plugins..."
echo "========================================================================="
vim +'PlugInstall' +qall
echo "========================================================================="
echo "Install coc extensions..."
echo "========================================================================="
vim +'CocInstall -sync coc-pyright coc-git coc-cmake coc-json coc-vimtex coc-clangd coc-snippets
CocCommand clangd.install' +qall
vim +CocUpdateSync +qall
