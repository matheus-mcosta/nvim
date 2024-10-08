local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "nvim-lua/plenary.nvim",
    { "Yazeed1s/oh-lucy.nvim" },
    -- { dir="~/tests/oh-lucy.nvim/", name="oh-lucy-dev" },
    { "lervag/vimtex" },
    { "APZelos/blamer.nvim" },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",     -- Optional image support in preview window: See `# Preview Mode` for more information
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        -- or                              , branch = '0.1.x',
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
    { "akinsho/bufferline.nvim",                dependencies = "nvim-tree/nvim-web-devicons" },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    { "nvim-treesitter/nvim-treesitter-context" },

    -- LSP
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvimtools/none-ls-extras.nvim",
            "gbprod/none-ls-shellcheck.nvim",
        },
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
    },

    -- CMP
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    -- Copilot
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({})
        end,
        "zbirenbaum/copilot-cmp",
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end,
    },
})
