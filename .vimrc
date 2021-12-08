syntax on
colorscheme slate
set number
set relativenumber
map <F6> :setlocal spell! spelllang=en_us<CR>

call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/goyo.vim'
call plug#end()

" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2

" Goyo config
let g:goyo_linenr=1
let g:goyo_width=100
autocmd VimEnter * Goyo
