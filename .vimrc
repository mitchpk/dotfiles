syntax on
filetype plugin indent on
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set nocompatible
set autoindent
set smartindent
set smartcase
set ignorecase
set nowrap
set noswapfile
set incsearch
set backspace=indent,eol,start
set noruler
set noshowmode
set wildmenu
set wildmode=full
set laststatus=0
set t_Co=256

call plug#begin('~/.vim/plugged')

Plug 'jremmen/vim-ripgrep'
Plug 'Valloric/YouCompleteMe'
Plug 'mbbill/undotree'

call plug#end()

set background=dark

if executable('rg')
    let g:rg_derive_root = 'true'
endif

let mapleader = " "
"let g:netrw_browse_split = 2
let g:netrw_banner = 0
"let g:netrw_winsize = 25

let g:ycm_global_ycm_extra_conf = "~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py"
let g:ycm_clangd_args=['--header-insertion=never']
let g:ycm_enable_diagnostic_signs = 0

set completeopt-=preview

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
