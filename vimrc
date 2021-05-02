" Make things pretty
syntax on
colorscheme slate
set number
set relativenumber
map <F6> :setlocal spell! spelllang=en_us<CR>
set formatoptions-=cro

" Disable bell
set visualbell
set t_vb=

" Ctrl-P for easier search
" Don't forget to clone into .vim - https://ctrlpvim.github.io/ctrlp.vim/
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
