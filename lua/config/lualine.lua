require("lualine").setup({
	sections = {
		lualine_c = {
			"filename",
			"lsp_progress",
		},
	},
	tabline = {
		lualine_a = { { "tabs", mode = 2, max_length = 1000 } },
	},
})
