local noice =  {
    "folke/noice.nvim", 
    event = "VeryLazy", 
    dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
    },
}


noice.config = function() 
    require("noice").setup({
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true, 
                ["vim.lsp.util.stylize_markdown"] = true, 
                ["cmp.enty.get_documentation"] = true,
            },
        },
        pressets = {
            bottom_search = true, 
            command_palette = true, 
            long_message_to_split = true, 
            inc_rename = false, 
            lsp_doc_border = false,
        }
    })
end

return noice 
