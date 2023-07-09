local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	completion = {
		completeopt = "menuone,noinsert,noselect",
		keyword_length = 1,
		autocomplete = {
			cmp.TriggerEvent.InsertEnter,
			cmp.TriggerEvent.TextChanged,
		},
	},
	window = {
		completion = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			scrollbar = "║",
		},
	},
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-CR>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })
			elseif luasnip.expandable() then
				luasnip.expand()
			else
				fallback()
			end
		end),
	}),
	experimental = { ghost_text = true },
	sources = {
		{ name = "copilot" },
		-- { name = "codeium" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "nvim_lsp_signature_help" },
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol",
			maxWidth = 50,
			-- symbol_map = { Codeium = "" },
			symbol_map = { Copilot = "" },
		}),
	},
	sorting = {
		comparators = {
			cmp.config.compare.recently_used,
			cmp.config.compare.offset,
			cmp.config.compare.score,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
})

luasnip.config.setup({
	update_events = { "InsertLeave", "TextChanged", "TextChangedI" },
	region_check_events = { "InsertLeave", "CursorMoved" },
	delete_check_events = { "TextChanged", "InsertLeave" },
	enable_autosnippets = true
})

vim.keymap.set({ "s", "i" }, "<M-j>", function()
	if luasnip.jumpable(1) then
		local is_last = false
		if luasnip.jump_destination(1) == nil then
			is_last = true
		end
		luasnip.jump(1)
		if is_last then
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "n", false)
		end
	end
end, {})
vim.keymap.set({ "s", "i" }, "<M-k>", "<cmd>lua require('luasnip').jump(-1)<CR>", {})

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").load({ paths = "./lua/config/snippets" })
