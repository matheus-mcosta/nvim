local nnoremap = require("settings.keymap").nnoremap
local inoremap = require("settings.keymap").inoremap
local builtin = require("telescope.builtin")

nnoremap("<leader>pv", "<cmd>:Neotree toggle filesystem reveal right<CR>")
nnoremap("<leader>w", "<cmd>:w<CR>")
nnoremap("<leader>ff", builtin.find_files)
nnoremap("<leader>fg", builtin.live_grep)
nnoremap("<leader>fb", builtin.buffers)
nnoremap("<leader>fh", builtin.help_tags)

nnoremap("<leader>h", "<cmd>:nohlsearch<CR>")
nnoremap("<leader>bd", "<cmd>:bdelete<CR>")

nnoremap("L", ":bnext<CR>")
nnoremap("H", ":bprevious<CR>")

nnoremap("<leader>lr", "<cmd>:LspRestart<CR>")

inoremap("jk", "<ESC>")

nnoremap("<leader>xx", "<cmd>:Trouble<CR>")
nnoremap("<leader>xw", "<cmd>:Trouble workspace_diagnostics<CR>")
nnoremap("<leader>xd", "<cmd>:Trouble diagnostics<CR>")
nnoremap("<leader>xq", "<cmd>:Trouble quickfix<CR>")
nnoremap("<leader>xl", "<cmd>:Trouble loclist<CR>")
nnoremap("gR", "<cmd>:Trouble lsp_references<CR>")
