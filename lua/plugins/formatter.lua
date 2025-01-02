return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "williamboman/mason.nvim",
      "jay-babu/mason-null-ls.nvim", -- Conexión de mason con null-ls
    },
    config = function()
      local null_ls = require("null-ls")
      local mason_null_ls = require("mason-null-ls")

      -- Configurar null-ls con formatters y linters
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.black,     -- Usa black para Python
          null_ls.builtins.formatting.clang_format, -- Formateador para C y C++
          null_ls.builtins.formatting.prettier,
        },
      })


      -- Asegurarse de que mason instale los linters y formatters automáticamente
      mason_null_ls.setup({
        ensure_installed = {
          "black",       -- Formateador para Python
          "clang_format", -- Formateador para C y C++
          "prettier",  
      },
        automatic_installation = true, -- Instala automáticamente si no está instalado
      })
    end
  },

}

