require("mason").setup()
local pickers = require("telescope.builtin")

local M = {}

function map(mode, key, action, opts)
	vim.keymap.set(mode, key, action, opts or { silent = true })
end

function _G.check_back_space()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
map("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
map("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

map(
	"i",
	"<c-cr>",
	[[coc#pum#visible() ? coc#pum#confirm() : "\<c-cr>"]],
	{ silent = true, expr = true, noremap = true, replace_keycodes = true }
)
map("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })
map("n", "[g", "<Plug>(coc-diagnostics-prev)", { silent = true })
map("n", "]g", "<Plug>(coc-diagnostics-next)", { silent = true })
map("n", "gD", "<Plug>(coc-type-definition)")
map("n", "gd", "<Plug>(coc-definition)")
map("n", "K", "<cmd>call CocActionAsync('doHover')<cr>")
map("n", "gi", "<Plug>(coc-implementation)")
map("n", ",rn", "<Plug>(coc-rename)")
map("n", ",ca", "<Plug>(coc-codeaction-cursor)")
map("n", "gr", "<Plug>(coc-references)")
map("n", ",f", "<cmd>call CocActionAsync('format')<CR>")
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
	group = "CocGroup",
	command = "silent call CocActionAsync('highlight')",
	desc = "Highlight symbol under cursor on CursorHold",
})
map("n", ",o", ":<C-u>CocFzfList outline<cr>", { silent = true, nowait = true })
map("n", ",d", ":<C-u>CocFzfList diagnostics<cr>", { silent = true, nowait = true })

vim.api.nvim_exec([[
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ "\<TAB>"

let g:coc_snippet_next = '<tab>'

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
]], false)

return M
