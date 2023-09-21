require("mini.bufremove").setup({})
require("mini.indentscope").setup({})
-- require("mini.files").setup({
--   mappings = {
--     close = "<esc>",
--     go_in = "<cr>",
--     go_in_plus = "<c-cr>",
--     go_out = "<c-o>",
--     go_out_plus = "<m-o>",
--   }
-- })
-- vim.keymap.set("n", "<leader>mT", require("mini.files").open)
-- vim.keymap.set("n", "<leader>mt", function() require("mini.files").open(vim.api.nvim_buf_get_name(0)) end)
require("mini.cursorword").setup({
    delay = 0,
})

vim.keymap.set("n", "<leader>wD", require("mini.bufremove").delete)

local map_split = function(buf_id, lhs, direction)
local rhs = function()
  -- Make new window and set it as target
  local new_target_window
  vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
    vim.cmd(direction .. ' split')
    new_target_window = vim.api.nvim_get_current_win()
  end)

  MiniFiles.set_target_window(new_target_window)
end

-- Adding `desc` will result into `show_help` entries
local desc = 'Split ' .. direction
vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
end

vim.api.nvim_create_autocmd('User', {
pattern = 'MiniFilesBufferCreate',
callback = function(args)
  local buf_id = args.data.buf_id
  -- Tweak keys to your liking
  map_split(buf_id, 'gs', 'belowright horizontal')
  map_split(buf_id, 'gv', 'belowright vertical')
end,
})

