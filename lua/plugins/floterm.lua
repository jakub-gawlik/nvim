return {
	"voldikss/vim-floaterm",
	config = function()
		vim.g.floaterm_width = 0.9
		vim.g.floaterm_height = 0.9
		vim.keymap.set("n", "<F1>", ":FloatermToggle<CR>")
		vim.keymap.set("t", "<F1>", "<C-\\><C-n>:FloatermToggle<CR>")
	end,
}
