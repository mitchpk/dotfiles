local keymap = vim.keymap

vim.g.mapleader = ','
keymap.set('n', ',,', ',')

keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')
keymap.set('n', 'n', 'nzz')
keymap.set('n', 'N', 'Nzz')

keymap.set('n', 'x', '"_x')
keymap.set('x', '<leader>p', '"_dP')
keymap.set('n', '<leader>Y', '"+Y')
keymap.set({'n', 'v'}, '<leader>y', '"+y')
keymap.set({'n', 'v'}, '<leader>d', '"_d')

keymap.set('n', '<C-n>', '<cmd>cnext<CR>zz')
keymap.set('n', '<C-p>', '<cmd>cprev<CR>zz')

keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

keymap.set('n', '<C-a>', 'gg<S-v>G')

keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')
keymap.set('', 'sq', '<C-w>q')

keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
