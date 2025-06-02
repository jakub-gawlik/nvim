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
        php = { "php_cs_fixer" },
        markdown = { "prettier" },
        python = { "ruff_format" },
      },
      formatters = {
        php_cs_fixer = {
          command = "php-cs-fixer",
          args = { "fix", "$FILENAME" },
          stdin = false,
        }
      },
    })
  end,
}
