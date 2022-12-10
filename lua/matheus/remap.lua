local nnoremap = require("matheus.keymap").nnoremap

nnoremap("<leader>pv","<cmd>Ex<CR>")
nnoremap("<leader>w","<cmd>:w<CR>")
nnoremap("<leader>ff","<cmd>lua require('telescope.builtin').find_files()<CR>")
nnoremap("<leader>fg","<cmd>lua require('telescope.builtin').live_grep()<CR>")
nnoremap("<leader>fb","<cmd>lua require('telescope.builtin').buffers()<CR>")
nnoremap("<leader>h","<cmd>:nohlsearch<CR>")
nnoremap("<leader>c","<cmd>:bdelete<CR>")

nnoremap("L", ":bnext<CR>")
nnoremap("H", ":bprevious<CR>")

