set nocompatible            " disable compatibility to old-time vi
set modelines=0             " for security

set tabstop=4               " number of columns occupied by a tab
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents

set encoding=utf-8
set scrolloff=3
set noshowmode
set showcmd
set hidden
set visualbell
set cursorline
set ttyfast                 " Speed up scrolling in Vim
set ruler
set wildmode=longest,list   " get bash-like tab completions
set number                  " add line numbers
set relativenumber
set undofile
set autoindent              " indent a new line the same amount as the line just typed

let mapleader = " "

nnoremap / /\v
vnoremap / /\v
set ignorecase              " case insensitive
set smartcase
set gdefault
set incsearch               " incremental search
set showmatch               " show matching
set hlsearch                " highlight search
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap ; :
" save on focus change
au FocusLost * :wa
" remove trailing whitespaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set clipboard=unnamedplus   " using system clipboard
filetype plugin on

call plug#begin('~/.vim/plugged')
" Plugins
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'preservim/nerdtree'
    Plug 'mhinz/vim-startify'
    Plug 'sheerun/vim-polyglot'
    Plug 'itchyny/lightline.vim'
    Plug 'ryanoasis/vim-devicons' " always load last
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let g:tokyonight_style = "strom"
let g:tokyonight_italics_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
let g:tokyonight_dark_sidebar = 1
let g:lightline = {'colorscheme': 'tokyonight'}

colorscheme tokyonight
"autocmd VimEnter * NERDTree


" noraml node mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>w <C-w>v<C-w>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <A-j> :m .+1<CR>
nnoremap <A-k> :m .-2<CR>
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>
" insert mode keymaps
inoremap <A-j> <Esc>:m .+1<CR>
inoremap <A-k> <Esc>:m .-2<CR>
inoremap jj <ESC>


