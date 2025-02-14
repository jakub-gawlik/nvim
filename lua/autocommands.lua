local api = vim.api

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Enable spell checking for certain file types
api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    -- { pattern = { "*.txt", "*.md", "*.tex" }, command = [[setlocal spell<cr> setlocal spelllang=en,de<cr>]] }
    {
        pattern = { "*.txt", "*.md", "*.tex" },
        callback = function()
            vim.opt.spell = true
            vim.opt.spelllang = "en"
        end,
    }
)

-- Function to resize window to 80% of total width
local function resize_to_80_percent()
    local total_width = vim.o.columns
    local target_width = math.floor(total_width * 0.8)
    local win_id = vim.api.nvim_get_current_win()
    
    -- Get all windows
    local wins = vim.api.nvim_tabpage_list_wins(0)
    
    -- First make all windows equal
    vim.cmd('wincmd =')
    
    -- Then resize current window
    vim.api.nvim_win_set_width(win_id, target_width)
end

-- Create autocmd for automatic resizing on window enter
vim.api.nvim_create_autocmd("WinEnter", {
    group = vim.api.nvim_create_augroup("ResizeWindow", { clear = true }),
    callback = function()
        -- Small delay to ensure proper resizing
        vim.defer_fn(resize_to_80_percent, 0)
    end,
})
