local nnoremap = require("matheus.keymap").nnoremap
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua", "jedi_language_server", "gopls" },
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

require("lspconfig").sumneko_lua.setup({ on_attach = on_attach })
require("lspconfig").jedi_language_server.setup({ on_attach = on_attach })
require("lspconfig").gopls.setup({})

local null_ls = require("null-ls")
require("null-ls").setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.autopep8,
        null_ls.builtins.formatting.sql_formatter,
        null_ls.builtins.formatting.prettierd,
    },
})
