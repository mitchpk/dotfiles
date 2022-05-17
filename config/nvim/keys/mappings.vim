" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" Better indenting
vnoremap < <gv
vnoremap > >gv

" File search
nnoremap <leader>d <cmd>Telescope find_files<CR>

" Buffer management
nnoremap <TAB> <cmd>bnext<CR>
nnoremap <S-TAB> <cmd>bprevious<CR>
nnoremap <leader>c <cmd>bdelete<CR>

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
