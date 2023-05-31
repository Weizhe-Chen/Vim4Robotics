"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged/')
" coc-vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Snipppets
Plug 'SirVer/ultisnips'
Plug 'Weizhe-Chen/vim-snippets'
" <leader>fs to switch between cpp file and h file
Plug 'derekwyatt/vim-fswitch'
" <C-n> for NERDTree file browser
Plug 'preservim/nerdtree'
" <leader>c<space> for commenting
Plug 'preservim/nerdcommenter'
" <leader>t for TagList
Plug 'yegappan/taglist'
" Auto code formatting
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
"color scheme
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
" ctrl+l for adding colon at the end
Plug 'lfilho/cosco.vim'
" Git
Plug 'tpope/vim-fugitive'
" LaTeX
Plug 'lervag/vimtex'
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" vim-translator
Plug 'voldikss/vim-translator'
" Copilot
Plug 'github/copilot.vim'
call plug#end()

