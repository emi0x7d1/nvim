return require("lazy").setup({
	"wbthomason/packer.nvim",
	"mhinz/vim-startify",
	{
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	},
	"nvim-telescope/telescope-fzy-native.nvim",
	"williamboman/mason.nvim",
	"emi2k01/nord.nvim",
	"https://gitlab.com/yorickpeterse/nvim-window.git",
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({
				highlight = {
					before = "", -- "fg" or "bg" or empty
					keyword = "bg", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
					after = "fg", -- "fg" or "bg" or empty
					pattern = [[.*<(KEYWORDS)(\([^\)]*\))?:]],
					comments_only = true, -- uses treesitter to match keywords in comments only
					max_line_len = 400, -- ignore lines longer than this
					exclude = {}, -- list of file types to exclude highlighting
				},
				search = {
					command = "rg",
					args = {
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
					},
					pattern = [[\b(KEYWORDS)(\([^\)]*\))?:]],
				},
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
	},
	{
		"stevearc/aerial.nvim",
		requires = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("aerial").setup({})
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"rust",
					"typescript",
					"javascript",
					"tsx",
					"html",
					"markdown",
					"markdown_inline",
					"prisma",
				},
				highlight = {
					enable = true,
					disable = function(lang, bufnr)
						return vim.api.nvim_buf_line_count(bufnr) > 5000
					end,
				},
				indent = {
					enable = true,
				},
				autotag = {
					enable = true,
					filetypes = { "html", "typescriptreact", "javascriptreact", "htmldjango" },
				},
				playground = {
					enable = true,
				},
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
				textsubjects = {
					enable = true,
					prev_selection = ",", -- (Optional) keymap to select the previous selection
					keymaps = {
						["<CR>"] = "textsubjects-smart",
						[";"] = "textsubjects-container-outer",
						["i;"] = "textsubjects-container-inner",
					},
				},
			})
		end,
	},
	"nvim-telescope/telescope-file-browser.nvim",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"onsails/lspkind.nvim",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({
				lightbulb = {
					enable = false,
				},
				symbol_in_winbar = {
					separator = "  ",
				},
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
			})
		end,
	},

	"kylechui/nvim-surround",

	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	{
		"NMAC427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	},

	"ziglang/zig.vim",

	"anuvyklack/hydra.nvim",
	"echasnovski/mini.nvim",
	"numToStr/Comment.nvim",
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	"savq/melange",
	"Mofiqul/vscode.nvim",
	"sindrets/diffview.nvim",
	"arkav/lualine-lsp-progress",
	"nvim-telescope/telescope-ui-select.nvim",
	"simrat39/rust-tools.nvim",
	"nvim-treesitter/nvim-treesitter",
	"nvim-treesitter/nvim-treesitter-context",
	"windwp/nvim-autopairs",
	"sindrets/winshift.nvim",
	"peitalin/vim-jsx-typescript",
	{
		"nvim-neorg/neorg",
		config = function()
			require("neorg").setup({})
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({})
			vim.keymap.set("n", ",td", "<cmd>TroubleToggle document_diagnostics<CR>", { silent = true, noremap = true })
			vim.keymap.set(
				"n",
				",tw",
				"<cmd>TroubleToggle workspace_diagnostics<CR>",
				{ silent = true, noremap = true }
			)
		end,
	},
	"nvim-treesitter/playground",
	"emi2k01/material.nvim",
	"b0o/schemastore.nvim",
	{
		"folke/noice.nvim",
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup({
				input = {
					insert_only = false,
				},
			})
		end,
	},
	{
		"nanozuki/tabby.nvim",
	},
	"sam4llis/nvim-tundra",
	"mattn/emmet-vim",
	"JoosepAlviste/nvim-ts-context-commentstring",
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	},
	"tamago324/nlsp-settings.nvim",
	"sigmaSd/deno-nvim",
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = true,
				on_colors = function(colors)
					colors.bg = "#1a1b26"
					colors.bg_dark = "#191a24"
					colors.bg_float = colors.bg_dark
					colors.bg_popup = colors.bg_dark
					colors.bg_sidebar = colors.bg_dark
					colors.bg_highlight = "#0e1017"
				end,
			})
		end,
	},
	{
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup({})
		end,
	},
	{ "tpope/vim-fugitive" },
	{
		"jose-elias-alvarez/typescript.nvim",
	},
	"anuvyklack/middleclass",
	"anuvyklack/animation.nvim",
	{
		"anuvyklack/windows.nvim",
		config = function()
			vim.o.equalalways = false
			vim.keymap.set("n", "<C-w>z", "<cmd>WindowsMaximize<CR>")
			vim.keymap.set("n", "<C-w>_", "<cmd>WindowsMaximizeVertically<CR>")
			vim.keymap.set("n", "<C-w>|", "<cmd>WindowsMaximizeHorizontally<CR>")
			vim.keymap.set("n", "<C-w>=", "<cmd>WindowsEqualize<CR>")
			require("windows").setup({
				autowidth = {
					winwidth = 60,
				},
				animation = {
					duration = 100,
				},
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			-- require("lsp_lines").setup({
			-- 	virtual_lines = false
			-- })
		end,
	},
	{
		"nvim-pack/nvim-spectre",
		config = function()
			local spectre = require("spectre")
			vim.keymap.set("n", "<leader>rr", spectre.open, { noremap = true })
			vim.keymap.set("v", "<leader>rr", spectre.open_visual, { noremap = true })
			vim.keymap.set("v", "<leader>rw", function()
				spectre.open_visual({ select_word = true })
			end, { noremap = true })
			vim.keymap.set("n", "<leader>rf", spectre.open_file_search, { noremap = true })
		end,
	},
	{
		"ruifm/gitlinker.nvim",
		config = function()
			require("gitlinker").setup()
			vim.keymap.set("n", "<leader>gb", function()
				require("gitlinker").get_buf_range_url(
					"n",
					{ action_callback = require("gitlinker.actions").open_in_browser }
				)
			end, { silent = true })
			vim.keymap.set("v", "<leader>gb", function()
				require("gitlinker").get_buf_range_url(
					"v",
					{ action_callback = require("gitlinker.actions").open_in_browser }
				)
			end, { silent = true })
		end,
	},
	{
		"pwntester/octo.nvim",
		config = function()
			require("octo").setup()
		end,
	},
	{ "RRethy/nvim-treesitter-textsubjects" },
	{
		"chrisgrieser/nvim-various-textobjs",
		config = function()
			require("various-textobjs").setup({ useDefaultKeymaps = true })
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("neogen").setup({})
			vim.keymap.set("n", "<leader>gdf", require("neogen").generate, { noremap = true })
		end,
		-- Uncomment next line if you want to follow only stable versions
		-- version = "*"
	},
	"SmiteshP/nvim-navic",
	"MunifTanjim/nui.nvim",
	{
		"SmiteshP/nvim-navbuddy",
		dependencies = {
			"neovim/nvim-lspconfig",
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("nvim-navbuddy").setup({
				lsp = {
					auto_attach = true,
				},
			})
		end,
	},
	"ibhagwan/fzf-lua",
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = true, auto_trigger = true },
				panel = { enabled = true },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
	{
		"toppair/reach.nvim",
		config = function()
			require("reach").setup({})
		end,
	},
	{
		"neoclide/coc.nvim",
		branch = "release",
	},
	{
		"junegunn/fzf"
	},
	{
		"junegunn/fzf.vim"
	},
	{
		"antoinemadec/coc-fzf",
		branch = "release"
	}
})
