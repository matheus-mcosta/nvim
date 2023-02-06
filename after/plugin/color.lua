vim.opt.background = "dark"
-- require("rose-pine").setup({
-- 	--- @usage 'main' | 'moon'
-- 	dark_variant = "main",
-- 	bold_vert_split = false,
-- 	dim_nc_background = false,
-- 	disable_background = true,
-- 	disable_float_background = false,
-- 	disable_italics = true,
--
-- 	--- @usage string hex value or named color from rosepinetheme.com/palette
-- 	groups = {
-- 		background = "#101010",
-- 		panel = "#282828",
-- 		border = "highlight_med",
-- 		comment = "muted",
-- 		link = "iris",
-- 		punctuation = "subtle",
--
-- 		error = "love",
-- 		hint = "iris",
-- 		info = "foam",
-- 		warn = "gold",
--
-- 		headings = {
-- 			h1 = "iris",
-- 			h2 = "foam",
-- 			h3 = "rose",
-- 			h4 = "gold",
-- 			h5 = "pine",
-- 			h6 = "foam",
-- 		},
-- 		-- or set all headings at once
-- 		-- headings = 'subtle'
-- 	},
--
-- 	-- Change specific vim highlight groups
-- 	highlight_groups = {
-- 		ColorColumn = { bg = "rose" },
-- 	},
-- })
-- require('base16-colorscheme').setup({
--      base00 = '#121212', base01 = '#2a2827', base02 = '#504945', base03 = '#5a524c',
--      base04 = '#bdae93', base05 = '#e8c68b', base06 = '#ebdbb2', base07 = '#fbf1c7',
--      base08 = '#c9c0b7', base09 = '#e78a4e', base0A = '#d8a657', base0B = '#a9b665',
--      base0C = '#89b482', base0D = '#7daea3', base0E = '#d3869b', base0F = '#bd6f3e'
--     })
-- setup must be called before loading the colorscheme
-- Default options:
vim.cmd("let g:gruvbox_material_background = 'hard'")
-- vim.cmd("let g:gruvbox_material_transparent_background=1")
vim.cmd("let g:gruvbox_material_better_performance = 1")
vim.cmd("let g:gruvbox_material_foreground = 'material'")

vim.cmd("colorscheme gruvbox-material")
