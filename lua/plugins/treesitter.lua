return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"astro",
				"bash",
				"css",
				"gitignore",
				"go",
				"html",
				"http",
				"javascript",
				"json",
				"lua",
				"php",
				"python",
				"scss",
				"sql",
				"tsx",
				"markdown",
				"typescript",
				"vim",
				"vimdoc",
				"vue",
				"yaml",
			},
			sync_install = false,
			modules = {
				"astro",
				"bash",
				"css",
				"gitignore",
				"go",
				"html",
				"http",
				"javascript",
				"json",
				"lua",
				"php",
				"python",
				"scss",
				"sql",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"vue",
				"yaml",
			},
			auto_install = true,
			ignore_install = {},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
		})
	end,
}
