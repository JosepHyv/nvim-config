return {
    {
        "williamboman/mason.nvim",
        config = true
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
                ensure_installed = { "ruff_lsp", "clangd" }, -- Asegúrate de instalar estos servidores
            })

            -- Configuración de nvim-lspconfig
            local lspconfig = require("lspconfig")

            -- Configuración de ruff LSP
            lspconfig.ruff.setup{
                init_options = {
                    settings = {
                        args = {},  -- Argumentos adicionales para Ruff
                    },
                },
            }

            -- Configuración de clangd LSP
            lspconfig.clangd.setup{}

        end,
    },
}
