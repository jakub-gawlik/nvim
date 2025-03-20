return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")

		-- Custom action to open multiple files
		local open_selected = function(prompt_bufnr, mode)
			local picker = action_state.get_current_picker(prompt_bufnr)
			if not picker then
				return
			end
			local multi_selection = picker:get_multi_selection()

			-- If nothing was selected, just open the single selection
			if #multi_selection == 0 then
				local entry = action_state.get_selected_entry()
				if not entry then
					return
				end
				actions.close(prompt_bufnr)
				if mode == "vertical" then
					vim.cmd("vsplit")
				elseif mode == "horizontal" then
					vim.cmd("split")
				end
				vim.cmd(string.format("edit %s", entry.path))
				return
			end

			-- Open multi-selections
			actions.close(prompt_bufnr)
			for _, entry in ipairs(multi_selection) do
				if mode == "vertical" then
					vim.cmd("vsplit")
				elseif mode == "horizontal" then
					vim.cmd("split")
				end
				vim.cmd(string.format("edit %s", entry.path))
			end
		end

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<Tab>"] = actions.toggle_selection,
						["<CR>"] = actions.select_default,
						["<C-v>"] = function(prompt_bufnr)
							open_selected(prompt_bufnr, "vertical")
						end,
						["<C-x>"] = function(prompt_bufnr)
							open_selected(prompt_bufnr, "horizontal")
						end,
						["<C-o>"] = function(prompt_bufnr)
							open_selected(prompt_bufnr, "buffer")
						end,
					},
					n = {
						["<Tab>"] = actions.toggle_selection,
						["<CR>"] = actions.select_default,
						["<C-v>"] = function(prompt_bufnr)
							open_selected(prompt_bufnr, "vertical")
						end,
						["<C-x>"] = function(prompt_bufnr)
							open_selected(prompt_bufnr, "horizontal")
						end,
						["<C-o>"] = function(prompt_bufnr)
							open_selected(prompt_bufnr, "buffer")
						end,
					},
				},
			},

			pickers = {
				buffers = {
					show_all_buffers = true,
					sort_lastused = true,
					theme = "dropdown",
					previewer = false,
					mappings = {
						i = {
							["<c-d>"] = "delete_buffer",
						},
					},
				},
			},
		})
		--
		local status = pcall(require, "telescope")
		if not status then
			return
		end
		vim.keymap.set("n", ";f", function()
			require("telescope.builtin").find_files({
				hidden = true, -- This option enables showing hidden files
			})
		end, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", ";s", require("telescope.builtin").git_status, { desc = "Git Status" })
		vim.keymap.set("n", ";h", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", ";w", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", ";g", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", ";d", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set(
			"n",
			"<F2>",
			'<cmd>lua require"telescope.builtin".lsp_definitions({jump_type="vsplit"})<CR>',
			{ noremap = true, silent = true }
		)
		vim.keymap.set("n", "<F3>", require("telescope.builtin").lsp_implementations, { desc = "Implementations" })
		vim.keymap.set("n", "<F4>", require("telescope.builtin").lsp_document_symbols, { desc = "Document Symbols" })
		vim.keymap.set("n", "<F5>", require("telescope.builtin").lsp_references, { desc = "References" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
		vim.keymap.set(
			"n",
			"<leader>?",
			require("telescope.builtin").oldfiles,
			{ desc = "[?] Find recently opened files" }
		)
		vim.keymap.set(
			"n",
			"<leader><space>",
			require("telescope.builtin").buffers,
			{ desc = "[ ] Find existing buffers" }
		)
		vim.keymap.set("n", "//", function()
			require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })
	end,
}
