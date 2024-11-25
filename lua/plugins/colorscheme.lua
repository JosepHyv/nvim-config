return {
	{
		"sainnhe/sonokai",
		priority = 1000,
		config = function()
			vim.g.sonokai_transparent_background = "1"
			vim.g.sonokai_enable_italic = "1"
			vim.g.sonokai_style = "andromeda"
			vim.cmd.colorscheme("sonokai")
            vim.cmd[[highlight Comment gui=bold ctermbg=10 guifg=LightGreen]]
            vim.cmd[[highlight StatusLine guibg=NONE gui=bold]]
        end,
	},
}
