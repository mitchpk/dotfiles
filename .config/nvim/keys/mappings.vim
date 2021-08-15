" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" Better indenting
vnoremap < <gv
vnoremap > >gv

" File search
nnoremap <leader>d <cmd>FZF<CR>

" Buffer management
nnoremap <TAB> <cmd>bnext<CR>
nnoremap <S-TAB> <cmd>bprevious<CR>
nnoremap <leader>c <cmd>bdelete<CR>
