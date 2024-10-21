vim.cmd("colorscheme vim")
vim.cmd[[highlight Comment gui=bold ctermbg=10 guifg=LightGreen]]
vim.cmd[[highlight StatusLine guibg=NONE gui=bold]] 

local opt = vim.opt 
opt.hlsearch = true 
opt.ruler = true
opt.ai = true
opt.encoding = 'utf-8'
opt.number = true 
opt.autoindent = true 
opt.wrap = true 
opt.tabstop = 4
opt.softtabstop = 4 
opt.expandtab = true 
opt.ignorecase = true 
opt.title = true 
opt.cursorline = false
opt.shell = 'zsh'
opt.mouse = 'a' 
opt.ignorecase = true
opt.shiftwidth = 4

