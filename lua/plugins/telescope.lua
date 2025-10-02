local telescope = {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	tag = "0.1.8",
}

telescope.config = function()
	require("telescope").setup({
		pickers = {
			find_files = {
				hidden = false,
			},
		},
		defaults = {
			file_ignore_patterns = {
				"node_modules",
				"__pycache__",
				"%.git/",
				"%.DS_Store",
				"%.venv/",
				"%.mypy_cache/",
				"%.pytest_cache/",
				"%.idea/",
				"%.vscode/",
			},
		},

		mappings = {
			i = {
				["<Esc>"] = require("telescope.actions").close,
				["<C-q>"] = require("telescope.actions").close,
			},
			n = {
				["<Esc>"] = require("telescope.actions").close,
				["<C-q>"] = require("telescope.actions").close,
			},
		},
	})
end

return telescope
