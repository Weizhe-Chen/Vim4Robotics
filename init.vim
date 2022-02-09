"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged/')
" <leader>fs to switch between cpp file and h file
Plug 'derekwyatt/vim-fswitch'
" <C-n>
Plug 'preservim/nerdtree'
" <leader>c<space>
Plug 'preservim/nerdcommenter'
"color scheme
Plug 'sainnhe/sonokai'
Plug 'vim-airline/vim-airline'
" <C-l> for adding colon at the end
Plug 'lfilho/cosco.vim'
Plug 'tpope/vim-fugitive'
Plug 'chrisbra/csv.vim'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" basic settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
syntax on
" Save and quit using leader key instead of :
nnoremap <leader>w :w<CR>
nnoremap <leader>qw :wq<CR>
" Jump to the head and rear of a line using H and L
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $
" Jump between visual lines instead
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
" Select the content again after shifting
vnoremap < <gv
vnoremap > >gv
" Paste using p
if has('clipboard')
    if has('unnamedplus')  
        set clipboard=unnamed,unnamedplus
    else         
        set clipboard=unnamed
    endif
endif
" 'p' to paste, 'gv' to re-select what was originally selected. 'y' to copy it again
xnoremap p pgvy

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP
" jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Disable automatical comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Auto closing brackets.
inoremap ( ()<LEFT>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
" inoremap <leader>( (
inoremap [ []<LEFT>
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
" inoremap <leader>[ [
inoremap { {}<LEFT>
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
" inoremap <leader>{ {
inoremap <expr> <CR> strpart(getline('.'), col('.')-1, 1) == "}" ? "\<CR>\<ESC>\k\o" : "<CR>"
" inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
" inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
" inoremap <leader>" "
" inoremap <leader>' '
set number relativenumber   " hybrid line number
set nu rnu                  " hybrid line number
set noswapfile              " we can use persistent-undo instead of swap files
set nobackup                " I'd like to save by myself
set undofile                " maintain undo history between sessions
set undodir=~/.vim/undodir  " mkdir ~/.vim/undodir
set ruler                   " highlight current line
set autoindent              " set paste to disable auto indent
set mouse+=a                " enable mouse to browse documentation in code
set title                   " show file title
set scrolloff=7             " scrolling offset
set hlsearch                " highlight search results
set ignorecase              " ignore upper or lower case when searching
set autochdir               " working dir is the same as the file u r editing
set encoding=utf-8          " utf-8 encoding scheme
set tabstop=2               " how many columns a tab counts for?
set shiftwidth=2            " indent width
set expandtab               " replace tabs with spaces
" set nowrap                  " disable line wrapping
set clipboard+=unnamedplus  " copy to system clipboard
set guicursor=a:blinkon100  " Blinking cursor
set spelllang=en,cjk        " Spell check languages
set colorcolumn=80          " Line length limit


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close vim if the only window left is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinSize = 30
" Start NERDTree
" autocmd VimEnter * NERDTree
" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p
nnoremap <C-n> :NERDTreeToggle<CR>

colorscheme sonokai


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" Python docstirng style
let g:ultisnips_python_style = 'numpy'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-fswitch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufEnter *.h let b:fswitchdst = 'cpp,cc,c' | let b:fswitchlocs = 'reg:|include.*|src/**|'
nmap <silent> <leader>fs :FSHere<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdcommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cosco.vim (semicolon)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType m,h,hpp,c,cpp,dot nmap <silent> <c-l> <Plug>(cosco-commaOrSemiColon)<ESC>
autocmd FileType m,h,hpp,c,cpp,dot imap <silent> <c-l> <c-o><Plug>(cosco-commaOrSemiColon)<ESC>
let g:cosco_ignore_comment_lines = 1     " Default : 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimtex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-c> :VimtexTocToggle<CR>
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : 'build',
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull',
      \ 'Overfull',
      \]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" spell check
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>spell :set spell!<cr>
inoremap <silent> <leader>spell :set spell!<cr>
