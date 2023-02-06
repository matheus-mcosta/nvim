local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local lspkind = require("lspkind")
local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip").filetype_extend("javascript", { "javascriptreact" })
require("luasnip").filetype_extend("javascript", { "html" })
local source_mapping = {
	cmp_tabnine = "[TN]",
	nvim_lsp = "[LSP]",
	buffer = "[Buffer]",
	lua_snip = "[Snippet]",
	path = "[Path]",
}
require("cmp_tabnine.config").setup({
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = "..",
	ignored_file_types = {
		-- default is not to ignore
		-- uncomment to ignore in lua:
		-- lua = true
	},
	show_prediction_strength = false,
})
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	-- completion = {
	--   autocomplete = false
	-- },
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<Enter>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<C-n>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),

		["<C-p>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = {
		{ name = "cmp_tabnine" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text", -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(entry, vim_item)
				-- if you have lspkind installed, you can use it like
				-- in the following line:
				vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
				vim_item.menu = source_mapping[entry.source.name]
				if entry.source.name == "cmp_tabnine" then
					local detail = (entry.completion_item.data or {}).detail
					vim_item.kind = ""
					if detail and detail:find(".*%%.*") then
						vim_item.kind = vim_item.kind .. " " .. detail
					end

					if (entry.completion_item.data or {}).multiline then
						vim_item.kind = vim_item.kind .. " " .. "[ML]"
					end
				end
				local maxwidth = 80
				vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
				return vim_item
			end,
		}),
	},
})
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()) --nvim-cmp
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end
