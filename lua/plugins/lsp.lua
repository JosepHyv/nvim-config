return {
    {
        "williamboman/mason.nvim",
        config = true,
        modifiable = true
    }, 
    {
        "neovim/nvim-lspconfig",
    },
    {
        "williamboman/mason-lspconfig.nvim",  -- Asegúrate de tener instalado mason-lspconfig
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason").setup()

            -- Configuración de mason-lspconfig
            require("mason-lspconfig").setup({
                ensure_installed = { "ruff", "ts_ls","clangd", "eslint", "pyright"}, -- Asegúrate de instalar estos servidores
            })

            -- Configuración de nvim-lspconfig
            local lspconfig = require("lspconfig")

            lspconfig.ruff.setup{
            init_options = {
                    settings = {
                        args = {},  
                    },
                },
            }

            -- Configuración de clangd LSP
            lspconfig.clangd.setup{}

           -- lspconfig.eslint.setup({
           --   on_attach = function(client, bufnr)
           --     vim.api.nvim_create_autocmd("BufWritePre", {
           --       buffer = bufnr,
           --       command = "EslintFixAll",
                  --filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue", "svelte", "astro" },
           --     })
           --   end,
           -- })

            lspconfig.ts_ls.setup({
                on_attach = function(client, bufnr)
                        client.server_capabilities.documentFormattingProvider = false
                end,
                init_options = {
                    plugins = {{
                       -- name = "@vue/typescript-plugin", 
                       --location = "/usr/local/lib/node_modules/@vue"
                    }},  
                }, 
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
