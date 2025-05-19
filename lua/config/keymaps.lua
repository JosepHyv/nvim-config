local keymap = vim.keymap
local opts = {noremap = true, silent = true}

--- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

--- toggle nvim NvimTreeToggle
--keymap.set("n", '<C-e>', ':NvimTreeToggle<Return>', opts)

--- open lazy
keymap.set("n", "<leader>l", ":Lazy<Return>", opts)

--- open mason

keymap.set("n", "<leader>m", ":Mason<Return>", opts)

--- find files telescope 
keymap.set("n", "<leader>p", ":Telescope find_files<Return>", opts)

--- find open buffers
keymap.set("n", "<leader>b", ":Telescope buffers<Return>", opts)

--- open telescope as command line
--keymap.set("n", "<C-S-p>", ":Telescope commands<Return>", opts)

--- Ctrl + q to close current
keymap.set("n", "<C-q>", ":quit<Return>", opts)
--keymap.set("n", "<C-S-q>", ":quitall<Return>", opts)

--- Ctrl + s to save and format
keymap.set("n", "<C-s>", function()
    vim.lsp.buf.format({async = true})
    vim.cmd("write")
end, opts)

--- select all the file 
keymap.set("n", "<leader>a", "gg<S-v>G")
--- Ctrl + c to copy selected lines 
keymap.set("v", "<leader>y",'"+y', opts)


-- jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

--- Tabs
keymap.set("n", "te", ":tabedit<Return>", opts)
keymap.set("n", "<leader>]", ":tabnext<Return>", opts)
keymap.set("n", "<leader>[", ":tabprev<Return>", opts)

--- Split windows 

keymap.set("n", "<leader>s", ":split<CR>", opts)
keymap.set("n", "<leader>v", ":vsplit<CR>", opts)

--- Move window
keymap.set("n", "<leader>h", "<C-w><left>", opts)
keymap.set("n", "<leader>k", "<C-w><up>", opts)
keymap.set("n", "<leader>j", "<C-w><down>", opts)
keymap.set("n", "<leader>l", "<C-w><right>", opts)

--- Resize windows 
keymap.set("n", "<leader><left>", "<C-w><")
keymap.set("n", "<leader><right>", "<C-w>>")
keymap.set("n", "<leader><up>", "<C-w>+")
keymap.set("n", "<leader><down>", "<C-w>-")
