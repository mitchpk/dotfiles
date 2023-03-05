vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.showmode = false
vim.opt.cmdheight = 1
vim.opt.laststatus = 3
vim.opt.expandtab = true
vim.opt.scrolloff = 5
vim.opt.cursorline = true
vim.opt.guicursor = ''
vim.opt.shell = 'fish'
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wrap = false
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*/node_modules/*' }

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = '*',
    command = "set nopaste"
})

local function remove_whitespace()
    local save = vim.fn.winsaveview()
    vim.cmd [[keepjumps keeppatterns silent! %s/\s\+$//e]]
    vim.fn.winrestview(save)
end

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = '*',
    callback = remove_whitespace
})
