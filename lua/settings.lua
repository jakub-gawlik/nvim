vim.o.hlsearch = false
vim.wo.number = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.completeopt = "menuone,noselect"
vim.o.termguicolors = true
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.autoindent = true
vim.opt.background = "dark"
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.backup = false
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.cmdheight = 1
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.equalalways = true
vim.opt.hlsearch = true
vim.opt.inccommand = "split"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.laststatus = 2
vim.opt.path:append({ "**" })
vim.opt.pumblend = 5
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.shell = "zsh"

-- Disabled for now as it conflicts with telescopes' browser extension plugin and folds files when foldlevel set to 0
-- Issue raised upstream: https://github.com/nvim-telescope/telescope-file-browser.nvim/issues/249#issuecomment-1471500450
vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  command = "setlocal nofoldenable",
})

vim.opt.showcmd = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.title = true
vim.opt.wildignore:append({ "*/node_modules/*", "*/vendor/*", "*/.git/*", "*/.DS_Store", "*/tmp/*" })
vim.opt.wildoptions = "pum"
vim.opt.winblend = 0
vim.opt.wrap = false

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Remember folds
vim.cmd([[
	augroup remember_folds
		autocmd!
		autocmd BufWinLeave * if expand('%:p') !=# '' | mkview | endif
		autocmd BufWinEnter * silent! loadview
	augroup END
]]) -- Remember folds

-- Toggle buffer auto resize on focus
local auto_resize_enabled = false
-- Function to resize window to 80% of total width
local function resize_to_80_percent()
  local total_width = vim.o.columns
  local target_width = math.floor(total_width * 0.8)
  local win_id = vim.api.nvim_get_current_win()

  -- Get all windows
  local wins = vim.api.nvim_tabpage_list_wins(0)

  -- First make all windows equal
  vim.cmd("wincmd =")

  -- Then resize current window
  vim.api.nvim_win_set_width(win_id, target_width)
end

-- Function to toggle the auto-resize functionality
local function toggle_auto_resize()
  auto_resize_enabled = not auto_resize_enabled

  if auto_resize_enabled then
    -- Create the autocommand when enabled
    vim.api.nvim_create_autocmd("WinEnter", {
      group = vim.api.nvim_create_augroup("ResizeWindow", { clear = true }),
      callback = function()
        vim.defer_fn(resize_to_80_percent, 0)
      end,
    })
    print("Auto-resize enabled")
  else
    -- Clear the autocommand when disabled
    vim.api.nvim_clear_autocmds({ group = "ResizeWindow" })
    print("Auto-resize disabled")
  end
end

-- Set up the keybinding (example using <leader>tr for "toggle resize")
vim.keymap.set("n", "<leader>tr", toggle_auto_resize, { noremap = true, silent = true, desc = "Toggle auto-resize" })
