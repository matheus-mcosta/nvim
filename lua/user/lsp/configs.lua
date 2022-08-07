local lspconfig = require("lspconfig")

local servers = { "sumneko_lua", "rust_analyser", "tsserver", "pyright", "jdtls" }

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
		},
	},
})
require("mason-lspconfig").setup({
	ensure_installed = { "sumneko_lua", "rust_analyser", "tsserver", "pyright", "jdtls" },
})
for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end
