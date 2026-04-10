set nocompatible
filetype off
syntax on

filetype plugin indent on

"nerdtree tab commands
nnoremap tn :tabnew<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

"spell check
map <F6> :setlocal spell! spelllang=en_us<CR>

"copy and paste
vnoremap <C-c> "*y :let @+=@*<CR>
map <C-p> "+P

"insert remaps
inoremap jk <Esc>

set relativenumber
set number
set autoindent
set expandtab
set shiftwidth=4
set shiftround
set tabstop=4
set history=1000
