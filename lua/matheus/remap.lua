local nnoremap = require("matheus.keymap").nnoremap
local inoremap = require("matheus.keymap").inoremap

nnoremap("<leader>pv","<cmd>:NvimTreeToggle<CR>")
nnoremap("<leader>w","<cmd>:w<CR>")
nnoremap("<leader>ff","<cmd>lua require('telescope.builtin').find_files()<CR>")
nnoremap("<leader>fg","<cmd>lua require('telescope.builtin').live_grep()<CR>")
nnoremap("<leader>fb","<cmd>lua require('telescope.builtin').buffers()<CR>")
nnoremap("<leader>h","<cmd>:nohlsearch<CR>")
nnoremap("<leader>c","<cmd>:bdelete<CR>")


nnoremap("L", ":bnext<CR>")
nnoremap("H", ":bprevious<CR>")


inoremap("jk","<ESC>")

