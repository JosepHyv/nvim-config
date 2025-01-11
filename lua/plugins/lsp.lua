return {
    {
        "williamboman/mason.nvim",
        config = true,
        modifiable = true
    }, 
    {
        "williamboman/mason-lspconfig.nvim",  
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason").setup()

            require("mason-lspconfig").setup({
                ensure_installed = { "ruff", "ts_ls","clangd", "pyright"}, 
            })

            local lspconfig = require("lspconfig")

            lspconfig.ruff.setup{
            init_options = {
                    settings = {
                        args = {},  
                    },
                },
            }

            lspconfig.clangd.setup{}


            lspconfig.ts_ls.setup({
                on_attach = function(client, bufnr)
                        client.server_capabilities.documentFormattingProvider = false
                end,
                filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
                root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git")
            })
                        
            
            lspconfig.pyright.setup{
                settings = {
                      python = {
                        analysis = {
                          autoSearchPaths = true,
                          diagnosticMode = "openFilesOnly",
                          useLibraryCodeForTypes = true
                        }
                    }
                },
                on_attach = function(client, bufnr)
                    client.server_capabilities.documentFormattingProvider = false
                end, 
                filetypes = {"python"}

            }

        end,
    },
}
