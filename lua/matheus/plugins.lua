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
	-- colorscheme
	"sainnhe/gruvbox-material",
	"p00f/nvim-ts-rainbow",
	"lukas-reineke/indent-blankline.nvim",
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	"rafamadriz/friendly-snippets",
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		config = function()
			require("nvim-tree").setup()
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.0",
		-- or                            , branch = '0.1.x',
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{ "akinsho/bufferline.nvim", version = "v3.*", dependencies = "nvim-tree/nvim-web-devicons" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	},

	"norcalli/nvim-colorizer.lua",

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	-- LSP
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"jose-elias-alvarez/null-ls.nvim",
	},

	-- CMP
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/nvim-cmp",
	"onsails/lspkind-nvim",
	"nvim-lua/lsp_extensions.nvim",
	"simrat39/symbols-outline.nvim",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
})
