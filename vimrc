set nocompatible
filetype off
syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'
Plugin 'Valloric/YouCompleteMe'
Plugin 'raimondi/delimitmate'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'yggdroot/indentline'
Plugin 'scrooloose/syntastic'
Plugin 'xuhdev/vim-latex-live-preview'

call vundle#end()
filetype plugin indent on

"vim-latex-live-preview options
let g:livepreview_previewer = 'open -a Preview'
nnoremap ct :LLPStartPreview<CR>

"vim-airline extensions
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SysntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"nerdtree tab commands
map <C-n> :NERDTreeToggle<CR>
nnoremap tn :tabnew<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

"quit, write, and spell check
map <C-x> :q<CR>
map <C-w> :w<CR>
map <F6> :setlocal spell! spelllang=en_us<CR>

"nerdtree window commands
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"copy and paste
vnoremap <C-c> "*y :let @+=@*<CR>
map <C-p> "+P

"git shortcuts
nnoremap gs :!git status<CR>
nnoremap gc :!git commit<CR>
nnoremap gpl :!git pull<CR>
nnoremap gps :!git push<CR>

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
