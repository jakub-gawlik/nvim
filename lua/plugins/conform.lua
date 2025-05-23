return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			format_on_save = {
				timeout_ms = 2000,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				bash = { "shfmt" },
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				vue = { "prettier" },
				php = { "php-cs-fixer" },
				markdown = { "prettier" },
				python = { "autopep8" },
			},
			formatters = {
				autopep8 = {
					prepend_args = { "--indent-size", "2" },
				},
			},
		})
	end,
}
