call plug#begin('~/.vim/plugged')

Plug 'ryanoasis/vim-devicons'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'morhetz/gruvbox'

call plug#end()

set encoding=UTF-8

colorscheme gruvbox
set background=dark

syntax on
let g:mapleader=','

set number
set expandtab
set tabstop=2

set hlsearch
set incsearch

map <C-n> :NERDTreeToggle<CR>
