#################################
# Vim Configuration and Plugins #
#################################
echo "========================================================================="
echo "Install vim-plug..."
echo "========================================================================="
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "========================================================================="
echo "Copy vim configuration file..."
echo "========================================================================="
cp ./init.vim ~/.vimrc
echo "========================================================================="
echo "Install vim plugins..."
echo "========================================================================="
vim +'PlugInstall' +qall
echo "You are good to go!"
