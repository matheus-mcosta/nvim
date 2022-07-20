require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.colorscheme")
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.autopairs")
require("user.comment")
require("user.gitsigns")
require("user.nvim-tree")
require("user.bufferline")
require("user.lualine")
require("user.toggleterm")
require("user.project")
require("user.impatient")
require("user.indentline")
require("user.alpha")
require("user.whichkey")
require("user.autocommands")

require("code_runner").setup({
	-- put here the commands by filetype
	filetype = {
		java = "cd $dir && cd .. && javac teste/AplicacaoTestaPosicoes.java posicoes/PosicaoMapa4x4.java  && java teste/$fileNameWithoutExt",
		python = "python3 -u",
		typescript = "bun run",
		rust = "cd $dir && cargo run",
		javascript = "bun run",
	},
})
require("colorizer").setup()
