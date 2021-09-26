" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Auto pairs for '(' '[' '{'
    Plug 'windwp/nvim-autopairs'
    " Language server
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    " Colour scheme
    Plug 'arcticicestudio/nord-vim'
    " File search
    Plug 'junegunn/fzf.vim'
    " LaTeX support
    Plug 'lervag/vimtex'
    " Rust!
    Plug 'rust-lang/rust.vim'

call plug#end()
