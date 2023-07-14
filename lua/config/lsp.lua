require("mason").setup()
local nlspsettings = require("nlspsettings")
nlspsettings.setup({})
local cmp_lsp = require("cmp_nvim_lsp")
local pickers = require("telescope.builtin")

local M = {}

local lspconfig = require("lspconfig")

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "rust_analyzer", "tsserver", "eslint", "tailwindcss", "prismals" },
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", ",e", "<cmd>Lspsaga show_line_diagnostics ++unfocus<CR>", opts)
vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", ",q", vim.diagnostic.setloclist, opts)

vim.diagnostic.config({
	virtual_text = false,
	underline = false,
})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
	-- if client.supports_method("textDocument/formatting") then
	-- 	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	-- 	vim.api.nvim_create_autocmd("BufWritePre", {
	-- 		group = augroup,
	-- 		buffer = bufnr,
	-- 		callback = function()
	-- 			vim.lsp.buf.format()
	-- 		end,
	-- 	})
	-- end
	-- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "fn", require("nvim-navbuddy").open, bufopts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", pickers.lsp_definitions, bufopts)
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", bufopts)
	vim.keymap.set("n", "gi", pickers.lsp_implementations, bufopts)
	vim.keymap.set("n", "<C-k>", "<cmd>Lspsaga signature_help<CR>", bufopts)
	vim.keymap.set("n", "<space>D", pickers.lsp_type_definitions, bufopts)
	vim.keymap.set("n", ",rn", "<cmd>Lspsaga rename<CR>", bufopts)
	vim.keymap.set("n", ",ca", "<cmd>Lspsaga code_action<CR>", bufopts)
	vim.keymap.set("n", "gr", pickers.lsp_references, bufopts)
	vim.keymap.set("n", ",f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
	vim.keymap.set("n", ",ha", require("rust-tools").hover_actions.hover_actions, bufopts)
end

local capabilities = cmp_lsp.default_capabilities()
capabilities = vim.tbl_extend("force", capabilities, {
	workspace = {
		didChangeWatchedFiles = {
			dynamicRegistration = true,
		},
	},
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
	end,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

require("rust-tools").setup({
	server = {
		capabilities = capabilities,
		on_attach = function(client, bufnr)
			on_attach(client, bufnr)
		end,
		settings = {
			["rust-analyzer"] = {
				rustfmt = {
					extraArgs = { "+nightly" },
				},
				checkOnSave = {
					enable = true,
				},
				diagnostics = {
					experimental = {
						enable = true,
					},
				},
			},
		},
	},
})

require("typescript").setup({
	root_dir = require("lspconfig.util").root_pattern(".git"),
	server = {
		single_file_support = false,
		capabilities = capabilities,
		on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false
			on_attach(client, bufnr)
		end,
	},
})

require("deno-nvim").setup({
	server = {
		capabilities = capabilities,
		on_attach = function(client, bufnr)
			on_attach(client, bufnr)
		end,
		root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc"),
	},
})

lspconfig.graphql.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		client.server_capabilities.hoverProvider = false
		on_attach(client, bufnr)
	end,
})

lspconfig.eslint.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.hoverProvider = false
		on_attach(client, bufnr)
	end,
})

lspconfig.zls.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
	end,
})

lspconfig.svelte.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		on_attach(client, bufnr)
	end,
})

lspconfig.marksman.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
	end,
})

lspconfig.tailwindcss.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
	end,
	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = {
					{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
				},
			},
		},
	},
})

lspconfig.jsonls.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
	end,
	filetypes = { "json", "jsonc" },
	settings = {
		json = {
			-- Schemas https://www.schemastore.org
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})

lspconfig.prismals.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
	end,
})

M.on_attach = on_attach

return M
