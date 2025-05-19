return {
    {
        "williamboman/mason.nvim",
        config = true,
        -- modifiable = true
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
                ensure_installed = {
                    "ruff_lsp",
                    "ts_ls",
                    "clangd",
                    "pyright",
                    "gopls",
                    "bashls",
                    "html",
                    "lua_ls"
                },
            })

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            lspconfig.pyright.setup({
                capabilities = capabilities,
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            diagnosticMode = "openFilesOnly",
                            useLibraryCodeForTypes = true
                        }
                    }
                }
            })

            lspconfig.ruff.setup({
                capabilities = capabilities,
                init_options = {
                    settings = {
                        args = {},
                    },
                },
            })


            lspconfig.ts_ls.setup({
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    client.server_capabilities.documentFormattingProvider = false
                end,
                filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
                root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git")
            })
            lspconfig.clangd.setup({ capabilities = capabilities })
            lspconfig.gopls.setup({ capabilities = capabilities })
            lspconfig.bashls.setup({ capabilities = capabilities })
            lspconfig.html.setup({ capabilities = capabilities })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            })
        end,
    },
}
