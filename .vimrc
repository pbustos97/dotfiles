set nocompatible
filetype off
syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'

call vundle#end()
filetype plugin indent on

map <C-n> :NERDTreeToggle<CR>
nnoremap tn :tabnew<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

map <C-w> :q<CR>
map <C-s> :w<CR>
map <F6> :setlocal spell! spelllang=en_us<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


vnoremap <C-c> "*y :let @+=@*<CR>
map <C-p> "+P

set relativenumber
set number
set autoindent
set expandtab
set shiftwidth=4
set shiftround
set tabstop=4
set history=1000