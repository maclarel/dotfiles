" Color scheme
syntax enable
set background=dark
" Uncomment following line depending on terminal emulator if colors don't appear properly
"let g:solarized_termcolors=256
" Download @ https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim
colorscheme solarized

" Navigation & display
set number
set relativenumber
set t_Cs=
map <F6> :setlocal spell spelllang=en_us<CR>
  " On pressing tab, insert 2 spaces
set expandtab
  " show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2

" Key binds
let mapleader=" "
nnoremap <leader>o :Lex<CR>
nnoremap <leader><ENTER> :Goyo<CR>

" Auto-install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
let g:ctrlp_show_hidden = 1

" Status line
let g:airline_theme='base16_solarized'

" Goyo config
let g:goyo_linenr=1
let g:goyo_width=100

" autocmd VimEnter * Goyo
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

