-- =========================
-- Mason
-- =========================
vim.env.PATH = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/bin/") .. ":" .. vim.env.PATH

require("mason").setup({ ui = { border = "rounded" } })
require("mason-lspconfig").setup({ automatic_installation = true, automatic_enable = true })

-- =========================
-- LSP
-- =========================
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Lua
vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    root_markers = { ".git", ".luarc.json" },
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        },
    },
})

-- Python (Ruff)
vim.lsp.config("ruff", {
    capabilities = capabilities,
    root_markers = { "pyproject.toml", "setup.py", ".git" },
})

-- Bash
vim.lsp.config("bashls", {
    capabilities = capabilities,
    root_markers = { ".git" },
})

-- C/C++ (clangd)
vim.lsp.config("clangd", {
    cmd = { "clangd", "--background-index", "--clang-tidy" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    root_markers = {
        "compile_commands.json",
        "compile_flags.txt",
        ".clang-format",
        ".git",
    },
    capabilities = capabilities,
})

vim.lsp.enable({ "lua_ls", "ruff", "bashls", "clangd" })

-- =========================
-- Diagnostics
-- =========================
vim.diagnostic.config({
    virtual_text = {
        spacing = 4,
        prefix = "●",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "if_many",
        header = "",
        prefix = "",
    },
})

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[SNIP]",
                buffer = "[BUF]",
                path = "[PATH]",
            })[entry.source.name]
            return vim_item
        end,
    },

    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),

        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),

    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }),
})


-- Show diagnostics on hover

vim.opt.updatetime = 300
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, { focus = false })
    end,
})
