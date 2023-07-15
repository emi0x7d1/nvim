require("lualine").setup({
	sections = {
		lualine_c = {
			"filename",
			"g:coc_status",
		},
	},
	tabline = {
		lualine_a = { { "tabs", mode = 2 } },
	},
})
