return {
  {
    "nvimtools/none-ls.nvim", -- ¡Usamos el fork compatible!
    dependencies = {
      "nvim-lua/plenary.nvim",
      "williamboman/mason.nvim",
      "jay-babu/mason-null-ls.nvim", -- Conexión de mason con none-ls
    },
    config = function()
      local null_ls = require("null-ls") -- el nombre del módulo sigue siendo "null-ls" por compatibilidad
      local mason_null_ls = require("mason-null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.black,         -- Python
          null_ls.builtins.formatting.clang_format,  -- C/C++
          null_ls.builtins.formatting.prettier,      -- JS/TS/etc
        },
      })

      mason_null_ls.setup({
        ensure_installed = {
          "black",
          "clang_format",
          "prettier",
        },
        automatic_installation = true,
      })
    end,
  },
}

