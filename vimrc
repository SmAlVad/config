" BASIC SETUP

" enter the current mellenium
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

set nu
set noswapfile
set expandtab
set tabstop=2
set shiftwidth=2
set hlsearch
set incsearch
set autoindent
set paste

let mapleader = ","
let g:user_emmet_leader_key='<C-e>'

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'valloric/youcompleteme'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" PHP
Plug 'jwalton512/vim-blade', { 'for': 'php' }
Plug '2072/PHP-Indenting-for-VIm', { 'for': 'php' }
Plug 'stanangeloff/php.vim'

" Color scheemes
Plug 'nanotech/jellybeans.vim'

" Initialize plugin system
call plug#end()

let g:ycm_path_to_python_interpreter = '/usr/bin/python3'

let g:ale_php_phpcs_standard = 'PSR12'
let g:ale_php_phpcs_executable = expand('~/.composer/vendor/bin/phpcs')
let g:ale_php_phpcs_use_global = 1
let g:ale_php_langserver_use_global = 1
let g:ale_php_langserver_executable = expand('~/.composer/vendor/bin/php-language-server.php')
let g:ale_javascript_eslint_use_global = 1

let NERDTreeShowHidden=1

"mappings
nmap <silent> <leader><leader> :NERDTreeToggle<CR>
"let g:EasyMotion_leader_key = '<Leader>'
"map <Leader> <Plug>(easymotion-prefix)
" Select all text
map <C-a> <esc>ggVG<CR>

nnoremap <leader>b :Buffers<CR>

colorscheme jellybeans
set background=dark

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
" Fzf key
nnoremap <Leader>w :w<CR>
nnoremap <Leader>o :GFiles .<CR>
nnoremap <leader>fc :Commits<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fa :Rg<CR>

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
