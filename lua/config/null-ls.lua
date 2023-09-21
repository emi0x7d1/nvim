local lsp = require("config/lsp")

require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.prettierd.with({
			filetypes = {
				"html",
				"json",
				"yaml",
				"markdown",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"svelte",
				"graphql",
				"gql",
				"scss",
				"sass",
				"css",
			},
		}),
		-- require("null-ls").builtins.diagnostics.eslint_d,
	},
	on_attach = lsp.on_attach,
})
