
-- Formatear automáticamente al guardar
vim.api.nvim_create_user_command("WF", function()
  vim.lsp.buf.format({ async = true })
  vim.cmd("write")  -- Guardar el archivo
end, {})


--vim.api.nvim_create_autocmd("BufWritePre", {
--  callback = function()
--    vim.lsp.buf.format({ async = true })
--  end,
--})



