vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.keymap.set('n', ',,', ',')

vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('x', '<leader>p', '"_dP')
vim.keymap.set('n', '<leader>Y', '"+Y')
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y')
vim.keymap.set({'n', 'v'}, '<leader>d', '"_d')

vim.keymap.set('n', '<C-n>', '<cmd>cnext<CR>')
vim.keymap.set('n', '<C-p>', '<cmd>cprev<CR>')

vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')

vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

vim.keymap.set('n', 'ss', ':split<Return><C-w>w')
vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

vim.keymap.set('', 'sh', '<C-w>h')
vim.keymap.set('', 'sk', '<C-w>k')
vim.keymap.set('', 'sj', '<C-w>j')
vim.keymap.set('', 'sl', '<C-w>l')
vim.keymap.set('', 'sq', '<C-w>q')

vim.keymap.set('n', '<C-w><left>', '<C-w><')
vim.keymap.set('n', '<C-w><right>', '<C-w>>')
vim.keymap.set('n', '<C-w><up>', '<C-w>+')
vim.keymap.set('n', '<C-w><down>', '<C-w>-')
