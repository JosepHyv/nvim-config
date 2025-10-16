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
		local api = require("nvim-tree.api")

		local function my_on_attach(bufnr)
			-- 🟢 Esto aplica todos los keymaps por defecto de nvim-tree
			api.config.mappings.default_on_attach(bufnr)

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- Tus keymaps personalizados
			vim.keymap.set("n", "n", api.fs.create, opts("Create File or Folder"))
			vim.keymap.set("n", "N", function()
				vim.ui.input({ prompt = "New folder name: " }, function(input)
					if input then
						api.fs.create(input .. "/")
					end
				end)
			end, opts("Create Folder"))
			vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
			vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
		end

		nvim_tree.setup({
			update_cwd = true,
			respect_buf_cwd = true,
			hijack_directories = { enable = false },
			actions = {
				change_dir = { restrict_above_cwd = true },
			},
			sort = { sorter = "case_sensitive" },
			view = {
				width = 30,
				side = "right",
			},
			renderer = { group_empty = true },
			filters = { dotfiles = false, custom = {} },
			on_attach = my_on_attach,
		})
	end,
}
