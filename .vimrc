" Navigation & display
set number
set relativenumber
  " Fix spellcheck highlighting w/ Solarized
set t_Cs=
map <F6> :setlocal spell! spelllang=en_us<CR>
  " On pressing tab, insert 2 spaces
set expandtab
  " show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
  " Fix backspace wonkiness
set backspace=indent,eol,start
  " Mouse support
set mouse+=a

" Key binds
let mapleader=" "
nnoremap <leader>t :set splitbelow \| :sp term://zsh<CR>
nnoremap <leader>gn :tabnew<CR>
nnoremap <leader>gl :tabnext<CR>
nnoremap <leader>gh :tabprev<CR>
nnoremap <leader>gx :tabclose<CR>
nnoremap <leader>o :call NvimTreeToggleAll()<CR>
nnoremap <leader>O :NvimTreeFindFileToggle<CR>
nnoremap <leader><ENTER> :Goyo<CR>
nnoremap <leader>a :ALEToggle<CR>
nnoremap <leader>M :MarkdownPreviewToggle<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
  " Terminal split navigation
tnoremap <leader>h <C-\><C-N><C-w>h
tnoremap <leader>j <C-\><C-N><C-w>j
tnoremap <leader>k <C-\><C-N><C-w>k 
tnoremap <leader>l <C-\><C-N><C-w>l 
  " Telescope
nnoremap <leader>ff <cmd>Telescope find_files hidden=false<cr>
nnoremap <leader>FF <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
  " Copilot
imap <silent> <C-j> <Plug>(copilot-next)
imap <silent> <C-k> <Plug>(copilot-previous)

" Auto-install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'github/copilot.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
" Plug 'davidhalter/jedi-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'rcarriga/nvim-notify'
Plug 'MunifTanjim/nui.nvim'
Plug 'folke/noice.nvim'
Plug 'overcache/NeoSolarized'
call plug#end()
lua require'nvim-tree'.setup {}
lua require("noice").setup()

" Status line
let g:airline_theme='solarized'

" NvimTree toggle on all tabs
function! NvimTreeToggleAll()
  let current_tab = tabpagenr()
  if g:nvim_tree_open
    tabdo NvimTreeClose
    let g:nvim_tree_open = 0
  else
    tabdo NvimTreeOpen
    let g:nvim_tree_open = 1
  endif
  execute 'tabnext' current_tab
endfunction
let g:nvim_tree_open = 0

" Auto-open NvimTree on ctrl-t
lua <<EOF
require("nvim-tree").setup({
  open_on_tab = true,
})
EOF

" Goyo
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

" ALE
let g:ale_linters = {'python': 'all', 'ruby': ['rubocop', 'standardrb'], 'bash': ['shellcheck']}
let g:ale_fixers = {'python': ['isort', 'yapf', 'remove_trailing_lines', 'trim_whitespace'], 'ruby': ['standardrb']}
let g:ale_lsp_suggestions = 1
let g:ale_fix_on_save = 1
let g:ale_go_gofmt_options = '-s'
let g:ale_go_gometalinter_options = '— enable=gosimple — enable=staticcheck'
let g:ale_completion_enabled = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %code: %%s'

" Jedi
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

" Color scheme
syntax enable
set background=dark
set termguicolors
colorscheme NeoSolarized

" Have nvim show external changes to file while open
set autoread
augroup auto_read
  autocmd!
  autocmd FocusGained,BufEnter * checktime
