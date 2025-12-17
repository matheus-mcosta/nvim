require("plugins")
require("lsp_cmp")
require("treesitter")

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

local builtin = require("telescope.builtin")

------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.api.nvim_set_keymap('n', '<Space>', '<Nop>', { noremap = true, silent = true })

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smartindent = true

-- Searching
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- UI
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.pumheight = 6
opt.splitbelow = true
opt.splitright = true

-- Behavior
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 400

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ timeout = 500 })
    end,
})

--- Buffers

vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.require('bufferline').tabline()"



-- =========================
-- Keymap Helper
-- =========================
local M = {}

local function bind(op, outer_opts)
    outer_opts = outer_opts or { noremap = true }
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end
M.nmap = bind("n", { noremap = false })
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")


M.nnoremap("<leader>pv", "<cmd>:Neotree toggle filesystem reveal right<CR>")
M.nnoremap("<leader>w", "<cmd>:w<CR>")
M.nnoremap("<leader>ff", builtin.find_files)
M.nnoremap("<leader>fg", builtin.live_grep)
M.nnoremap("<leader>fb", builtin.buffers)
M.nnoremap("<leader>fh", builtin.help_tags)

M.nnoremap("<leader>h", "<cmd>:nohlsearch<CR>")
M.nnoremap("<leader>bd", "<cmd>:bdelete<CR>")

M.nnoremap("L", ":bnext<CR>")
M.nnoremap("H", ":bprevious<CR>")

M.nnoremap("<leader>lr", "<cmd>:LspRestart<CR>")

M.inoremap("jk", "<ESC>")


