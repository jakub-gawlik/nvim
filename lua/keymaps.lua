local keymap = vim.keymap

keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Select all with Ctrl + a
keymap.set("n", "<C-a>", "gg<S-v>G")

-- New tab
keymap.set("n", "te", ":tabedit")

-- Toggle Neotree
keymap.set("n", "<leader>e", ":Neotree reveal<CR>", { silent = true })

-- Saving with CTRL+silent
keymap.set("n", "<C-s>", ":update<CR>")
keymap.set("i", "<C-s>", "<C-O>:update<CR>")
keymap.set("v", "<C-s>", "<C-C>:update<CR>")

-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w")
keymap.set("n", "sv", ":vsplit<Return><C-w>w")

-- Movements
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "*", "*zz")
-- keymap.set("n", "zc", "zczt")
-- keymap.set("n", "zo", "zozt")
keymap.set("n", "zO", "zOzt")

-- Navigate buffers and tabs
keymap.set("n", "<S-q>", ":bd<CR>")

-- Use Leader + number to move to window
for i = 1, 6 do
	local lhs = "<Leader>" .. i
	local rhs = i .. "<C-W>w"
	keymap.set("n", lhs, rhs, { desc = "Move to Window " .. i })
end

-- Resize buffers
keymap.set("n", "<C-Up>", ":resize -2<CR>")
keymap.set("n", "<C-Down>", ":resize +2<CR>")
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

keymap.set("n", "<CR>", "ciw")
keymap.set("n", "<BS>", 'ci')


-- Remove highlight
keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>")

-- Better paste
keymap.set("v", "p", '"_dP')

-- Stay in indent mode when indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Remap for dealing with word wrap
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Easy insertion of a trailing ; or , from insert mode.
keymap.set('i', ';;', '<Esc>A;<Esc>')
keymap.set('i', ',,', '<Esc>A,<Esc>')


keymap.set('n', '<leader>q', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
keymap.set('n', '<leader>mp', ':MarkdownPreviewToggle<CR>', { desc = 'Toogle Markdown Preview' })
keymap.set('n', '<leader>z', ':ZenMode<CR>', { desc = 'Toogle ZenMode' })
