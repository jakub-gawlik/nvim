-- return {
-- 	"rebelot/kanagawa.nvim",
-- 	config = function()
-- 		require("kanagawa").setup({
-- 			compile = false,
-- 			undercurl = true,
-- 			commentStyle = { italic = true },
-- 			functionStyle = {},
-- 			keywordStyle = { italic = true },
-- 			statementStyle = { bold = true },
-- 			typeStyle = {},
-- 			transparent = true,
-- 			dimInactive = false,
-- 			terminalColors = true,
-- 			colors = {
-- 				palette = {},
-- 				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
-- 			},
-- 			overrides = function(colors)
-- 				return {}
-- 			end,
-- 			theme = "wave",
-- 			background = {
-- 				dark = "wave",
-- 				light = "lotus",
-- 			},
-- 		})
--
-- 		vim.cmd("colorscheme kanagawa")
-- 	end,
-- }

return {
	"olimorris/onedarkpro.nvim",
	priority = 1000,
	config = function()
		require("onedarkpro").setup({
			styles = {
				comments = "italic",
				functions = "italic",
			},
		})

		vim.cmd("colorscheme onedark")
	end,
}
