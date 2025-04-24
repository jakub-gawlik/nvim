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
            vim.opt.formatoptions = 'jcroqlnt'
            vim.opt.textwidth = 120
        end,
    }
)
