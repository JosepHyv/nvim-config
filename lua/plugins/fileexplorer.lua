-- disable netrw at the very start of your init.lua

-- OR setup with some options
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
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
