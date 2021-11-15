noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Up> <Nop>
noremap <Right> <Nop>

" set leader key
let g:mapleader = "\\"

filetype plugin indent on
syntax enable

set hidden 
set nowrap 
set ruler 
set iskeyword+=- 
set whichwrap=b,s,<,>,h,l,[,]
set splitright 
set splitbelow 
set conceallevel=0 
set incsearch
set ignorecase
set smartcase
set smartindent 
set nohlsearch
set fillchars+=vert:│
set tabstop=4
set shiftwidth=4 
set expandtab 
set laststatus=0
set noruler
set number
set shortmess+=c
set noswapfile
set nomodeline

" Stop newline continuation of comments
autocmd BufWinEnter,BufNewFile * setlocal formatoptions-=cro

" Return to last edit position when opening files
autocmd BufReadPost *
 \ if line("'\"") > 0 && line("'\"") <= line("$") |
 \ exe "normal! g`\"" |
 \ endif

" Shader file types
autocmd! BufNewFile,BufRead *.vs,*.fs,*.vert,*.frag set ft=glsl
