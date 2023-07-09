local Hydra = require("hydra")

Hydra({
	name = "Increment split size",
	mode = "n",
	body = "<C-w>",
	heads = {
		{ ">", "2<C-w>>" },
		{ "<", "2<C-w><" },
		{ "-", "2<C-w>-" },
		{ "+", "2<C-w>+" },
	},
})
