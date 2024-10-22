vim.cmd("colorscheme vim")
vim.cmd[[highlight Comment gui=bold ctermbg=10 guifg=LightGreen]]
vim.cmd[[highlight StatusLine guibg=NONE gui=bold]] 

vim.diagnostic.config({
  virtual_text = true,  -- Desactiva los rectángulos
  underline = true,      -- Subraya las líneas con advertencias/errores
  signs = false,          -- Activa los signos de advertencia en el margen izquierdo
  update_in_insert = true, --No mostrar en modo insertar
})


vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#333333" }) -- Menús flotantes
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#333333" }) -- Bordes de menús flotantes
vim.api.nvim_set_hl(0, "SignColumn", { bg = "#333333" }) -- Columna de signos
vim.api.nvim_set_hl(0, "WinSeparator", { bg = "#333333" }) -- Separadores de ventanas
vim.api.nvim_set_hl(0, "Pmenu", { bg = "#333333" }) -- menu emergente


local opt = vim.opt
local o = vim.o
o.completeopt = 'menuone,noselect,noinsert,popup'
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

