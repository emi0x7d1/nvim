local telescope = require("telescope")
local action_state = require("telescope.actions.state")
local fb_utils = require("telescope._extensions.file_browser.utils")

local tcd_action = function(prompt_bufnr)
	local current_picker = action_state.get_current_picker(prompt_bufnr)
	local finder = current_picker.finder
	local entry_path = action_state.get_selected_entry().Path
	finder.path = entry_path:is_dir() and entry_path:absolute() or entry_path:parent():absolute()
	finder.cwd = finder.path
	vim.cmd("tcd " .. finder.path)

	fb_utils.redraw_border_title(current_picker)
	current_picker:refresh(finder, { reset_prompt = true, multi = current_picker._multi })
end

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"-L",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		sorting_strategy = "ascending",
		layout_config = {
			horizontal = {
				prompt_position = "top",
			},
		},
		path_display = { "truncate" },
		border = {},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
		file_browser = {
			mappings = {
				["i"] = {
					["<C-t>"] = tcd_action,
				},
				["n"] = {
					["t"] = tcd_action,
				},
			},
		},
	},
})

vim.api.nvim_set_keymap("n", "<space>wt", "<cmd>Telescope file_browser<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>wT", "<cmd>Telescope file_browser path=%:p:h<CR>", { noremap = true })

local tbuiltin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", function()
	tbuiltin.find_files({
		find_command = function()
			return {
				"fd",
				"--hidden",
				"--exclude=.git",
			}
		end,
	})
	-- require('fzf-lua').files()
end)
vim.keymap.set("n", "<leader>FF", function()
	tbuiltin.find_files({
		cwd = vim.fn.expand("%:p:h"),
		find_command = { "fd", "--hidden", "--exclude=.git" },
		hidden = true,
	})
	-- require('fzf-lua').files({ cwd = vim.fn.expand("%:p:h") })
end)
vim.keymap.set("n", "<leader>fF", function()
	tbuiltin.find_files({
		cwd = vim.fn.expand("%:p:h:h"),
		find_command = { "fd", "--hidden", "--exclude=.git" },
		hidden = true,
	})
	-- require('fzf-lua').files({ cwd = vim.fn.expand("%:p:h:h") })
end)
vim.keymap.set("n", "<leader>fb", function()
	tbuiltin.buffers()
	-- require('fzf-lua').buffers()
end)
vim.keymap.set("n", "<leader>fg", function()
	tbuiltin.live_grep()
	-- require('fzf-lua').grep_project()
end)
vim.keymap.set("n", "<leader>fG", function()
	tbuiltin.live_grep({ search_dirs = { "%:p" } })
	-- require('fzf-lua').grep_project({ cwd = vim.fn.expand("%:p") })
end)
vim.keymap.set("n", "<leader>fs", function()
	tbuiltin.lsp_document_symbols()
	-- require('fzf-lua').lsp_document_symbols()
end)
vim.keymap.set("n", "<leader>fd", function()
	tbuiltin.diagnostics({ bufnr = 0 })
	-- require('fzf-lua').diagnostics_document()
end)
vim.keymap.set("n", "<leader>fD", function()
	tbuiltin.diagnostics()
	-- require('fzf-lua').diagnostics_workspace()
end)

telescope.load_extension("ui-select")
telescope.load_extension("file_browser")
telescope.load_extension("fzy_native")
telescope.load_extension("fzf")
