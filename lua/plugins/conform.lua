return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				bash = { "shfmt" },
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				vue = { "prettier" },
				php = { "php-cs-fixer" },
			},
		})
	end,
}
