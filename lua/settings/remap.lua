local nnoremap = require("settings.keymap").nnoremap
local inoremap = require("settings.keymap").inoremap
local builtin = require('telescope.builtin')

-- nnoremap("<leader>pv", "<cmd>:NvimTreeToggle<CR>")
nnoremap("<leader>w", "<cmd>:w<CR>")
nnoremap("<leader>ff", builtin.find_files)
nnoremap("<leader>fg", builtin.live_grep)
nnoremap("<leader>fb", builtin.buffers)
nnoremap("<leader>fh", builtin.help_tags)

nnoremap("<leader>h", "<cmd>:nohlsearch<CR>")
nnoremap("<leader>c", "<cmd>:bdelete<CR>")


nnoremap("L", ":bnext<CR>")
nnoremap("H", ":bprevious<CR>")


inoremap("jk", "<ESC>")
