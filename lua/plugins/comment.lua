return {
	"numToStr/Comment.nvim",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		require("Comment").setup({
			pre_hook = function()
				return require("ts_context_commentstring.internal").calculate_commentstring()
			end,
		})
	end,
}
