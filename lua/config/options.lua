local util = require("util")

vim.cmd("let mapleader = ' '")

vim.keymap.set("i", "<CR>", "<CR>x<BS>", { silent = true })
util.map("n", "<leader>tn", "<cmd>tabnew<CR>")
util.map("n", "<leader>tc", "<cmd>tabclose<CR>")
util.map("n", "<leader>l", "<cmd>tabnext<CR>")
util.map("n", "<leader>h", "<cmd>tabprev<CR>")
util.map("n", "<leader><S-l>", "<cmd>tabmove +1<CR>")
util.map("n", "<leader><S-h>", "<cmd>tabmove -1<CR>")
util.map("n", "<leader><esc>", "<cmd>nohlsearch<CR>")

for i = 1, 9 do
    util.map("n", "<leader>" .. i, "<cmd>tabnext " .. i .. "<CR>")
end

vim.g.mapleader = " "

vim.o.conceallevel = 2
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.termguicolors = true
vim.o.hidden = true
vim.o.updatetime = 16
vim.o.inccommand = "split"
vim.o.listchars = "tab:» ,extends:›,precedes:‹,nbsp:·,trail:·"
vim.o.completeopt = "menuone,noselect"
vim.o.pumheight = 20
vim.o.cmdheight = 1
vim.o.hidden = true
vim.o.scrolloff = 5
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.gdefault = true
vim.o.undofile = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.formatoptions = "qnljb"
vim.o.foldlevelstart = 99
vim.o.mouse = ""

vim.bo.undofile = vim.o.undofile
vim.bo.expandtab = vim.o.expandtab
vim.bo.shiftwidth = vim.o.shiftwidth
vim.bo.tabstop = vim.o.tabstop
vim.bo.formatoptions = vim.o.formatoptions

vim.wo.signcolumn = "yes"
vim.wo.foldmethod = "indent"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.number = true
vim.wo.list = true
vim.wo.listchars = vim.o.listchars
vim.wo.wrap = false
vim.wo.relativenumber = true
vim.wo.colorcolumn = "110"

vim.cmd("hi Normal guibg=NONE")
vim.cmd("hi SignColumn guibg=NONE guifg=NONE")
vim.cmd("hi LineNr guibg=NONE guifg=NONE")
vim.cmd("hi WindowSwitch guibg='#434343' guifg='#EEEEEE'")

-- vim.cmd("filetype indent off")
-- vim.cmd("au FileType * setlocal nosmartindent")
vim.cmd(
"au FileType typescriptreact,javascriptreact,javascript,typescript,svelte setlocal shiftwidth=2 | setlocal formatoptions-=cro")

vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = {
        only_current_line = true,
    }
})

vim.keymap.set("i", "<CR>", "<CR>x<BS>", { silent = true })
vim.keymap.set("n", "o", "ox<BS>", { silent = true })
vim.keymap.set("n", "O", "Ox<BS>", { silent = true })

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent = true })
vim.keymap.set('v', '$', 'g_', { noremap = true })
