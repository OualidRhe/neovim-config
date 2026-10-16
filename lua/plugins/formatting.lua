return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                javascript = { "prettierd" },
                javascriptreact = { "prettierd" },
                typescript = { "prettierd" },
                typescriptreact = { "prettierd" },
                json = { "prettierd" },
                html = { "prettierd" },
                css = { "prettierd" },
                markdown = { "prettierd" },
                yaml = { "prettierd" },
                python = { "ruff_organize_imports", "ruff_format" },
                sql = { "sql_formatter" },
            },
            formatters = {
                sql_formatter = {
                    prepend_args = { "-l", "postgresql" },
                },
            },
            format_on_save = {
                timeout_ms = 2000,
                lsp_format = "fallback",
            },
        })
    end,
}
