return { 
    'nvim-telescope/telescope.nvim', 
    dependencies = {'nvim-lua/plenary.nvim'},
    tag = '0.1.8',
    config = function()
        require('telescope').setup{
            defaults = {
                file_ignore_patterns = {"node_modules", ".git/", ".vscode/"}
            },
            mappings = {
                i = {
                    ["<Esc>"] = require("telescope.actions").close,
                    ["<C-q>"] = require("telescope.actions").close,
                },
                n = {
                    ["<Esc>"] = require("telescope.actions").close,
                    ["<C-q>"] = require("telescope.actions").close,
                }
            }
        }
    end 

}
