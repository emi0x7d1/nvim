require("config.options")
require("config.plugins")
require("config.colorscheme")
require("config.lsp")
require("config.telescope")
require("config.nvim-window")
require("config.null-ls")
require("config.todo-comments")
require("config.symbols-outline")
require("config.tree")
require("config.completion")
require("config.git")
require("config.mini")
require("config.hop")
require("config.lualine")
require("config.comment")
require("config.hydras")
require("config.session")
require("config.treesitter")
require("config.surround")
require("config.autopairs")
require("config.winshift")

vim.api.nvim_create_user_command("LoadSetup", function()
    loadfile("./.local/emi2k01/nvim_setup.lua")()
end, {})
