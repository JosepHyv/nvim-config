return {
    {
        "williamboman/mason.nvim",
        config = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason").setup()

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "ts_ls",
                    "clangd",
                    "pyright",
                    "gopls",
                    "bashls",
                    "html",
                    "lua_ls"
                },
                handlers = {
                    function(server_name) -- default handler
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,
                    ["lua_ls"] = function()
                        require("lspconfig").lua_ls.setup({
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim" },
                                    },
                                },
                            },
                        })
                    end,
                    ["pyright"] = function()
                        require("lspconfig").pyright.setup({
                            capabilities = capabilities,
                            settings = {
                                python = {
                                    analysis = {
                                        autoSearchPaths = true,
                                        diagnosticMode = "openFilesOnly",
                                        useLibraryCodeForTypes = true,
                                    },
                                },
                            },
                        })
                    end,
                    ["ts_ls"] = function()
                        require("lspconfig").ts_ls.setup({
                            capabilities = capabilities,
                            on_attach = function(client, bufnr)
                                client.server_capabilities.documentFormattingProvider = false
                            end,
                            filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
                            root_dir = require("lspconfig").util.root_pattern("package.json", "tsconfig.json", ".git"),
                        })
                    end,
                },
            })
        end,
    },
}
