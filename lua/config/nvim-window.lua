vim.keymap.set("n", "-", function()
	local winid = require("winpick").select()
	if winid then
		vim.api.nvim_set_current_win(winid)
	end
end)
vim.keymap.set("n", ",,", "<cmd>lua require('nvim-window').pick()<CR>")
