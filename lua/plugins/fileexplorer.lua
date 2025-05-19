-- fileexplorer.lua
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nvim_tree = require("nvim-tree")

    nvim_tree.setup({
      update_cwd = true,
      respect_buf_cwd = true,
      hijack_directories = {
        enable = false,
      },
      actions = {
        change_dir = {
          restrict_above_cwd = true,
        },
      },
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
        side = "right", -- 👈 Mueve el árbol a la derecha
      --   mappings = {
      --     custom_only = false,
      --     list = {
      --       { key = "n", action = "create" },            -- Crear archivo
      --       { key = "N", action = "create_folder" },     -- Crear carpeta
      --       { key = "r", action = "rename" },            -- Renombrar
      --       { key = "d", action = "remove" },            -- Eliminar
      --     },
      --   },
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    })
  end,
}

