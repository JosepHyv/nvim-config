return {
    {
        "nvimtools/none-ls.nvim", -- fork de null-ls
        dependencies = {
            "nvim-lua/plenary.nvim",
            "williamboman/mason.nvim",
            "jay-babu/mason-null-ls.nvim",
        },
        config = function()
            local null_ls = require("null-ls")
            local mason_null_ls = require("mason-null-ls")

            local formatting = null_ls.builtins.formatting

            null_ls.setup({
                debug = false,
                sources = {
                    -- Python
                    formatting.black.with({ extra_args = { "--fast" } }),

                    -- Go
                    formatting.gofmt,

                    -- C/C++
                    formatting.clang_format.with({
                        filetypes = { "c", "cpp", "objc", "objcpp" },
                    }),

                    -- JavaScript, TypeScript, JSX, etc.
                    formatting.prettier.with({
                        filetypes = {
                            -- "javascript",
                            "javascriptreact",
                            "typescript",
                            "typescriptreact",
                            "json",
                            "yaml",
                            "html",
                            "css",
                            "scss",
                            "markdown",
                        },
                        cli_options = {
                            config_precedence = "prefer-file",
                        },
                        -- extra_args = { "--single-quote", "--jsx-single-quote" },
                    }),

                    -- Bash
                    formatting.shfmt,

                    -- Lua
                    formatting.stylua,
                },

                -- Desactiva el formateo si ya lo provee el LSP
                on_attach = function(client, _)
                    if client.name == "tsserver" or client.name == "pyright" then
                        client.server_capabilities.documentFormattingProvider = false
                    end
                end,
            })

            -- Asegura que mason instale los formateadores
            mason_null_ls.setup({
                ensure_installed = {
                    "black",
                    "gofmt",
                    "clang_format",
                    "prettier",
                    "shfmt",
                    "stylua",
                },
                automatic_installation = true,
            })
        end,
    },
}
