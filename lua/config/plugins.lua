return require("lazy").setup({
	"wbthomason/packer.nvim",
	"mhinz/vim-startify",
	{
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	},
	"nvim-telescope/telescope-fzy-native.nvim",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"emi2k01/nord.nvim",
	"https://gitlab.com/yorickpeterse/nvim-window.git",
	"jose-elias-alvarez/null-ls.nvim",
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
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			vim.cmd([[autocmd FileType norg setlocal fo+=t tw=85]])
			require("neorg").setup({
				load = {
					["core.defaults"] = {
						config = {
							-- disable = {
							-- 	"core.esupports.hop",
							-- },
						},
					},
					-- ["core.keybinds"] = {
					-- 	config = {
					-- 		default_keybinds = false,
					-- 	},
					-- },
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "~/notes",
							},
						},
					},
				},
			})
		end,
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
			vim.o.winwidth = 80
			vim.o.winwidth = 20
			vim.o.equalalways = false
			require("windows").setup({
				animation = {
					duration = 120,
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
			require("spectre").setup({
				highlight = {
					ui = "String",
					search = "DiffDelete",
					replace = "DiffAdd",
				},
				find_engine = {
					["rg"] = {
						cmd = "rg",
						-- default args
						args = {
							"--color=never",
							"--no-heading",
							"--with-filename",
							"--line-number",
							"--column",
							"--pcre2",
						},
					},
				},
			})
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
				require("gitlinker").get_buf_range_url("n")
			end, { silent = true })
			vim.keymap.set("v", "<leader>gb", function()
				require("gitlinker").get_buf_range_url("v")
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
	"pmizio/typescript-tools.nvim",
	{
		"toppair/reach.nvim",
		config = function()
			require("reach").setup({})
		end,
	},
	"kylechui/nvim-surround",
	{
		"Wansmer/treesj",
		config = function(opts)
			require("treesj").setup(opts)
			vim.keymap.set("n", "<leader>zj", require("treesj").join)
			vim.keymap.set("n", "<leader>zs", require("treesj").split)
			vim.keymap.set("n", "<leader>zt", require("treesj").toggle)
		end,
		opts = {
			use_default_keymaps = false,
		},
	},
	{
		"axkirillov/hbac.nvim",
		config = true,
		opts = {
			threshold = 8,
		},
	},
	{
		"stevearc/oil.nvim",
		config = function()
			vim.keymap.set("n", "<leader>mt", "<cmd>Oil %:h<CR>", { silent = true })
			vim.keymap.set("n", "<leader>mT", function()
				require("oil").open(vim.fn.getcwd())
			end, { silent = true })
			require("oil").setup({
				keymaps = {
					["<leader>sx"] = "actions.select_split",
					["<leader>sv"] = "actions.select_vsplit",
				},
			})
		end,
	},
	{
		"jbyuki/venn.nvim",
		config = function()
			function _G.Toggle_venn()
				local venn_enabled = vim.inspect(vim.b.venn_enabled)
				if venn_enabled == "nil" then
					vim.b.venn_enabled = true
					vim.cmd([[setlocal ve=all]])
					-- draw a line on HJKL keystokes
					vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
					vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
					vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
					vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
					-- draw a box by pressing "f" with visual selection
					vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true })
				else
					vim.cmd([[setlocal ve=]])
					vim.cmd([[mapclear <buffer>]])
					vim.b.venn_enabled = nil
				end
			end

			-- toggle keymappings for venn using <leader>v
			vim.api.nvim_set_keymap("n", "<leader>v", ":lua Toggle_venn()<CR>", { noremap = true, silent = true })
		end,
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-telescope/telescope.nvim", -- optional
			"sindrets/diffview.nvim", -- optional
		},
		config = true,
	},
	{
		"MaximilianLloyd/tw-values.nvim",
		keys = {
			{ "<leader>K", "<cmd>TWValues<cr>", desc = "Show tailwind CSS values" },
		},
		opts = {
			border = "rounded", -- Valid window border style,
			show_unknown_classes = true, -- Shows the unknown classes popup
		},
	},
	{
		"jcdickinson/codeium.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({})
		end,
	},
	{
		"rktjmp/lush.nvim",
	},
	{
		"mcchrish/zenbones.nvim",
		dependencies = {
			"rktjmp/lush.nvim",
		},
		config = function()
			vim.g.zenbones = { transparent_background = true }
			vim.g.nordbones = { transparent_background = true }
		end,
	},
	{
		"Bryley/neoai.nvim",
		config = true,
	},
	{
		"gbrlsnchs/winpick.nvim",
		config = true,
	},
	{
		"gbprod/substitute.nvim",
		config = function()
			require("substitute").setup({})
			vim.keymap.set("n", "<leader>s", require("substitute.range").operator, { noremap = true })
			vim.keymap.set("x", "<leader>s", require("substitute.range").visual, { noremap = true })
			vim.keymap.set("n", "<leader>ss", require("substitute.range").word, { noremap = true })

			vim.keymap.set("n", "s", require("substitute").operator, { noremap = true })
			vim.keymap.set("n", "ss", require("substitute").line, { noremap = true })
			vim.keymap.set("n", "S", require("substitute").eol, { noremap = true })
			vim.keymap.set("x", "s", require("substitute").visual, { noremap = true })

			vim.keymap.set("n", "Cx", require("substitute.exchange").operator, { noremap = true })
			vim.keymap.set("n", "Cxx", require("substitute.exchange").line, { noremap = true })
			vim.keymap.set("x", "Cx", require("substitute.exchange").visual, { noremap = true })
		end,
	},
	{
		"tpope/vim-abolish",
	},
	{
		"smjonas/live-command.nvim",
		config = function()
			require("live-command").setup({
				commands = {
					S = { cmd = "Subvert" },
				},
			})
		end,
	},
})
