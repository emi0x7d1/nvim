local util = require("util")

util.map("n", "<leader>wo", "<cmd>AerialToggle<CR>")
util.map("n", ",[[", "<cmd>AerialPrevUp<CR>")
util.map("n", ",]]", "<cmd>AerialPrevNextUp<CR>")

