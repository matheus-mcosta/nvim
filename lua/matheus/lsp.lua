local nnoremap = require("matheus.keymap").nnoremap
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "pyright",
        "gopls",
        "clangd",
        "rust_analyzer",
        "tsserver",
        "eslint",
        "html",
        "cssls",
        "tailwindcss",
    },
    automatic_installation = true,
})

-- Mappings
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


-- Automatic lsp setup

require("mason-lspconfig").setup_handlers({
    function(server)
        require("lspconfig")[server].setup({ on_attach = on_attach, capabilities = capabilities })
    end,
})


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
