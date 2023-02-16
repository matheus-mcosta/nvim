local nnoremap = require("matheus.keymap").nnoremap
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		-- "sumneko_lua",
		"jedi_language_server",
		"gopls",
		"clangd",
		"rust_analyzer",
		"tsserver",
		"eslint",
		"html",
		"cssls",
		"tailwindcss",
	},
})

local on_attach = function()
	nnoremap("T", vim.lsp.buf.hover, { buffer = 0 })
	nnoremap("<leader>lr", vim.lsp.buf.rename)
	nnoremap("<leader>la", vim.lsp.buf.code_action)
	nnoremap("<leader>gd", vim.lsp.buf.definition)
	nnoremap("<leader>gi", vim.lsp.buf.implementation)
	nnoremap("<leader>gr", require("telescope.builtin").lsp_references)
	nnoremap("<leader>lf", function()
		vim.lsp.buf.format({ async = true })
	end)
end

nnoremap("<leader>lf", function()
	vim.lsp.buf.format({ async = true })
end)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- require("lspconfig").sumneko_lua.setup({ on_attach = on_attach })
require("lspconfig").jedi_language_server.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").pyright.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").gopls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").clangd.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").rust_analyzer.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").tsserver.setup({ on_attach = on_attach, capabilities = capabilities })
-- require("lspconfig/quick_lint_js").setup({ on_attach = on_attach })
require("lspconfig").tailwindcss.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").html.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").cssls.setup({ on_attach = on_attach, capabilities = capabilities })

local null_ls = require("null-ls")
require("null-ls").setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.autopep8,
		null_ls.builtins.formatting.sql_formatter,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.code_actions.eslint,
	},
	on_attach = on_attach,
})

require("nvim-treesitter.configs").setup({
	highlight = { enable = true },
	auto_install = true,
	-- ...
	-- ...
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
})
