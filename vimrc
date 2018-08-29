set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'

call vundle#end()
filetype plugin indent on

map <C-n> :NERDTreeToggle<CR>
map <C-w> :q<CR>
map <F6> :setlocal spell! spelllang=en_us<CR>
map <C-s> :w<CR>

vnoremap <C-c> "*y :let @+=@*<CR>
map <C-p> "+P

set relativenumber
set number
