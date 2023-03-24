# Installation

Install [`Mambaforge`](https://github.com/conda-forge/miniforge)

## System Dependencies

=== "Ubuntu"

    ```bash
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt install neovim -y
    sudo apt install xsel -y
    sudo apt install clang-format -y
    sudo apt install curl -y
    ```

    Install `Node.js` and `npm` from source.

    ```bash
    mkdir ~/nodejs
    curl -sfLS install-node.vercel.app | bash -s -- --prefix=$HOME/nodejs --version=16
    echo 'export PATH=$PATH:$HOME/nodejs/bin' >> ~/.bashrc
    source ~/.bashrc
    ```

    Install `ctags`

    ```
    sudo apt install automake -y
    git clone https://github.com/universal-ctags/ctags.git
    cd ctags
    ./autogen.sh
    ./configure
    make -j$(nproc)
    sudo make install
    ```

=== "MacOS"

    ```zsh
    brew install neovim
    brew install xsel
    brew install clang-format
    brew install curl
    brew install node
    brew install ctags
    ```

## Python Dependencies

```
pip install pynvim pygments neovim-remote unidecode
```

## Node Dependencies

```
npm install neovim yarn
```

## Vim Setup

```
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/nvim/plugged/
# Copy the init.vim in this repository to ~/.config/nvim/
```

Find your `python3` and `node` path:

```
which python3
which node
```

Change `python3_host_prog` and `coc_node_path` accordingly.

```
vim ~/.config/nvim/init.vim
let g:python3_host_prog='path-given-by-which-python3'
let g:coc_node_path='path-given-by-which-node'
```

Enter vim and install plugins:

```
vim

# Type in the following command in vim to install vim plugins:
:PlugInstall

# Type in the following command in vim to install coc plugins:
CocInstall coc-pyright coc-git coc-cmake coc-json coc-vimtex coc-clangd coc-snippets

# Optionally, setup Copilot
:Copilot setup
```
