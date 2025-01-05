local keymap = vim.keymap
local opts = {noremap = true, silent = true}

--- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

--- toggle nvim NvimTreeToggle
keymap.set("n", '<C-e>', ':NvimTreeToggle<Return>', opts)

--- open lazy
keymap.set("n", "<C-l>", ":Lazy<Return>", opts)

--- find files telescope 
keymap.set("n", "<C-p>", ":Telescope find_files<Return>", opts)

--- find open buffers
keymap.set("n", "<C-b>", ":Telescope buffers<Return>", opts)

--- open telescope as command line
keymap.set("n", "<C-S-p>", ":Telescope commands<Return>", opts)

--- Ctrl + q to close current
keymap.set("n", "<C-q>", ":quit<Return>", opts)
--keymap.set("n", "<C-S-q>", ":quitall<Return>", opts)

--- Ctrl + s to save and format
keymap.set("n", "<C-s>", function()
    vim.lsp.buf.format({async = true})
    vim.cmd("write")
end, opts)

--- Ctrl + c to copy selected lines 
keymap.set("n", "<C-c>", "+y")

--- Select all file
keymap.set("n", "<C-a>", "gg<S-v>G")

--- jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

--- Tabs
keymap.set("n", "te", ":tabedit<Return>", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<S-tab>", ":tabprev<Return>", opts)

--- Split windows 

keymap.set("n", "ss", ":split<CR>", opts)
keymap.set("n", "sv", ":vsplit<CR>", opts)

--- Move window
keymap.set("n", "h", "<C-w><left>", opts)
keymap.set("n", "k", "<C-w><up>", opts)
keymap.set("n", "j", "<C-w><down>", opts)
keymap.set("n", "l", "<C-w><right>", opts)

--- Resize windows 
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")
