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

nnoremap("<leader>xx", "<cmd>:TroubleToggle<CR>")
nnoremap("<leader>xw", "<cmd>:TroubleToggle workspace_diagnostics<CR>")
nnoremap("<leader>xd", "<cmd>:TroubleToggle document_diagnostics<CR>")
nnoremap("<leader>xq", "<cmd>:TroubleToggle quickfix<CR>")
nnoremap("<leader>xl", "<cmd>:TroubleToggle loclist<CR>")
nnoremap("gR", "<cmd>:TroubleToggle lsp_references<CR>")
