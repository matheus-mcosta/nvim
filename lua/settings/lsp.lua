local nnoremap = require("settings.keymap").nnoremap
require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
}
nnoremap("<leader>ci", vim.lsp.buf.hover)
nnoremap("<leader>cr", vim.lsp.buf.rename)
nnoremap("<leader>ca", vim.lsp.buf.code_action)
nnoremap("<leader>gd", vim.lsp.buf.definition)
nnoremap("<leader>gD", vim.lsp.buf.declaration)
nnoremap("<leader>gi", vim.lsp.buf.implementation)
nnoremap("<leader>gr", require("telescope.builtin").lsp_references)

nnoremap("<leader>cf", function()
    vim.lsp.buf.format({ async = true })
end)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

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
require("mason-null-ls").setup({
    ensure_installed = { "stylua", "jq" }
})
