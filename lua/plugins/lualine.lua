return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = false,
				theme = "iceberg_dark",
				component_separators = "|",
				section_separators = "",
				disabled_filetypes = {},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{
						"filename",
						file_status = true,
						path = 1,
					},
				},
				lualine_c = {},
				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
					},
				},
				lualine_y = {},
				lualine_z = { "branch" },
			},
			inactive_sections = {
				lualine_a = { "window" }, -- 'window' was not quoted
				lualine_b = {
					{
						"filename",
						file_status = true,
						path = 0,
					},
				},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
