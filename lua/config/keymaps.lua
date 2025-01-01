local keymap = vim.keymap
local opts = {noremap = true, silent = true}

-- Formatear automáticamente al guardar
--vim.api.nvim_create_user_command("WF", function()
--  vim.lsp.buf.format({ async = true })
--  vim.cmd("write")  -- Guardar el archivo
--end, {})


--vim.api.nvim_create_autocmd("<C-b>", function()
    
--end, {})

keymap.set("n", '<C-b>', ':NvimTreeToggle<CR>', opts)
keymap.set("n", "<C-s>", function()
    vim.lsp.buf.format({async = true})
    vim.cmd("write")
end, opts)


--vim.api.nvim_create_autocmd("BufWritePre", {
--  callback = function()
--    vim.lsp.buf.format({ async = true })
--  end,
--})



